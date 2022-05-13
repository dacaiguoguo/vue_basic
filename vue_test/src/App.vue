<template>
  <div class="category">
    <h3>Hello</h3>
    <HomeCom></HomeCom>
    <hr />
    <AboutCom></AboutCom>

    <div class="row">
      <div class="col-xs-2 col-xs-offset-2">
        <div class="list-group">
          <a class="list-group-item active" href="">About</a>
          <a class="list-group-item" href="">Home</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import HomeCom from "./components/HomeCom";
import AboutCom from "./components/AboutCom";

export default {
  name: "App",
  methods: {},
  computed: {},
  mounted() {},
  watch: {},
  beforeDestroy() {},
  components: {
    HomeCom,
    AboutCom,
  },
};
</script>

<style lang="css">
</style>