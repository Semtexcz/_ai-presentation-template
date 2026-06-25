<template>
  <svg
    class="visual-icon-svg"
    aria-hidden="true"
    :viewBox="viewBox"
    xmlns="http://www.w3.org/2000/svg"
    v-html="resolvedBody"
  />
</template>

<script setup>
import { computed } from 'vue'
import phIconSet from '@iconify-json/ph/icons.json'

const props = defineProps({ name: { type: String, required: true } })
const FALLBACK_ICON = 'ph:question-duotone'

const legacyAliases = {
  student: 'ph:student-duotone', bug: 'ph:bug-duotone', pair: 'ph:users-three-duotone',
  review: 'ph:checks-duotone', docs: 'ph:book-open-duotone', tests: 'ph:test-tube-duotone',
}

const phIcons = phIconSet.icons ?? {}
const phAliases = phIconSet.aliases ?? {}
const viewBox = `0 0 ${phIconSet.width ?? 256} ${phIconSet.height ?? 256}`

function normalizeName(name) {
  const normalized = (legacyAliases[name] ?? name ?? '').trim()
  if (normalized.startsWith('~icons/ph/')) return `ph:${normalized.slice(10)}`
  if (normalized.startsWith('i-ph-')) return `ph:${normalized.slice(5)}`
  if (!normalized.includes(':') && !normalized.includes('/')) return `ph:${normalized}`
  return normalized.replace('/', ':')
}

function resolvePhIcon(name, seen = new Set()) {
  if (seen.has(name)) return null
  if (phIcons[name]) return phIcons[name]

  const alias = phAliases[name]
  if (!alias?.parent) return null

  seen.add(name)
  const parent = resolvePhIcon(alias.parent, seen)
  if (!parent) return null

  return {
    ...parent,
    ...alias,
    body: alias.body ?? parent.body,
  }
}

const resolvedIcon = computed(() => {
  const normalized = normalizeName(props.name)
  if (!normalized.startsWith('ph:')) return FALLBACK_ICON
  const iconName = normalized.slice(3)
  return resolvePhIcon(iconName) ? normalized : FALLBACK_ICON
})

const resolvedBody = computed(() => {
  const iconName = resolvedIcon.value.slice(3)
  return resolvePhIcon(iconName)?.body ?? ''
})
</script>
