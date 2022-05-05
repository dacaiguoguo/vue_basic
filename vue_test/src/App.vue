<template>
  <div>
    <HeaderCom name="HeaderCom" :addOne="addOne"></HeaderCom>
    <hr />
    <ListCom name="ListCom" :todoList="todoList"></ListCom>
    <hr />
    <FooterCom name="FooterCom"></FooterCom>
  </div>
</template>

<script>
import HeaderCom from "./components/HeaderCom.vue";
import ListCom from "./components/ListCom.vue";
import FooterCom from "./components/FooterCom.vue";
export default {
  name: "App",
  data() {
    return {
      todoList: [
        { id: "001", title: "吃饭", done: true },
        { id: "002", title: "睡觉", done: false },
        { id: "003", title: "喝水", done: true },
      ],
    };
  },
  methods: {
    addOne(inputVal, event) {
      console.log("addOne", inputVal, event.target.value);
      this.todoList.unshift({ id: "00" + String(this.todoList.length + 1), title: inputVal, done: false })
    },
  },
  components: {
    FooterCom,
    ListCom,
    HeaderCom,
  },
};
</script>