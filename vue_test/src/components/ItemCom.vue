<template>
  <div class="demo">
    <h3>点我提示学生名称33</h3>
  </div>
</template>

<script>

export default {
  name: "ItemCom",
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