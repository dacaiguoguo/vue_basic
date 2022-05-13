<template>
  <div class="category">
    <CountCom></CountCom>
    <hr/>
    <PersonCom/>
  </div>
</template>

<script>
import CountCom from "./components/CountCom";
import PersonCom from "./components/PersonCom";

export default {
  name: "App",
  methods: {},
  computed: {},
  mounted() {},
  watch: {},
  beforeDestroy() {},
  components: {
    CountCom,PersonCom
  },
};
</script>

<style lang="css">
.category {
  display: flex;
  justify-content: space-around;
  /* flex-direction: column;
  flex: auto; */
}
img {
  width: 100%;
  height: 100px;
}
</style>