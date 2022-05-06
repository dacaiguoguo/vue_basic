<template>
  <div>
    <h2>{{ msg }}</h2>
    <hr />
    <SchoolCom :getSchoolName="getSchoolName"></SchoolCom>
    <StudentCom v-on:focus="getStudentName"></StudentCom>
    <!-- <StudentCom @aiguigu="getStudentName"></StudentCom> -->
    <!-- <StudentCom ref="student" studentName="测试同学"></StudentCom> -->
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
  // mounted() {
  //   // this.$refs.student.$on("atguigu", function (aaabbb) {
  //   //   console.log("aaaa");
  //   //   this.getStudentName(aaabbb);
  //   // });
  //   this.$refs.student.$on("atguigu",this.getStudentName);
  //   // this.$refs.student.$once("atguigu", this.getStudentName);
  // },
};
</script>