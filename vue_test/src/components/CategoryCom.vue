<template>
  <div class="itemlist">
    <h3>{{ title }}</h3>
    <ul>
      <li v-for="(d, index) in dataList" :key="index">{{d}}</li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "CategoryCom",
  props: ["title", "dataList"],
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