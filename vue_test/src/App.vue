<template>
  <div class="category">
    <CategoryCom title="美食" :dataList="dataList[0]">
      <img
        src="http://wis-img1.lvmama.com/20220411/fecc3a09-9fe6-4075-8228-4435608ce1eb6136554755235628625.png"
        alt="image"
      />
    </CategoryCom>
    <CategoryCom title="游戏">
      <ul>
        <li v-for="(d, index) in dataList[1]" :key="index">{{ d }}</li>
      </ul>
    </CategoryCom>
    <CategoryCom title="电影" :dataList="dataList[2]">
      <ul>
        <li v-for="(d, index) in dataList[2]" :key="index">{{ d }}</li>
      </ul>
    </CategoryCom>
  </div>
</template>

<script>
import CategoryCom from "./components/CategoryCom";

export default {
  name: "App",
  data() {
    return {
      dataList: [
        ["麻辣烫", "烧烤", "红烧肉"],
        ["穿越火线", "跑跑卡丁车", "魔兽争霸"],
        ["霸王别姬", "肖申克的救赎", "建军大业"],
      ],
    };
  },
  methods: {},
  computed: {},
  watch: {},
  mounted() {},
  beforeDestroy() {},
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
img {
  width: 100%;
}
</style>