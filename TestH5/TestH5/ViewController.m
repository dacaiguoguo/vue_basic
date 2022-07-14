//
//  ViewController.m
//  TestH5
//
//  Created by yanguo sun on 2022/7/14.
//

#import "ViewController.h"
@import WebKit;
@interface ViewController ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandlerWithReply>
@property (strong, nonatomic) WKWebView *mainWebview;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;

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
    [userContentController addScriptMessageHandlerWithReply:self contentWorld:[WKContentWorld pageWorld] name:@"lvJSCallNativeHandlerReply"];
    config.userContentController = userContentController;

    self.mainWebview = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.mainWebview.UIDelegate = self;
    self.mainWebview.navigationDelegate = self;
    self.mainWebview.allowsBackForwardNavigationGestures = YES;
    self.mainWebview.opaque = NO;
    self.mainWebview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainWebview];
    [self.view bringSubviewToFront:self.progressView];
    [self.mainWebview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.mainWebview addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.mainWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.52.2.69:8080"]]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (self.mainWebview.estimatedProgress < 0.15) {
            self.progressView.progress = 0.15;
        } else {
            self.progressView.progress = self.mainWebview.estimatedProgress;
        }
    }
    if ([keyPath isEqualToString:@"title"]) {
        self.title = self.mainWebview.title;
    }
}

//didFinish
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    self.progressView.hidden = YES;
}

// didFaild
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    self.progressView.hidden = YES;
    //    [self.view lv_showNoneViewWithCustomButtonCallback:nil noticeTitle:@"网络异常" customButton:nil];
}

#pragma mark - WKScriptMessageHandlerWithReply
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
    if ([self respondsToSelector:methodSel]) {
        NSMethodSignature *methodSignature = [[self class] instanceMethodSignatureForSelector:methodSel];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        invocation.selector = methodSel;
        invocation.target = self;
        id parameter = dic[@"parameter"];
        BOOL validParameter = YES;
        if (parameter) {
            if (![parameter isKindOfClass:NSDictionary.class]) {
                validParameter = NO;
                replyHandler(nil, @"{\"status\": \"-3\",\"message\": \"parameter type is error\"}");
            } else {
                [invocation setArgument:&parameter atIndex:2];
                [invocation retainArguments];
            }
        }
        if (!validParameter) {
            return;
        }
        [invocation invoke];
        NSString *methodReturnTypeVoid = @"v";
        NSString *methodReturnTypeObject = @"@";
        NSString *methodReturnType  = @(methodSignature.methodReturnType);
        if ([methodReturnType isEqualToString:methodReturnTypeVoid]) {
            replyHandler(nil, @"{\"status\": \"-3\",\"message\": \"return type is void\"}");
        } else if([methodReturnType isEqualToString:methodReturnTypeObject]) {
            id __unsafe_unretained tempResultSet;
            [invocation getReturnValue:&tempResultSet];
            id returnValue = tempResultSet;
            replyHandler(returnValue, nil);
        } else {
            replyHandler(nil, @"{\"status\": \"-5\",\"message\": \"return type is base type\"}");
        }
    }
}

- (NSDictionary *)lvJSGetUserInfo:(NSDictionary *)pamas {
    return @{
        @"id": @"ewljl9fsl",
        @"name": @"xiaoqiang",
        @"age": @(18)
    };
}
@end
