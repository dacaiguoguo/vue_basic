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
      addOne(inputVal, event) {
        console.log('addOne', inputVal, event.target.value)
      }
  },
  props:['name', 'age']
};
</script>

<style scoped>
    div {
        background: antiquewhite;
    }
</style>