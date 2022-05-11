<template>
  <div class="demo">
    <ul>
      <ItemCom
        v-for="item in info.todoList"
        :key="item.login"
        :item="item"
      ></ItemCom>
    </ul>
    <h1 v-show="info.isFirst">你好啊</h1>
    <h1 v-show="info.isLoading">加载中......</h1>
    <h1 v-show="info.errMsg">{{info.errMsg}}</h1>
  </div>
</template>

<script>
import ItemCom from "./ItemCom";

export default {
  name: "ListCom",
  components: {
    ItemCom,
  },
  data() {
    return {
      info:{
        todoList: [],
        isFirst:true,
        isLoading: false,
        errMsg: ''
      }
    };
  },
  methods: {
    resiveData(obj) {
      console.log(obj)
      this.info = obj
    }
  },
  mounted() {
    this.$bus.$on("addOne", this.resiveData);
  },
};
</script>

<style lang="css" scoped>
.item {
  border: 1px solid #ddd;
  padding: 5px;
  margin-top: 3px;
}
</style>