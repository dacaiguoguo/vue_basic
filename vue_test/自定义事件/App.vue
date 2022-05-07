<template>
  <div>
    <h2>{{ msg }}</h2>
    <hr />
    <SchoolCom :getSchoolName="getSchoolName"></SchoolCom>
    <StudentCom v-on:atguigu="getStudentName" studentName="张三"></StudentCom>
    <StudentCom @atguigu="getStudentName" studentName="里斯"></StudentCom>
    <StudentCom ref="student" studentName="测试同学"></StudentCom>
  </div>
</template>

<script>
import SchoolCom from "./components/SchoolCom.vue";
import StudentCom from "./components/StudentCom.vue";

export default {
  name: "App",
  data() {
    return {
      msg: "你好啊！！！",
    };
  },
  methods: {
    getSchoolName(value) {
      console.log(value);
    },
    getStudentName(value) {
      console.log("getStudentName");
      console.log(value);
      // console.log(this.$refs.student);
    },
  },
  components: {
    SchoolCom,
    StudentCom,
  },
  mounted() {
    this.$refs.student.$on("atguigu",this.getStudentName);
    // this.$refs.student.$once("atguigu", this.getStudentName);
  },
};
</script>