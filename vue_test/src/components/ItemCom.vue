<template>
  <li class="demo">
    <input type="checkbox" :checked="item.done" @click="change()" />
    <span>{{ item.title }}</span>
  </li>
</template>

<script>
export default {
  name: "ItemCom",
  methods: {
    change() {
      this.changeItem(this.item.id);
    },
  },
  props: ["item", "changeItem"],
};
</script>

<style scope>
.demo {
  background-color: white;
  padding: 10px;
}
</style>