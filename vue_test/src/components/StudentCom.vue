<template>
  <div>
    <h3>学生名 {{ studentName }}</h3>
    <button @click="giveName">传递给父组件事件</button>
  </div>
</template>

<script>
export default {
  name: "StudentCom",
  // props:['studentName'],
  data() {
    return {
      studentName: '好打发时间'
    }
  },
  methods: {
    giveName() {
      this.$emit('atguigu', this.studentName)
      // this.$emit('atguigu', this.studentName);
      console.log('giveName')
      // 注意单引号是不行的 天坑啊
      // this.$emit('atguigu', this.studentName);
      // this.$emit('atguigu', '礼拜');
      // this.$emit("atguigu", this.studentName);
    },
  },
};
</script>

