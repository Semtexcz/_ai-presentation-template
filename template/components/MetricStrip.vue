<template>
  <div class="metric-strip" :class="`count-${normalizedItems.length}`">
    <article v-for="(item, index) in normalizedItems" :key="`${item.label}-${index}`" class="metric-card" :class="`variant-${item.variant || 'neutral'}`">
      <div v-if="item.icon" class="metric-icon"><VisualIcon :name="item.icon" /></div>
      <div class="metric-value">{{ item.value }}</div>
      <div class="metric-label">{{ item.label }}</div>
      <div v-if="item.detail" class="metric-detail">{{ item.detail }}</div>
    </article>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const props = defineProps({ items: { type: Array, default: () => [] } })
const normalizedItems = computed(() => props.items.slice(0, 4))
</script>

<style scoped>
.metric-strip { width: 100%; display: grid; grid-template-columns: repeat(var(--metric-count, 3), minmax(0, 1fr)); gap: 18px; }
.metric-strip.count-1 { --metric-count: 1; max-width: 420px; margin: auto; }
.metric-strip.count-2 { --metric-count: 2; }
.metric-strip.count-3 { --metric-count: 3; }
.metric-strip.count-4 { --metric-count: 4; }
.metric-card { min-width: 0; min-height: 180px; padding: 22px; border: 1.5px solid var(--border); border-radius: 16px; background: #FFFFFF; box-sizing: border-box; display: flex; flex-direction: column; }
.metric-card.variant-accent { border-color: rgba(241, 30, 30, .4); background: #FFF7F7; }
.metric-card.variant-good { border-color: rgba(19, 115, 51, .32); background: var(--semantic-good-soft); }
.metric-card.variant-bad { border-color: rgba(217, 45, 32, .36); background: var(--semantic-bad-soft); }
.metric-icon { width: 40px; height: 40px; margin-bottom: 16px; color: var(--accent); }
.metric-icon :deep(svg) { width: 100%; height: 100%; }
.metric-value { color: var(--text); font: 700 42px/1 'Outfit', sans-serif; }
.metric-label { margin-top: 12px; color: var(--text); font: 700 18px/1.12 'Outfit', sans-serif; text-wrap: balance; }
.metric-detail { margin-top: auto; padding-top: 12px; color: var(--text-soft); font: 500 13px/1.3 'Inter', sans-serif; }
</style>
