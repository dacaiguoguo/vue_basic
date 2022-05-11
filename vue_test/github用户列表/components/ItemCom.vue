<template>
  <li>
    <a :href="item.html_url">
      {{ item.login }}
      <img :src="item.avatar_url" alt="avatar_url" width="66" />
    </a>
  </li>
</template>

<script>
import PubSub from "pubsub-js";
export default {
  name: "ItemCom",
  methods: {
    change() {
      this.$bus.$emit("changeItem", this.item.id);
    },
    deleteAction() {
      // publish a topic asynchronously
      PubSub.publish("hello", "hello world!");
      if (confirm("你确认删除吗？")) {
        this.$bus.$emit("deleteItem", this.item.id);
      }
    },
  },
  mounted() {},
  props: ["item"],
};
</script>

<style scope>
li {
  list-style-type: none;
  height: 66px;
  line-height: 66px;
  padding: 0 5px;
  border-bottom: 1px solid #ddd;
}
li label {
  float: left;
  cursor: pointer;
}

li button {
  float: right;
  display: none;
  margin-top: 3px;
  background-color: orange;
}

li img {
  float: right;
}

li:before {
  content: initial;
}

li:last-child {
  border-bottom: none;
}

li:hover {
  background-color: #ddd;
}
li:hover button {
  display: block;
}
</style>