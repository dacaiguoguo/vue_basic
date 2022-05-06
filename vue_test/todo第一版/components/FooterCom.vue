<template>
  <div>
    <label>全部完成：<input type="checkbox" v-model="isAll" /></label>
   已完成{{ doneNum }} /全部{{ allNUm }}
    <button @click="deleteAllDone">删除完成事件</button>
  </div>
</template>

<script>
export default {
  name: "FooterCom",
  props: ["doneNum", "allNUm", "checkAll", "clearAll"],
  methods: {
    deleteAllDone() {
      console.log('deleteAllDone')
      this.clearAll();
    },
  },
  computed: {
    isAll: {
      get() {
        return this.doneNum === this.allNUm;
      },
      set(value) {
        this.checkAll(value);
      },
    },
  },
};
</script>

