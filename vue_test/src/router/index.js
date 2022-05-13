import VueRouter from 'vue-router'
import HomeCom from "../pages/HomeCom";
import AboutCom from "../pages/AboutCom";


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