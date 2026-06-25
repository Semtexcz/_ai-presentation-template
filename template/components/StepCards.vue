<template>
  <ol class="step-cards" :class="[`columns-${resolvedColumns}`, { compact: normalizedSteps.length >= 4 }]" :aria-label="ariaLabel">
    <li
      v-for="(step, index) in normalizedSteps"
      :key="`${step.title}-${index}`"
      class="step-card"
      :class="[
        `variant-${step.variant}`,
        { active: index === active },
      ]"
    >
      <div class="step-card-top">
        <span class="step-card-index">{{ formatIndex(index) }}</span>
        <VisualIcon v-if="step.icon" :name="step.icon" class="step-card-icon" />
      </div>

      <div class="step-card-title">{{ step.title }}</div>
      <div v-if="step.subtitle" class="step-card-subtitle">{{ step.subtitle }}</div>
    </li>
  </ol>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const props = defineProps({
  steps: {
    type: Array,
    default: () => [],
  },
  active: {
    type: Number,
    default: -1,
  },
  columns: {
    type: Number,
    default: 0,
  },
  ariaLabel: {
    type: String,
    default: 'Sekvence kroků',
  },
})

const normalizedSteps = computed(() => props.steps.slice(0, 5).map((step) => {
  if (typeof step === 'string')
    return { title: step, subtitle: '', icon: '', variant: 'neutral' }

  return {
    title: step.title ?? step.label ?? '',
    subtitle: step.subtitle ?? '',
    icon: step.icon ?? '',
    variant: ['neutral', 'accent', 'good', 'bad', 'warning'].includes(step.variant)
      ? step.variant
      : 'neutral',
  }
}))

const resolvedColumns = computed(() => {
  const requested = Number(props.columns)
  if (Number.isFinite(requested) && requested >= 2 && requested <= 4)
    return requested

  return normalizedSteps.value.length >= 4 ? 2 : Math.min(Math.max(normalizedSteps.value.length, 2), 3)
})

function formatIndex(index) {
  return String(index + 1).padStart(2, '0')
}
</script>

<style scoped>
.step-cards {
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
  display: grid;
  gap: 18px;
  align-items: stretch;
}

.step-cards.columns-2 {
  grid-template-columns: repeat(2, minmax(0, 1fr));
}

.step-cards.columns-3 {
  grid-template-columns: repeat(3, minmax(0, 1fr));
}

.step-cards.columns-4 {
  grid-template-columns: repeat(4, minmax(0, 1fr));
}

.step-card {
  min-width: 0;
  min-height: 144px;
  padding: 18px 18px 20px;
  border: 1.5px solid var(--border);
  border-radius: 16px;
  background: #FFFFFF;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.step-cards.compact .step-card {
  min-height: 132px;
  gap: 10px;
}

.step-card.variant-neutral {
  background: #F7F7F7;
}

.step-card.variant-accent {
  border-color: rgba(241, 30, 30, 0.32);
  background: #FFF7F7;
}

.step-card.variant-good {
  border-color: rgba(19, 115, 51, 0.32);
  background: var(--semantic-good-soft);
}

.step-card.variant-bad {
  border-color: rgba(217, 45, 32, 0.36);
  background: var(--semantic-bad-soft);
}

.step-card.variant-warning {
  border-color: rgba(176, 116, 6, 0.34);
  background: var(--semantic-warning-soft);
}

.step-card.active {
  border-width: 2px;
  border-color: var(--accent);
  box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.72);
}

.step-card-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
}

.step-card-index {
  color: var(--text-muted);
  font: 700 12px/1 'Inter', sans-serif;
  letter-spacing: 0.08em;
}

.step-card-icon {
  width: 28px;
  height: 28px;
  color: var(--accent);
  flex: 0 0 28px;
}

.step-card.variant-good .step-card-icon {
  color: var(--semantic-good);
}

.step-card.variant-bad .step-card-icon {
  color: var(--semantic-bad);
}

.step-card.variant-warning .step-card-icon {
  color: var(--semantic-warning);
}

.step-card-title {
  color: var(--text);
  font: 700 22px/1.08 'Outfit', sans-serif;
  text-wrap: balance;
}

.step-card-subtitle {
  color: var(--text-soft);
  font: 500 13px/1.3 'Inter', sans-serif;
}

.step-card.variant-accent .step-card-title,
.step-card.variant-accent .step-card-subtitle {
  color: var(--accent);
}

.step-card.variant-good .step-card-title,
.step-card.variant-good .step-card-subtitle {
  color: var(--semantic-good);
}

.step-card.variant-bad .step-card-title,
.step-card.variant-bad .step-card-subtitle {
  color: var(--semantic-bad);
}

.step-card.variant-warning .step-card-title,
.step-card.variant-warning .step-card-subtitle {
  color: var(--semantic-warning);
}
</style>
