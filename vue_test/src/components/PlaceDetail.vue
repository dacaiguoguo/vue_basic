<template>
  <div class="pageWapper">
    <H3>产品详情</H3>
    <div class="banner">
      <!-- <img src="http://wis-img2.lvmama.com/20210517/ce65264d-ac09-4d39-8ac4-aa04a779fd4d737746740401453590.jpg?imageMogr2/thumbnail/!60p" alt="" /> -->
      <img v-for="image in bannerImages" :key="image" :src="image" alt="" />
    </div>
    <div class="productInfo">
      <h3>
        {{ product.productName }}<span>[{{ product.star }}]</span>
      </h3>
      <h3>
        <span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span
        >景区简介
      </h3>
    </div>

    <ul>
      <li>商品列表</li>
    </ul>
    <div class="footerInfo">底部保障信息</div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "PlaceDetail",
  data() {
    return {
      title: "产品详情",
      product: {},
    };
  },
  computed: {
    bannerImages() {
      if (this.product["ticketProductImageBaseVos"]) {
        const list = this.product["ticketProductImageBaseVos"].map((params) => {
          return params.photoUrl;
        });
        console.log(list);
        return list;
      } else {
        return [];
      }
    },
  },
  created() {
    //   https://api.youqianshan.com/api/m/ticket/goods
    //   https://api.youqianshan.com/api/m/ticket/124411637
    axios
      .get("/api/m/ticket/124411637")
      .then((res) => {
        this.product = res.data["data"];
        console.log(res);
        console.log(this.product);
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<style>
.pageWapper {
  width: 375px;
  margin: 0 auto;
  background-color: #f4f4f4;
}
.productInfo > h3 {
  font-size: 1.25rem;
}
.productInfo > h3 > span {
  font-size: 0.875rem;
}
.banner {
  height: 10rem;
  overflow-x: scroll;
}
.banner > img {
  width: 100%;
}
</style>