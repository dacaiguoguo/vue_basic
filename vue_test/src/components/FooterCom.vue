<template>
  <div class="demo">
    <h3>{{ name }}</h3>
  </div>
</template>

<script>

export default {
  name: "FooterCom",
  data() {
    return {
    };
  },
  methods: {
      showName() {
          alert(this.name)
      }
  },
  props:['name', 'age']
};
</script>

<style scope>
.demo {
  background-color: gray;
}
</style>