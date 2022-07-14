<template>
  <div class="hello">
    <button @click="callHandler">测试调用native方法</button>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  methods: {
    async callHandler(){
      console.log("###", this);
      //window.webkit.messageHandlers.lvJSCallNativeHandler.postMessage({"parameter":{}, "methodName":"lvJSGetUserInfo", "callbackId": "3803280"});
      var promise = window.webkit.messageHandlers.lvJSCallNativeHandlerReply.postMessage({"parameter":{}, "methodName":"lvJSGetUserInfo", "callbackId": "3803280"});
      await promise;
      console.log("###111", promise);
      return promise;
      // wait prosms;const prosms = 

    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.hello {
  background: pink;
}
button {
  height: 100px;
  margin: 40px auto;
}
</style>
