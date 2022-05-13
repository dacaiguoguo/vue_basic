<template>
  <div>
    <h3 style="color:red">CountCom求和为：{{ sum }}</h3>
    <input type="text" v-model="inputName" />
    <button @click="addPerson">添加</button>

    <ul>
      <li v-for="p in personList" :key="p.id">{{ p.name }}</li>
    </ul>
  </div>
</template>

<script>
import { nanoid } from "nanoid";
export default {
  name: "PersonCom",
  data() {
    return {
      inputName: "",
    };
  },
  computed: {
    // 靠程序员自己实现计算属性比较麻烦 需要用 mapState
    sum() {
      return this.$store.state.sum;
    },
    personList() {
      return this.$store.state.personList;
    },
  },
  methods: {
    addPerson() {
      const personObj = { id: nanoid(), name: this.inputName };
      this.$store.dispatch("addPerson", personObj);
      this.inputName = ""
    },
  },
};
</script>

<style>
button {
  margin-left: 15px;
}
</style>