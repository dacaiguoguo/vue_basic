<template>
  <div class="category">
    <CategoryCom title="美食" :dataList="dataList[0]">
      <img
        slot="midslot"
        src="http://img1.youqianshan.com/lego/back/202203/1647939594609.png"
        alt="image"
      />
      <img
        slot="footer"
        src="http://img2.youqianshan.com/lego/back/202203/1647939583850.png"
        alt="image"
      />
    </CategoryCom>
    <CategoryCom title="游戏">
      <ul slot="midslot">
        <li v-for="(d, index) in dataList[1]" :key="index">{{ d }}</li>
      </ul>
    </CategoryCom>
    <CategoryCom title="电影" :dataList="dataList[2]">
      <ol slot="midslot">
        <li v-for="(d, index) in dataList[2]" :key="index">{{ d }}</li>
      </ol>
      <template scope="{msg}">
        <h3>{{ msg }}</h3>
      </template>
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
  height: 100px;
}
</style>