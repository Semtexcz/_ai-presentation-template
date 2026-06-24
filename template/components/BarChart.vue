<template>
  <figure class="bar-chart" :aria-label="ariaLabel">
    <ol class="bar-chart-list">
      <li v-for="(item, index) in normalizedItems" :key="`${item.label}-${index}`" class="bar-chart-row">
        <div class="bar-chart-label">{{ item.label }}</div>
        <div class="bar-chart-track">
          <div class="bar-chart-fill" :class="{ highlighted: item.highlight }" :style="{ width: `${item.percent}%` }" />
        </div>
        <div class="bar-chart-value">{{ item.displayValue }}</div>
      </li>
    </ol>
  </figure>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  items: { type: Array, default: () => [] },
  max: { type: Number, default: undefined },
  ariaLabel: { type: String, default: 'Sloupcový graf' },
})

const normalizedItems = computed(() => {
  const source = props.items.slice(0, 6).map((item) => ({
    ...item,
    value: Math.max(0, Number(item.value) || 0),
  }))
  const naturalMax = Math.max(1, ...source.map((item) => item.value))
  const scaleMax = Math.max(1, Number(props.max) || naturalMax)
  return source.map((item) => ({
    ...item,
    displayValue: item.displayValue ?? String(item.value),
    percent: Math.min(100, (item.value / scaleMax) * 100),
  }))
})
</script>

<style scoped>
.bar-chart { width: 100%; margin: 0; }
.bar-chart-list { margin: 0; padding: 0; list-style: none; display: grid; gap: 16px; }
.bar-chart-row { display: grid; grid-template-columns: minmax(120px, 0.8fr) minmax(260px, 2fr) minmax(64px, auto); gap: 16px; align-items: center; }
.bar-chart-label { color: var(--text); font: 650 18px/1.15 'Inter', sans-serif; text-align: right; }
.bar-chart-track { height: 30px; overflow: hidden; border-radius: 8px; background: #E7E7E7; }
.bar-chart-fill { min-width: 3px; height: 100%; border-radius: inherit; background: #777777; }
.bar-chart-fill.highlighted { background: var(--accent); }
.bar-chart-value { color: var(--text); font: 700 18px/1 'Outfit', sans-serif; }
</style>
