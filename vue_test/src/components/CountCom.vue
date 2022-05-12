<template>
  <div>
    <label for="pet-select">选择一个加数:</label>
    <select name="pets" id="pet-select" v-model.number="n">
      <option :value="1">1</option>
      <option :value="2">2</option>
      <option :value="3">3</option>
      <option :value="4">4</option>
      <option :value="5">5</option>
    </select>
    <button @click="addAction">点我加一下</button>
    <button @click="addOddAction">奇数加一下</button>
    <button @click="addWaitAction">延时加一下</button>
    <h3>当前和为：{{ $store.state.sum }}</h3>
  </div>
</template>

<script>
export default {
  name: "CountCom",
  data() {
    return {
      n: 1,
    };
  },
  methods: {
    addAction() {
      this.$store.dispatch("jia", this.n);
    },
    addOddAction() {
      this.$store.dispatch("jiaOdd", this.n);
    },
    addWaitAction() {
      this.$store.dispatch("jiaWait", this.n);
    },
  },
};
</script>

<style>
button {
  margin-left: 15px;
}
</style>