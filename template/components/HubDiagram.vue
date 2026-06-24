<template>
  <div class="hub-diagram" role="group" :aria-label="ariaLabel">
    <article class="hub-center">
      <VisualIcon v-if="center.icon" :name="center.icon" />
      <strong>{{ center.title }}</strong>
      <span v-if="center.subtitle">{{ center.subtitle }}</span>
    </article>
    <div class="hub-arrow" aria-hidden="true">→</div>
    <div class="hub-items">
      <article v-for="(item, index) in normalizedItems" :key="`${item.title}-${index}`" class="hub-item">
        <VisualIcon v-if="item.icon" :name="item.icon" />
        <div><strong>{{ item.title }}</strong><span v-if="item.subtitle">{{ item.subtitle }}</span></div>
      </article>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const props = defineProps({
  center: { type: Object, required: true },
  items: { type: Array, default: () => [] },
  ariaLabel: { type: String, default: 'Vztahové schéma' },
})
const normalizedItems = computed(() => props.items.slice(0, 6))
</script>

<style scoped>
.hub-diagram { width: 100%; display: grid; grid-template-columns: minmax(180px, .7fr) 52px minmax(360px, 1.8fr); align-items: center; gap: 16px; }
.hub-center { min-height: 180px; padding: 24px; border: 2px solid var(--accent); border-radius: 20px; background: #FFF7F7; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; }
.hub-center :deep(svg) { width: 48px; height: 48px; margin-bottom: 14px; color: var(--accent); }
.hub-center strong, .hub-item strong { color: var(--text); font: 700 22px/1.08 'Outfit', sans-serif; text-wrap: balance; }
.hub-center span, .hub-item span { margin-top: 7px; color: var(--text-soft); font: 500 13px/1.25 'Inter', sans-serif; }
.hub-arrow { color: var(--accent); font: 700 38px/1 'Outfit', sans-serif; text-align: center; }
.hub-items { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 14px; }
.hub-item { min-height: 84px; padding: 16px; border: 1.5px solid var(--border); border-radius: 14px; background: #FFFFFF; display: flex; align-items: center; gap: 14px; }
.hub-item > :deep(svg) { width: 34px; height: 34px; flex: 0 0 34px; color: var(--accent); }
.hub-item div { min-width: 0; display: flex; flex-direction: column; }
.hub-item strong { font-size: 17px; }
</style>
