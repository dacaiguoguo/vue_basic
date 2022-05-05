<template>
  <div class="demo">
    <ul>
      <ItemCom
        v-for="todoitem in todos"
        :key="todoitem.id"
        :item="todoitem"
        :changeItem="changeItem"
      ></ItemCom>
    </ul>
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
      todos: [
        { id: "001", title: "吃饭", done: true },
        { id: "002", title: "睡觉", done: false },
        { id: "003", title: "喝水", done: true },
      ],
    };
  },
  props: ["todoList", "deleteItem"],
  methods: {
    changeItem(eitem) {
      console.log('changeItem', eitem);
      eitem.done = !eitem.done
    },
  },
};
</script>

<style lang="css">
.item {
  border: 1px solid #ddd;
  padding: 5px;
  margin-top: 3px;
}
</style>