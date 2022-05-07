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
      if (this.inputValue.trim().length > 0) {
        this.$emit('addOne', this.inputValue.trim());
        this.inputValue = "";
      } else {
        alert('请输入内容后再回车')
      }
    },
  },
};
</script>

<style scoped>
div {
  background: antiquewhite;
}
</style>