<template>
  <div>
    <input type="text" placeholder="请输入后回车添加" v-model="inputValue" @keyup.enter="addOne(inputValue, $event)">
  </div>
</template>

<script>

export default {
  name: "HeaderCom",
  data() {
    return {
      inputValue:""
    };
  },
  methods: {

  },
  props:['name', 'age', 'addOne']
};
</script>

<style scoped>
    div {
        background: antiquewhite;
    }
</style>