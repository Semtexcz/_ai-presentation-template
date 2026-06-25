<template>
  <article class="prompt-card" :class="[variantClass, { compact }]">
    <header v-if="title || kicker || icon" class="prompt-card-header">
      <div v-if="icon" class="prompt-card-icon" aria-hidden="true">
        <VisualIcon :name="icon" />
      </div>

      <div class="prompt-card-copy">
        <div v-if="kicker" class="prompt-card-kicker">{{ kicker }}</div>
        <div v-if="title" class="prompt-card-title">{{ title }}</div>
      </div>
    </header>

    <div class="prompt-card-body">
      <slot />
    </div>
  </article>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const props = defineProps({
  title: { type: String, default: '' },
  kicker: { type: String, default: '' },
  icon: { type: String, default: '' },
  variant: {
    type: String,
    default: 'neutral',
    validator: (value) => ['neutral', 'accent', 'good', 'bad', 'warning'].includes(value),
  },
  compact: {
    type: Boolean,
    default: false,
  },
})

const variantClass = computed(() => `variant-${props.variant}`)
</script>

<style scoped>
.prompt-card {
  min-width: 0;
  width: 100%;
  padding: 18px 20px 20px;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #FFFFFF;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.prompt-card.compact {
  padding: 14px 16px 16px;
  gap: 12px;
  border-radius: 16px;
}

.prompt-card.variant-neutral {
  background: #F7F7F7;
}

.prompt-card.variant-accent {
  border-color: rgba(241, 30, 30, 0.34);
  background: #FFF7F7;
}

.prompt-card.variant-good {
  border-color: rgba(19, 115, 51, 0.32);
  background: var(--semantic-good-soft);
}

.prompt-card.variant-bad {
  border-color: rgba(217, 45, 32, 0.36);
  background: var(--semantic-bad-soft);
}

.prompt-card.variant-warning {
  border-color: rgba(176, 116, 6, 0.34);
  background: var(--semantic-warning-soft);
}

.prompt-card-header {
  display: flex;
  align-items: flex-start;
  gap: 14px;
}

.prompt-card-icon {
  width: 40px;
  height: 40px;
  flex: 0 0 40px;
  border-radius: 12px;
  background: rgba(255, 255, 255, 0.72);
  display: flex;
  align-items: center;
  justify-content: center;
}

.prompt-card-icon :deep(svg) {
  width: 24px;
  height: 24px;
  color: var(--accent);
}

.prompt-card.variant-good .prompt-card-icon :deep(svg) {
  color: var(--semantic-good);
}

.prompt-card.variant-bad .prompt-card-icon :deep(svg) {
  color: var(--semantic-bad);
}

.prompt-card.variant-warning .prompt-card-icon :deep(svg) {
  color: var(--semantic-warning);
}

.prompt-card-copy {
  min-width: 0;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.prompt-card-kicker {
  font: 700 12px/1 'Inter', sans-serif;
  color: var(--text-soft);
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.prompt-card-title {
  color: var(--text);
  font: 700 22px/1.08 'Outfit', sans-serif;
  text-wrap: balance;
}

.prompt-card.variant-accent .prompt-card-kicker,
.prompt-card.variant-accent .prompt-card-title {
  color: var(--accent);
}

.prompt-card.variant-good .prompt-card-kicker,
.prompt-card.variant-good .prompt-card-title {
  color: var(--semantic-good);
}

.prompt-card.variant-bad .prompt-card-kicker,
.prompt-card.variant-bad .prompt-card-title {
  color: var(--semantic-bad);
}

.prompt-card.variant-warning .prompt-card-kicker,
.prompt-card.variant-warning .prompt-card-title {
  color: var(--semantic-warning);
}

.prompt-card-body {
  min-width: 0;
  color: var(--text);
  font: 500 17px/1.45 'Inter', sans-serif;
}

.prompt-card.compact .prompt-card-body {
  font-size: 15px;
}

.prompt-card-body :deep(*) {
  max-width: 100%;
}

.prompt-card-body :deep(p),
.prompt-card-body :deep(ul),
.prompt-card-body :deep(ol) {
  margin: 0;
}

.prompt-card-body :deep(p + p),
.prompt-card-body :deep(p + ul),
.prompt-card-body :deep(p + ol),
.prompt-card-body :deep(ul + p),
.prompt-card-body :deep(ol + p),
.prompt-card-body :deep(ul + ul),
.prompt-card-body :deep(ol + ol) {
  margin-top: 10px;
}

.prompt-card-body :deep(pre) {
  width: 100%;
  margin: 0;
  padding: 18px 20px !important;
  border: 1px solid rgba(17, 17, 17, 0.08);
  border-radius: 14px;
  background: rgba(255, 255, 255, 0.76) !important;
  box-sizing: border-box;
  color: var(--text) !important;
  font-family: 'Inter', monospace !important;
  font-size: clamp(15px, 1.45vw, 18px) !important;
  font-weight: 500;
  line-height: 1.45 !important;
  white-space: pre-wrap !important;
  word-break: break-word;
  overflow-wrap: anywhere;
  overflow: hidden;
}

.prompt-card.compact .prompt-card-body :deep(pre) {
  padding: 14px 16px !important;
  font-size: clamp(14px, 1.28vw, 16px) !important;
}

.prompt-card-body :deep(pre code) {
  display: block;
  padding: 0;
  background: transparent;
  color: inherit;
  font: inherit;
  white-space: inherit;
  word-break: inherit;
  overflow-wrap: inherit;
}

.prompt-card-body :deep(code):not(pre code) {
  padding: 0.08em 0.32em;
  border-radius: 6px;
  background: rgba(17, 17, 17, 0.06);
  font-family: 'Inter', monospace;
  font-size: 0.92em;
}
</style>
