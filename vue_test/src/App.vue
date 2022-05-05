<template>
<div>
  <HeaderCom name="HeaderCom"></HeaderCom>
  <hr/>
  <ListCom name="ListCom"></ListCom>
  <hr/>
  <FooterCom name="FooterCom"></FooterCom>
</div>
</template>

<script>
import HeaderCom from "./components/HeaderCom.vue";
import ListCom from "./components/ListCom.vue";
import FooterCom from "./components/FooterCom.vue";
export default {
  name: "App",
  components: {
    FooterCom,
    ListCom,
    HeaderCom
  },
};
</script>