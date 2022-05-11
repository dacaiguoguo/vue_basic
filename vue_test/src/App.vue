<template>
  <div class="category">
    <CategoryCom title="美食" :dataList="dataList[0]"></CategoryCom>
    <CategoryCom title="游戏" :dataList="dataList[1]"></CategoryCom>
    <CategoryCom title="电影" :dataList="dataList[2]"></CategoryCom>
  </div>
</template>

<script>
import CategoryCom from "./components/CategoryCom";

export default {
  name: "App",
  data() {
    return {
      dataList:[
        ["麻辣烫", "烧烤", "红烧肉"],
        ["穿越火线", "跑跑卡丁车", "魔兽争霸"],
        ["霸王别姬", "肖申克的救赎", "建军大业"],
      ]
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
    CategoryCom,
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
</style>