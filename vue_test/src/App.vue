<template>
  <div class="app">
    <div class="nav">
      <div class="nav-header">
        <ul class="nav-ul">
          <li class="nav-li" v-for="(item, index) in navlist" :key="index">
            <a class="nav-a" href="#">{{ item }}</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="atmain">
      <div class="main">
        <div class="category-box">
          <ul class="category-ul">
            <li v-for="(item, index) in allcategory" :key="index">
              <a class="category-a" href="#">{{ item }}</a>
            </li>
          </ul>
        </div>
        <img src="./assets/q.jpg" alt=""/>
        <div class="login-box">

        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import BannerCom from "./components/BannerCom";

export default {
  name: "App",
  methods: {},
  computed: {},
  data() {
    return {
      navlist: [
        "秒杀",
        "优惠券",
        "PLUS会员",
        "品牌闪购",
        "拍卖",
        "京东家电",
        "京东超市",
        "京东生鲜",
      ], //, "京东国际", "京东云"
      allcategory: [
        "家用电器",
        "手机/运营商/数码",
        "电脑/办公",
        "家居/家具/家装/厨具",
        "男装/女装/童装/内衣",
        "美妆/个护清洁/宠物",
        "女鞋/箱包/钟表/珠宝",
        "男鞋/运动/户外",
        "房产/汽车/汽车用品",
        "母婴/玩具乐器",
        "食品/酒类/生鲜/特产",
        "艺术/礼品鲜花/农资绿植",
        "医药保健/计生情趣",
        "图书/文娱/教育/电子书",
        "机票/酒店/旅游/生活",
        "理财/众筹/白条/保险",
        "安装/维修/清洗/二手",
        "工业品",
      ],
    };
  },
  mounted() {
    console.log(this);
  },
  watch: {},
  beforeDestroy() {},
  components: {},
};
</script>

<style lang="css">
body {
  background-color: white;
}

.nav {
  border-bottom: 2px solid darkslategrey;
}

.atmain {
  background-color: #f4f4f4;
}
.main > img {
  float: left;
  border: 10px solid pink;
  width: 50%;
}
.main {
  width: 800px;
  margin: 0px auto;
  overflow: hidden;
  padding-top: 20px;
  /* border: 1px solid red; */
}

.nav-header {
  /* border: 1px solid green; */
  /* height: 50px; */
  overflow: hidden;
  width: 800px;
  margin: 0px auto;
  background-color: white;
}

.nav-ul {
  margin: 0px;
  padding: 0px;
}

.nav-li:first-child > a,
.nav-li:nth-child(2) > a {
  color: red;
}

.nav-li {
  padding: 20px;
  float: left;
}

.nav-a {
  color: black;
  font-size: 16px;
}
.nav-a:hover {
  color: red;
  font-size: 16px;
}

.category-box {
  width: 25%;
  background-color: white;
  float: left;
}

.login-box{
  width: 25%;
  height: 436px;
  background-color: white;
  float: left;
  border: 4px solid tomato;
}

.category-ul {
  margin: 0px;
  padding: 20px;
}

li {
  list-style: none;
  border: 1px solid green;
}
</style>