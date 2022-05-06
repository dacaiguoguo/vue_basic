<template>
  <div>
    <h3>学生名 {{ studentName }}</h3>
    <button @click="giveName">传递给父组件事件</button>
  </div>
</template>

<script>
export default {
  name: "StudentCom",
  props:['studentName'],
  methods: {
    giveName() {
      this.$emit('atguigu', this.studentName)
      console.log('giveName')
      // 注意单引号是不行的 天坑啊  不是坑 原来是拼写错误了 aiguigu 和 atguigu
    },
  },
};
</script>

