<template>
  <div class="demo">
    <h3>{{ name }}</h3>
    <h3>{{ age + 1 }}</h3>
    <button @click="showName">点我提示学生名称</button>
  </div>
</template>

<script>

export default {
  name: "StudentCom",
  data() {
    return {
    };
  },
  methods: {
      showName() {
          alert(this.name)
      }
  },
  props:['name', 'age']
};
</script>

<style scope>
.demo {
  background-color: gray;
}
</style>