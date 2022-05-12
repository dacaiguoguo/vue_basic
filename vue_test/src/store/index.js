import Vuex from "vuex";
import Vue from 'vue'
Vue.use(Vuex)

const actions = {}
const mutations = {}
const state = {sum: 0}
const store = new Vuex.Store({
    actions,
    mutations,
    state
})

export default store