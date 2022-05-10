<template>
  <div class="demo">
    <button @click="isShow = !isShow">点我变变</button>
    <transition name="hello">
      <h3 v-show="isShow">{{ msg }}</h3>
    </transition>
  </div>
</template>

<script>
export default {
  name: "TestCom",
  data() {
    return {
      msg: "你好啊都是雷锋精神",
      isShow: true,
    };
  },
};
</script>

<style lang="css" scoped>
h3 {
  background-color: orange;
}

.hello-enter-active {
  animation: atguigu 0.5s linear;
}

.hello-leave-active {
  animation: atguigu 0.5s linear reverse;
}

@keyframes atguigu {
  from {
    transform: translateX(-100%);
  }

  to {
    transform: translateX(0%);
  }
}
</style>