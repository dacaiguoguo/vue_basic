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
  props: ["doneNum", "allNUm"],
  methods: {
    deleteAllDone() {
      console.log('deleteAllDone')
      this.$emit('clearAll');
    },
  },
  computed: {
    isAll: {
      get() {
        return this.doneNum === this.allNUm;
      },
      set(value) {
        this.$emit('checkAll', value);
      },
    },
  },
};
</script>

