<template>
  <div class="demo">
    <ul>
      <ItemCom
        v-for="todoitem in todoList"
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