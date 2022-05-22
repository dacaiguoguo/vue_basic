<template>
  <div class="pageWapper">
    <H3>产品详情</H3>
    <div class="banner">
      <!-- <img src="http://wis-img2.lvmama.com/20210517/ce65264d-ac09-4d39-8ac4-aa04a779fd4d737746740401453590.jpg?imageMogr2/thumbnail/!60p" alt="" /> -->
      <img v-for="image in bannerImages" :key="image" :src="image" alt="" />
    </div>
    <div class="productInfo">
      <h3>
        {{ product.productName
        }}<span v-show="product.star">[{{ product.star }}]</span>
      </h3>
      <div class="place-info" @click="goplaceinfo">
        <div class="left-info">
          <span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span
          ><span style="margin-left: 10px">景区简介</span>
        </div>
        <div class="right-info">
          <span class="val_line">|</span>
          <span class="detail_text">详情</span>
          <span
            class="glyphicon glyphicon-menu-right"
            aria-hidden="true"
          ></span>
        </div>

        <ul>
          <li v-for="item in equipmentVos" :key="item">
            <span
              class="glyphicon glyphicon-exclamation-sign"
              aria-hidden="true"
            ></span>
            {{ item }}
          </li>
        </ul>
      </div>
      <div class="place-addinfo">
        <span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span
        ><span style="margin-left: 10px">{{ product.address }}</span>
      </div>
    </div>

    <div class="goodsection">
      <h3>景点门票</h3>
      <ul class="goodlist">
        <li>商品列表</li>
      </ul>
    </div>
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
      goodlist: [],
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
    equipmentVos() {
      if (this.product["equipmentVos"]) {
        const list = this.product["equipmentVos"].map((params) => {
          return params["equipmentName"];
        });
        return list.slice(0, 3);
      } else {
        return [];
      }
    },
  },
  methods: {
    goplaceinfo(){
      console.log("goplaceinfo");
    }
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
    const data = { productId: "124411637", bizCategoryId: 11, districtId: "" };
    axios
      .post("/api/m/ticket/goods", data)
      .then((res) => {
        this.goodlist = res.data["data"];
        console.log(res);
        console.log(this.goodlist);
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<style>
.pageWapper {
  width: 390px;
  margin: 0 auto;
  background-color: white;
}
.productInfo {
  padding: 0px 15px 10px 10px;
}
.productInfo > h3 {
  color: #222;
  font-size: 20.8px;
}
.productInfo > h3 > span {
  margin-left: 3px;
  color: #222;
  font-size: 14.56px;
}
.banner {
  border: 3px solid gold;
  height: 10rem;
  overflow-x: scroll;
}
.banner > img {
  width: 100%;
}
.place-info {
  overflow: hidden;
}
.left-info {
  float: left;
}
.right-info {
  float: right;
}
.place-info > ul {
  padding-left: 10px;
  clear: both;
  list-style: none;
  display: flex;
  justify-content: flex-start;
}
.place-info > ul > li {
  /* float: left; */
  margin-left: 30px;
  color: #888;
}

.goodsection {
  border-top: 10px solid #f4f4f4;
}
.goodlist {
  margin-top: 20px;
  padding-left: 10px;
  list-style: none;
}
</style>