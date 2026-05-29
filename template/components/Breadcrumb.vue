<template>
  <nav v-if="items.length" class="breadcrumb" aria-label="Struktura prezentace">
    <template v-for="(item, index) in items" :key="`${item}-${index}`">
      <span :class="{ active: index === items.length - 1 }">{{ item }}</span>
      <span v-if="index < items.length - 1" class="separator">/</span>
    </template>
  </nav>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  levels: {
    type: [Array, String],
    default: undefined,
  },
  section: {
    type: String,
    default: '',
  },
  current: {
    type: String,
    default: '',
  },
})

const items = computed(() => {
  if (Array.isArray(props.levels)) {
    return props.levels.map(normalizeItem).filter(Boolean)
  }

  if (typeof props.levels === 'string' && props.levels.trim()) {
    return props.levels.split('/').map(normalizeItem).filter(Boolean)
  }

  return [props.section, props.current].map(normalizeItem).filter(Boolean)
})

function normalizeItem(item) {
  return String(item ?? '').trim()
}
</script>
