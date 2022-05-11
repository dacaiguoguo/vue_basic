<template>
  <div>
    <HeaderCom></HeaderCom>
    <hr />
    <ListCom name="ListCom"></ListCom>
  </div>
</template>

<script>
import HeaderCom from "./components/HeaderCom.vue";
import ListCom from "./components/ListCom.vue";

export default {
  name: "App",
  data() {
    return {
    };
  },
  methods: {
    
  },
  computed: {

  },
  watch: {
    
  },
  mounted() {
    
  },
  beforeDestroy() {

  },
  components: {
    ListCom,
    HeaderCom,
  },
};
</script>

<style lang="css">
</style>