import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import { registerPlugins } from '@/config'
import '@/assets/styles/styles.css'

const app = createApp(App)

// Register plugins
registerPlugins(app)

app.mount('#app')
