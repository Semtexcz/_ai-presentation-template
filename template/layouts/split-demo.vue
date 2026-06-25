<template>
  <section class="slidev-layout split-demo-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="split-demo-content">
      <div class="slide-title split-demo-title">
        <slot name="title" />
      </div>

      <div class="split-demo-grid" :style="gridStyle">
        <article class="split-demo-panel" :class="`variant-${leftVariant}`">
          <header v-if="leftTitle || leftIcon" class="split-demo-panel-header">
            <VisualIcon v-if="leftIcon" :name="leftIcon" class="split-demo-panel-icon" />
            <div v-if="leftTitle" class="split-demo-panel-title">{{ leftTitle }}</div>
          </header>

          <div class="split-demo-panel-body">
            <slot name="left" />
          </div>
        </article>

        <article class="split-demo-panel" :class="`variant-${rightVariant}`">
          <header v-if="rightTitle || rightIcon" class="split-demo-panel-header">
            <VisualIcon v-if="rightIcon" :name="rightIcon" class="split-demo-panel-icon" />
            <div v-if="rightTitle" class="split-demo-panel-title">{{ rightTitle }}</div>
          </header>

          <div class="split-demo-panel-body">
            <slot name="right" />
          </div>
        </article>
      </div>

      <div v-if="$slots.note" class="split-demo-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from '../components/VisualIcon.vue'

const props = defineProps({
  leftTitle: { type: String, default: '' },
  rightTitle: { type: String, default: '' },
  leftIcon: { type: String, default: '' },
  rightIcon: { type: String, default: '' },
  leftVariant: {
    type: String,
    default: 'neutral',
    validator: (value) => ['neutral', 'bad', 'good', 'accent', 'warning'].includes(value),
  },
  rightVariant: {
    type: String,
    default: 'accent',
    validator: (value) => ['neutral', 'bad', 'good', 'accent', 'warning'].includes(value),
  },
  codeFontMin: {
    type: Number,
    default: 12,
  },
  leftWidth: {
    type: [Number, String],
    default: 1,
  },
})

const gridStyle = computed(() => {
  const leftWidth = Number.parseFloat(String(props.leftWidth))
  const leftRatio = Number.isFinite(leftWidth) && leftWidth > 0 ? leftWidth : 1

  return {
    '--split-demo-left': `${leftRatio}fr`,
    '--split-demo-right': '1fr',
    '--split-demo-code-min': `${Math.max(10, props.codeFontMin)}px`,
  }
})
</script>

<style scoped>
.split-demo-layout {
  background: var(--bg);
  box-sizing: border-box;
  overflow: hidden;
}

.split-demo-content {
  margin-left: var(--content-inline-margin);
  margin-right: var(--content-inline-margin);
  margin-top: var(--slide-header-gap);
  width: auto;
  display: flex;
  flex-direction: column;
}

.split-demo-title {
  --slide-title-max-width: 980px;
}

.split-demo-grid {
  margin-top: 24px;
  width: 100%;
  min-height: 0;
  display: grid;
  grid-template-columns: minmax(0, var(--split-demo-left)) minmax(0, var(--split-demo-right));
  gap: 20px;
  align-items: stretch;
}

.split-demo-panel {
  min-width: 0;
  min-height: 332px;
  padding: 20px 22px 22px;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #FFFFFF;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
}

.split-demo-panel.variant-neutral {
  background: #F7F7F7;
}

.split-demo-panel.variant-accent {
  border-color: rgba(241, 30, 30, 0.34);
  background: #FFF7F7;
}

.split-demo-panel.variant-good {
  border-color: rgba(19, 115, 51, 0.32);
  background: var(--semantic-good-soft);
}

.split-demo-panel.variant-bad {
  border-color: rgba(217, 45, 32, 0.36);
  background: var(--semantic-bad-soft);
}

.split-demo-panel.variant-warning {
  border-color: rgba(176, 116, 6, 0.34);
  background: var(--semantic-warning-soft);
}

