<template>
  <div class="demo">
    <input type="checkbox" v-model="done" @click="change()">
    <h3>{{item.title}}</h3>
  </div>
</template>

<script>

export default {
  name: "ItemCom",
  data() {
    return {
      done: this.item.done
    };
  },
  methods: {
      showName() {
          alert(this.name)
      }, 
      change() {
        console.log('item done', this.done)
        this.changeItem(this.item)
      }
  },
  props:['item', 'changeItem']
};
</script>

<style scope>
.demo {
  background-color: gray;
}
</style>