<template>
  <div class="demo">
    <ItemCom></ItemCom>
  </div>
</template>

<script>

import ItemCom from "./ItemCom";

export default {
  name: "ListCom",
  components:{
    ItemCom
  },
  data() {
    return {
    };
  },
  methods: {
      showName() {
          alert(this.name)
      }
  },
  // props:['name', 'age']
};
</script>

<style scope>
.demo {
  background-color: gray;
}
</style>