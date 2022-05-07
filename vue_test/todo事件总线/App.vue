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
  </div>
</template>

<script>
import HeaderCom from "./components/HeaderCom.vue";
import ListCom from "./components/ListCom.vue";
import FooterCom from "./components/FooterCom.vue";
import { nanoid } from "nanoid";
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
      console.log(this.todoList);
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
  },
  beforeDestroy() {
    this.$bus.$off("changeItem");
    this.$bus.$off("deleteItem");
  },
  components: {
    FooterCom,
    ListCom,
    HeaderCom,
  },
};
</script>