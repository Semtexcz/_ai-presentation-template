<template>
  <div class="cycle-diagram" role="group" :aria-label="ariaLabel">
    <div class="cycle-steps" :style="{ '--cycle-count': normalizedSteps.length }">
      <template v-for="(step, index) in normalizedSteps" :key="`${step.title}-${index}`">
        <article class="cycle-step" :class="{ active: index === active }">
          <VisualIcon v-if="step.icon" :name="step.icon" />
          <span class="cycle-number">{{ index + 1 }}</span>
          <strong>{{ step.title }}</strong>
          <small v-if="step.subtitle">{{ step.subtitle }}</small>
        </article>
        <div v-if="index < normalizedSteps.length - 1" class="cycle-arrow" aria-hidden="true">→</div>
      </template>
    </div>
    <div class="cycle-return" aria-hidden="true"><span>↩</span></div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const props = defineProps({
  steps: { type: Array, default: () => [] },
  active: { type: Number, default: -1 },
  ariaLabel: { type: String, default: 'Cyklický proces' },
})
const normalizedSteps = computed(() => props.steps.slice(0, 5).map((step) => typeof step === 'string' ? { title: step } : step))
</script>

<style scoped>
.cycle-diagram { width: 100%; }
.cycle-steps { display: flex; align-items: stretch; justify-content: center; }
.cycle-step { position: relative; min-width: 0; flex: 1 1 0; min-height: 150px; padding: 20px 14px; border: 1.5px solid var(--border); border-radius: 16px; background: #FFFFFF; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; }
.cycle-step.active { border: 2px solid var(--accent); background: #FFF7F7; }
.cycle-step :deep(svg) { width: 34px; height: 34px; margin-bottom: 10px; color: var(--accent); }
.cycle-number { position: absolute; top: 10px; left: 12px; color: var(--text-muted); font: 700 12px/1 'Inter', sans-serif; }
.cycle-step strong { color: var(--text); font: 700 18px/1.1 'Outfit', sans-serif; text-wrap: balance; }
.cycle-step small { margin-top: 8px; color: var(--text-soft); font: 500 12px/1.25 'Inter', sans-serif; }
.cycle-arrow { width: 28px; flex: 0 0 28px; align-self: center; color: #AAAAAA; font: 600 24px/1 'Outfit', sans-serif; text-align: center; }
.cycle-return { height: 42px; margin: 8px 8% 0; border-right: 2px solid #C8C8C8; border-bottom: 2px solid #C8C8C8; border-left: 2px solid #C8C8C8; border-radius: 0 0 18px 18px; position: relative; }
.cycle-return span { position: absolute; left: -13px; top: -14px; color: var(--accent); font: 700 28px/1 'Outfit', sans-serif; }
</style>
