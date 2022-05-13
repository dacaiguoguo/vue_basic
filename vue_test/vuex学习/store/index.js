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
    addPerson(context, value) {
        console.log("ADD_PERSON")
        context.commit("ADD_PERSON", value)
    },


}
const mutations = {
    JIA(state, value) {
        console.log("JIA++", state, value)
        state.sum += value
    },
    JIAODD(state, value) {
        console.log("JIAODD++", value)
        state.sum += value
    },
    JIAWAIT(state, value) {
        console.log("JIAWAIT++", value)
        state.sum += value
    },
    ADD_PERSON(state, personOjb) {
        console.log("ADD_PERSON++", personOjb)
        state.personList.unshift(personOjb)
    },
}

const getters = {
    bigSum(state) {
        return state.sum * 10
    }
}

const state = {
    sum: 0,
    school: "好学校",
    subject: "机械制造",
    personList: [
        { id:'001', name: '张三' }
    ]
}

const store = new Vuex.Store({
    actions,
    mutations,
    state,
    getters
})

export default store