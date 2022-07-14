//
//  ViewController.m
//  TestH5
//
//  Created by yanguo sun on 2022/7/14.
//

#import "ViewController.h"
@import WebKit;
@interface ViewController ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler, WKScriptMessageHandlerWithReply>
@property (strong, nonatomic) WKWebView *mainWebview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WKWebsiteDataStore *dataStore = [WKWebsiteDataStore defaultDataStore];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.websiteDataStore = dataStore;
    config.allowsInlineMediaPlayback = YES;
    config.processPool = [[WKProcessPool alloc] init];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
//    [config.userContentController addScriptMessageHandler:self name:@"lvJSCallNativeHandler"];
    [userContentController addScriptMessageHandlerWithReply:self contentWorld:[WKContentWorld pageWorld] name:@"lvJSCallNativeHandlerReply"];
    config.userContentController = userContentController;

    self.mainWebview = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.mainWebview.UIDelegate = self;
    self.mainWebview.navigationDelegate = self;
    self.mainWebview.allowsBackForwardNavigationGestures = YES;
    self.mainWebview.opaque = NO;
    self.mainWebview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainWebview];
    [self.mainWebview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.mainWebview addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    // - (void)addScriptMessageHandlerWithReply:(id <WKScriptMessageHandlerWithReply>)scriptMessageHandlerWithReply contentWorld:(WKContentWorld *)contentWorld name:(NSString *)name API_AVAILABLE(macos(11.0), ios(14.0));
    [self.mainWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.52.2.69:8080"]]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (self.mainWebview.estimatedProgress < 0.15) {
            //self.progressView.progress = 0.15;
        } else {
            //self.progressView.progress = self.contentWebView.estimatedProgress;
        }
    }
    if ([keyPath isEqualToString:@"title"]) {
        self.title = self.mainWebview.title;
    }
}
#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if (![message.name isEqualToString:@"lvJSCallNativeHandler"]) {
        return;
    }
    NSDictionary *dic = nil;
    if ([message.body isKindOfClass:NSString.class]) {
        NSString *bodyString = message.body;
        id object = [NSJSONSerialization JSONObjectWithData:[bodyString dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:NSJSONReadingAllowFragments | NSJSONReadingMutableContainers
                                                      error:nil];
        if ([object isKindOfClass:NSDictionary.class]) {
            dic = object;
        }
    } else if ([message.body isKindOfClass:NSDictionary.class]) {
        dic = message.body;
    }
    if (!dic) {
        return;
    }
    NSString *methodName = dic[@"methodName"];
    if (!methodName) {
        return;
    }
    if (![methodName hasSuffix:@":"]) {
        methodName = [methodName stringByAppendingString:@":"];
    }
    SEL methodSel = NSSelectorFromString(methodName);
    if ([self respondsToSelector:methodSel]) {
        NSMethodSignature *methodSignature = [[self class] instanceMethodSignatureForSelector:methodSel];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        invocation.selector = methodSel;
        invocation.target = self;
        id parameter = dic[@"parameter"];
        if (parameter) {
            [invocation setArgument:&parameter atIndex:2];
            [invocation retainArguments];
        }
        [invocation invoke];
        NSString *methodReturnTypeVoid = @"v";
        NSString *methodReturnTypeObject = @"@";
        NSString *methodReturnType = @(methodSignature.methodReturnType);
        if ([methodReturnType isEqualToString:methodReturnTypeVoid]) {
            [self excuteJSCallbackFunction:dic returnValue:@"{\"status\": \"-3\",\"message\": \"return type is void\"}"];
        } else if ([methodReturnType isEqualToString:methodReturnTypeObject]) {
            id __unsafe_unretained tempResultSet;
            [invocation getReturnValue:&tempResultSet];
            id returnValue = tempResultSet;
            [self excuteJSCallbackFunction:dic returnValue:[self jsCallBackJsonWithReturnValue:returnValue]];
        } else {
            [self excuteJSCallbackFunction:dic returnValue:@"{\"status\": \"-5\",\"message\": \"return type is base type\"}"];
        }
    }
}

- (void)excuteJSCallbackFunction:(NSDictionary *)methodDic returnValue:(NSString *)returnValue {
    returnValue = [self replaceStringOccurrences:returnValue];
    [self.mainWebview evaluateJavaScript:[NSString stringWithFormat:@"window.call && call('%@','%@','%@');", returnValue, methodDic[@"methodName"] ?: @"", methodDic[@"callbackId"] ?: @""] completionHandler:nil];
}

- (NSString *)jsCallBackJsonWithReturnValue:(id)returnValue {
    if (returnValue) {
        @try {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:returnValue options:NSJSONWritingPrettyPrinted error:NULL];
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            if (jsonData) {
                return json;
            } else {
                return @"{\"status\": \"-4\",\"message\": \"parse error\"}";
            }
        } @catch (NSException *exception) {
            return @"{\"status\": \"-2\",\"message\": \"parse exception error\"}";
        }
    }
    return @"{\"status\": \"1\",\"returnValue\":{}}";
}

- (NSString *)replaceStringOccurrences:(NSString *)jsonString {
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\'" withString:@"\\\'"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\f" withString:@"\\f"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\u2028" withString:@"\\u2028"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\u2029" withString:@"\\u2029"];
    return jsonString;
}

//didFinish
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
//    [self setupProgressViewHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

// didFaild
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
//    [self setupProgressViewHidden:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    [self.view lv_showNoneViewWithCustomButtonCallback:nil noticeTitle:@"网络异常" customButton:nil];
}
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message
                 replyHandler:(void (^)(id _Nullable reply, NSString *_Nullable errorMessage))replyHandler {
    if (![message.name isEqualToString:@"lvJSCallNativeHandlerReply"]) {
        return;
    }
    NSDictionary *dic = nil;
    if ([message.body isKindOfClass:NSString.class]) {
        NSString *bodyString = message.body;
        id object = [NSJSONSerialization JSONObjectWithData:[bodyString dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:NSJSONReadingAllowFragments | NSJSONReadingMutableContainers
                                                      error:nil];
        if ([object isKindOfClass:NSDictionary.class]) {
            dic = object;
        }
    } else if ([message.body isKindOfClass:NSDictionary.class]) {
        dic = message.body;
    }
    if (!dic) {
        return;
    }
    NSString *methodName = dic[@"methodName"];
    if (!methodName) {
        return;
    }
    if (![methodName hasSuffix:@":"]) {
        methodName = [methodName stringByAppendingString:@":"];
    }
    SEL methodSel = NSSelectorFromString(methodName);
    replyHandler(@42, nil);
}

- (void)lvJSGetUserInfo:(NSDictionary *)pamas {

}
@end
