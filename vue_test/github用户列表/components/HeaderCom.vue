<template>
  <div>
    <input type="text" placeholder="请输入" v-model="inputValue" />
    <button @click="searchAction">搜索</button>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "HeaderCom",
  data() {
    return {
      inputValue: "",
    };
  },
  methods: {
    searchAction() {
      if (this.inputValue.trim().length > 0) {
        this.$bus.$emit("addOne", {
          todoList: [],
          isFirst: false,
          isLoading: true,
          errMsg: "",
        });
        const tempUrl = `https://api.github.com/users?${this.inputValue.trim()}`
        console.log(tempUrl)
        axios
          .get(tempUrl)
          .then((res) => {
            this.$bus.$emit("addOne", {
              todoList: res.data,
              isFirst: false,
              isLoading: false,
              errMsg: "",
            });
          })
          .catch((err) => {
            console.log(err);
            this.$bus.$emit("addOne", {
              todoList: [],
              isFirst: false,
              isLoading: false,
              errMsg: "error",
            });
          });

        this.inputValue = "";
      } else {
        alert("请输入内容后再搜索");
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