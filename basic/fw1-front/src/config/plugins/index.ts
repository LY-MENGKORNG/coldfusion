import type { App } from 'vue'
import vuetify from './vuetify'
import i18n from './i18n'
import router from './router'
import pinia from './pinia'

const regiserPlugins = (app: App<Element>) => {
  app.use(vuetify)
  app.use(i18n)
  app.use(router)
  app.use(pinia)
}

export default regiserPlugins