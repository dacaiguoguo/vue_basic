<template>
  <div>
    <h3>学校名 {{ schoolName }}</h3>
    <button @click="giveName">传递给父组件事件</button>
  </div>
</template>

<script>
export default {
  name: "SchoolCom",
  data() {
    return {
      schoolName: "好学校",
    };
  },
  props: ["getSchoolName"],
  methods: {
    giveName() {
      this.getSchoolName(this.schoolName);
    },
  },
};
</script>

