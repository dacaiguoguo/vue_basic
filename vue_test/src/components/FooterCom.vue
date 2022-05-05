<template>
  <div>
    <label>all：<input type="checkbox" v-model="isAll" /></label>
   done{{ doneNum }} /total{{ allNUm }}
    <button @click="deleteAllDone">delete all done</button>
  </div>
</template>

<script>
export default {
  name: "FooterCom",
  props: ["doneNum", "allNUm", "checkAll", "deleteDoneItem"],
  methods: {
    deleteAllDone() {
      this.deleteDoneItem();
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

