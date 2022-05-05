<template>
  <div>
    <input
      type="text"
      placeholder="请输入后回车添加"
      v-model="inputValue"
      @keyup.enter="addOneTodo()"
    />
  </div>
</template>

<script>
export default {
  name: "HeaderCom",
  data() {
    return {
      inputValue: "",
    };
  },
  methods: {
    addOneTodo() {
      this.addOne(this.inputValue);
      this.inputValue = ""
    },
  },
  props: ["addOne"],
};
</script>

<style scoped>
div {
  background: antiquewhite;
}
</style>