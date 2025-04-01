import { createRouter, createWebHistory } from 'vue-router'
import homeRoutes from '@/routes/home'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      redirect: '/home',
    },
    ...homeRoutes
  ],
})

router.beforeEach((to, from, next) => {
  next()
})

export default router