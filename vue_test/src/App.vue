<template>
<div>
  <img src="./assets/logo.png" alt="logo">
  <SchoolCom></SchoolCom>
  <StudentCom name="张三" age="18"></StudentCom>
  <StudentCom name="王老五" :age="20"></StudentCom>
</div>
</template>

<script>
import SchoolCom from "./components/SchoolCom.vue";
import StudentCom from "./components/StudentCom.vue";
export default {
  name: "App",
  components: {
    SchoolCom,
    StudentCom,
  },
};
</script>

<style>
</style>