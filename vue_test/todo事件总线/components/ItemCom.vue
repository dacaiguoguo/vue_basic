<template>
  <li>
    <input type="checkbox" :checked="item.done" @click="change()" />
    <span>{{ item.title }}</span>
    <button class="deletebtn" @click="deleteAction">删除</button>
  </li>
</template>

<script>
export default {
  name: "ItemCom",
  methods: {
    change() {
      this.$bus.$emit('changeItem', this.item.id);
    },
    deleteAction() {
      if(confirm("你确认删除吗？")) {
        this.$bus.$emit('deleteItem', this.item.id);
      }
    }
  },
  props: ["item"],
};
</script>

<style scope>
li {
  list-style-type: none;
  height: 36px;
  line-height: 36px;
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