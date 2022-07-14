<template>
  <div class="hello">
    <button @click="callHandler">测试调用native方法</button>
    <p>{{ result }}</p>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  data() {
    return {
      result: "sfjlsfjl",
    };
  },
  methods: {
    async callHandler() {
      if (window.webkit != undefined) {
        var promise =
          window.webkit.messageHandlers.lvJSCallNativeHandlerReply.postMessage({
            parameter: {},
            methodName: "lvJSGetUserInfo",
            callbackId: "3803280",
          });
        const response = await promise;
        this.result = response;
        console.log("###", response);
      }
    },
  },
};
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
