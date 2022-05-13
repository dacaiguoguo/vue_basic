import VueRouter from 'vue-router'
import HomeCom from "../components/HomeCom";
import AboutCom from "../components/AboutCom";


export default new VueRouter({
    routes: [
        {
            path: '/about',
            component: AboutCom
        },
        {
            path: '/home',
            component: HomeCom
        }
    ]
})