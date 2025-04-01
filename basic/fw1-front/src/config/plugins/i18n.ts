import { createI18n } from 'vue-i18n'
import en from '@/locales/en.json'

type MessageSchema = typeof en

export const loadLocaleMessages = () => {
  const locales = import.meta.glob('@/locales/*.json', { eager: true })
  const messages: any = {}

  const localeKeyArray = Object.keys(locales)

  for (let i = 0; i < localeKeyArray.length; i++) {
    const matched = localeKeyArray[i].match(/([A-Za-z0-9-_]+)\.json$/i)
    if (matched && matched.length > 1) {
      const locale = matched[1]
      messages[locale] = locales[localeKeyArray[i]] as MessageSchema
    }
  }
  return messages
}

export default createI18n<[MessageSchema], 'en' | 'fr'>({
  locale: import.meta.env.VITE_I18N_LOCALE || 'fr',
  fallbackLocale: import.meta.env.VITE_I18N_FALLBACK_LOCALE || 'fr',
  globalInjection: true,
  messages: loadLocaleMessages(),
})