.split-demo-panel-header {
  display: flex;
  align-items: center;
  gap: 12px;
}

.split-demo-panel-icon {
  width: 28px;
  height: 28px;
  flex: 0 0 28px;
  color: var(--text-soft);
}

.split-demo-panel.variant-accent .split-demo-panel-icon {
  color: var(--accent);
}

.split-demo-panel.variant-good .split-demo-panel-icon {
  color: var(--semantic-good);
}

.split-demo-panel.variant-bad .split-demo-panel-icon {
  color: var(--semantic-bad);
}

.split-demo-panel.variant-warning .split-demo-panel-icon {
  color: var(--semantic-warning);
}

.split-demo-panel-title {
  min-width: 0;
  color: var(--text);
  font: 700 22px/1.08 'Outfit', sans-serif;
  text-wrap: balance;
}

.split-demo-panel.variant-accent .split-demo-panel-title {
  color: var(--accent);
}

.split-demo-panel.variant-good .split-demo-panel-title {
  color: var(--semantic-good);
}

.split-demo-panel.variant-bad .split-demo-panel-title {
  color: var(--semantic-bad);
}

.split-demo-panel.variant-warning .split-demo-panel-title {
  color: var(--semantic-warning);
}

.split-demo-panel-body {
  margin-top: 16px;
  min-width: 0;
  flex: 1;
  font: 500 18px/1.42 'Inter', sans-serif;
  color: var(--text);
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.split-demo-panel-body :deep(*) {
  max-width: 100%;
}

.split-demo-panel-body :deep(p),
.split-demo-panel-body :deep(ul),
.split-demo-panel-body :deep(ol) {
  margin: 0;
}

.split-demo-panel-body :deep(p + p),
.split-demo-panel-body :deep(p + ul),
.split-demo-panel-body :deep(p + ol),
.split-demo-panel-body :deep(ul + p),
.split-demo-panel-body :deep(ol + p),
.split-demo-panel-body :deep(ul + ul),
.split-demo-panel-body :deep(ol + ol) {
  margin-top: 12px;
}

.split-demo-panel-body :deep(pre) {
  width: 100%;
  margin: 0;
  padding: 18px 20px !important;
  border: 1px solid var(--border-soft);
  border-radius: 14px;
  background: rgba(255, 255, 255, 0.74) !important;
  box-sizing: border-box;
  color: var(--text) !important;
  font-family: 'Inter', monospace !important;
  font-size: clamp(var(--split-demo-code-min), 1.35vw, 18px) !important;
  font-weight: 500;
  line-height: 1.45 !important;
  white-space: pre-wrap !important;
  word-break: break-word;
  overflow-wrap: anywhere;
  overflow: hidden;
}

.split-demo-panel-body :deep(pre code) {
  display: block;
  padding: 0;
  background: transparent;
  color: inherit;
  font: inherit;
  white-space: inherit;
  word-break: inherit;
  overflow-wrap: inherit;
}

.split-demo-panel-body :deep(code):not(pre code) {
  padding: 0.08em 0.32em;
  border-radius: 6px;
  background: rgba(17, 17, 17, 0.06);
  font-family: 'Inter', monospace;
  font-size: 0.92em;
}

.split-demo-panel.variant-bad .split-demo-panel-body :deep(pre) {
  border-color: rgba(217, 45, 32, 0.2);
}

.split-demo-panel.variant-good .split-demo-panel-body :deep(pre) {
  border-color: rgba(19, 115, 51, 0.2);
}

.split-demo-panel.variant-accent .split-demo-panel-body :deep(pre) {
  border-color: rgba(241, 30, 30, 0.2);
}

.split-demo-panel.variant-warning .split-demo-panel-body :deep(pre) {
  border-color: rgba(176, 116, 6, 0.18);
}

.split-demo-note {
  margin-top: 18px;
  max-width: 920px;
  color: var(--text-soft);
  font: 500 17px/1.35 'Inter', sans-serif;
}
</style>
