<template>
  <div>
    <input type="text" placeholder="请输入后回车添加" v-model="inputValue" v-on:keyup.enter="addOne(inputValue, $event)">
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
      addOne(inputVal) {
        console.log('addOne', inputVal)
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