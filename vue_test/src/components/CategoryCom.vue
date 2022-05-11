<template>
  <div class="itemlist">
    <h3>{{ title }}</h3>
    <slot name="midslot"></slot>
    <slot name="footer"></slot>
  </div>
</template>

<script>
export default {
  name: "CategoryCom",
  props: ["title"],
};
</script>

<style>
.itemlist {
  width: 200px;
  height: 300px;
  background-color: skyblue;
}
h3 {
  text-align: center;
  background-color: orange;
}
</style>