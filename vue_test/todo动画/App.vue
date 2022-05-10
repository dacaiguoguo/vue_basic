<template>
  <div>
    <HeaderCom @addOne="addOne"></HeaderCom>
    <hr />
    <ListCom name="ListCom" :todoList="todoList"></ListCom>
    <hr />
    <FooterCom
      v-show="todoList.length"
      :doneNum="doneNum"
      :allNUm="todoList.length"
      @checkAll="checkAll"
      @clearAll="clearAll"
    ></FooterCom>
    <TestCom />
  </div>
</template>

<script>
import { nanoid } from "nanoid";
import PubSub from "pubsub-js";
import HeaderCom from "./components/HeaderCom.vue";
import ListCom from "./components/ListCom.vue";
import FooterCom from "./components/FooterCom.vue";
import TestCom from "./components/TestCom.vue";

export default {
  name: "App",
  data() {
    return {
      todoList: JSON.parse(window.localStorage.getItem("todos")) || [],
      // todoList: [
      //   { id: "001", title: "吃饭", done: true },
      //   { id: "002", title: "睡觉", done: false },
      //   { id: "003", title: "喝水", done: true },
      // ],
    };
  },
  methods: {
    addOne(value) {
      this.todoList.unshift({
        id: nanoid(),
        title: value,
        done: false,
      });
    },
    changeItem(eitemid) {
      this.todoList.forEach((item) => {
        if (item.id === eitemid) {
          item.done = !item.done;
        }
      });
    },
    deleteItem(eitemid) {
      this.todoList = this.todoList.filter((item) => {
        return item.id !== eitemid;
      });
    },
    checkAll(val) {
      this.todoList.forEach((item) => {
        item.done = val;
      });
    },
    clearAll() {
      this.todoList = this.todoList.filter((item) => {
        return !item.done;
      });
    },
  },
  computed: {
    doneNum() {
      return this.todoList.reduce((pre, todo) => pre + (todo.done ? 1 : 0), 0);
    },
  },
  watch: {
    todoList: {
      deep: true,
      handler(value) {
        window.localStorage.setItem("todos", JSON.stringify(value));
      },
    },
  },
  mounted() {
    this.$bus.$on("changeItem", this.changeItem);
    this.$bus.$on("deleteItem", this.deleteItem);
    this.pubid = PubSub.subscribe("hello", (msg, data) => {
      console.log("有人发布了hello事件");
      console.log(msg, data);
    });
  },
  beforeDestroy() {
    this.$bus.$off("changeItem");
    this.$bus.$off("deleteItem");
    PubSub.unsubscribe(this.pubid);
  },
  components: {
    FooterCom,
    ListCom,
    HeaderCom,
    TestCom,
  },
};
</script>

<style lang="css">
</style>