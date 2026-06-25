<template>
  <Icon :icon="resolvedIcon" class="visual-icon-svg" aria-hidden="true" />
</template>

<script setup>
import { computed } from 'vue'
import { Icon, addCollection } from '@iconify/vue'
import phIconSet from '@iconify-json/ph/icons.json'

const props = defineProps({ name: { type: String, required: true } })
const FALLBACK_ICON = 'ph:question-duotone'

const legacyAliases = {
  student: 'ph:student-duotone', bug: 'ph:bug-duotone', pair: 'ph:users-three-duotone',
  review: 'ph:checks-duotone', docs: 'ph:book-open-duotone', tests: 'ph:test-tube-duotone',
}

const phIcons = phIconSet.icons ?? {}
const phAliases = phIconSet.aliases ?? {}

addCollection(phIconSet)

function normalizeName(name) {
  const normalized = (legacyAliases[name] ?? name ?? '').trim()
  if (normalized.startsWith('~icons/ph/')) return `ph:${normalized.slice(10)}`
  if (normalized.startsWith('i-ph-')) return `ph:${normalized.slice(5)}`
  if (!normalized.includes(':') && !normalized.includes('/')) return `ph:${normalized}`
  return normalized.replace('/', ':')
}

function hasPhIcon(name) {
  return Boolean(phIcons[name] || phAliases[name])
}

const resolvedIcon = computed(() => {
  const normalized = normalizeName(props.name)
  if (!normalized.startsWith('ph:')) return FALLBACK_ICON
  const iconName = normalized.slice(3)
  return hasPhIcon(iconName) ? normalized : FALLBACK_ICON
})
</script>
