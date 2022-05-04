<template>
  <div class="demo">
    <h3>{{ name }}</h3>
    <h3>{{ add }}</h3>
    <button @click="showName">点我提示学习名称</button>
  </div>
</template>

<script>

export default {
  // name: "School",
  data() {
    return {
      name: "好学校",
      add: "好地址",
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
  background-color: orange;
}
</style>