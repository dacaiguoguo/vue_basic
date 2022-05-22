<template>
  <PlaceDetail />
</template>

<script>
import PlaceDetail from "./components/PlaceDetail";

export default {
  name: "App",
  methods: {},
  computed: {},
  data() {
    return {};
  },
  mounted() {
    console.log(this);
  },
  watch: {},
  beforeDestroy() {},
  components: { PlaceDetail },
};
</script>

<style lang="css">
</style>