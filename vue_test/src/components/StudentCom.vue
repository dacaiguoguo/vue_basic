<template>
  <div class="demo">
    <h3>{{ name }}</h3>
    <h3>{{ age }}</h3>
    <button @click="showName">点我提示学生名称</button>
  </div>
</template>

<script>

export default {
  name: "StudentCom",
  data() {
    return {
      name: "好学生",
      age: 18
    };
  },
  methods: {
      showName() {
          alert(this.name)
      }
  }
};
</script>

<style scope>
.demo {
  background-color: gray;
}
</style>