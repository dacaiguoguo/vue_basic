import Vuex from "vuex";
import Vue from 'vue'
Vue.use(Vuex)

const actions = {
    jia(context, value) {
        console.log("jia", this)
        context.commit("JIA", value)
    },
    jiaOdd(context, value) {
        console.log("jiaOdd", context)
        if (context.state.sum % 2) {
            context.commit("JIAODD", value)
        }
    },
    jiaWait(context, value) {
        console.log("jiaWait", this)
        setTimeout(() => {
            context.commit("JIAWAIT", value)
        }, 500);
    },

}
const mutations = {
    JIA(context, value) {
        console.log("JIA++", context, value)
        context.sum += value
    },
    JIAODD(context, value) {
        console.log("JIAODD++", value)
        context.sum += value
    },
    JIAWAIT(context, value) {
        console.log("JIAWAIT++", value)
        context.sum += value
    }
}
const state = { sum: 0 }
const store = new Vuex.Store({
    actions,
    mutations,
    state
})

export default store