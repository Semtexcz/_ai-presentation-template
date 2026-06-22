<template>
  <section class="slidev-layout text-compare-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="text-compare-content">
      <div class="text-compare-title">
        <slot name="title" />
      </div>

      <div
        class="text-compare-grid"
        :class="mode === 'vertical' ? 'mode-vertical' : 'mode-horizontal'"
      >
        <article class="compare-panel" :class="`variant-${leftVariant}`">
          <header class="compare-panel-header">
            <div v-if="leftKicker" class="compare-panel-kicker">{{ leftKicker }}</div>
            <div class="compare-panel-title">{{ leftTitle }}</div>
          </header>

          <div class="compare-panel-body">
            <slot name="left" />
          </div>
        </article>

        <article class="compare-panel" :class="`variant-${rightVariant}`">
          <header class="compare-panel-header">
            <div v-if="rightKicker" class="compare-panel-kicker">{{ rightKicker }}</div>
            <div class="compare-panel-title">{{ rightTitle }}</div>
          </header>

          <div class="compare-panel-body">
            <slot name="right" />
          </div>
        </article>
      </div>

      <div v-if="$slots.note" class="text-compare-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<script setup>
defineProps({
  mode: {
    type: String,
    default: 'horizontal',
    validator: (value) => ['horizontal', 'vertical'].includes(value),
  },
  leftTitle: {
    type: String,
    default: 'Původní',
  },
  rightTitle: {
    type: String,
    default: 'Upravené',
  },
  leftKicker: {
    type: String,
    default: '',
  },
  rightKicker: {
    type: String,
    default: '',
  },
  leftVariant: {
    type: String,
    default: 'neutral',
    validator: (value) => ['neutral', 'bad', 'good', 'accent'].includes(value),
  },
  rightVariant: {
    type: String,
    default: 'accent',
    validator: (value) => ['neutral', 'bad', 'good', 'accent'].includes(value),
  },
})
</script>

<style scoped>
.text-compare-layout {
  background: var(--bg);
  box-sizing: border-box;
  overflow: hidden;
}

.text-compare-content {
  margin-left: 8%;
  margin-right: 8%;
  margin-top: 3.5%;
  width: auto;
  display: flex;
  flex-direction: column;
}

.text-compare-title {
  max-width: 880px;
  font-family: 'Outfit', sans-serif;
  font-size: clamp(40px, 5vw, 54px);
  font-weight: 700;
  line-height: 1.06;
  letter-spacing: -0.03em;
  color: var(--text);
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
  text-wrap: balance;
}

.text-compare-grid {
  margin-top: 28px;
  width: 100%;
  display: grid;
  gap: 22px;
  align-items: stretch;
}

.text-compare-grid.mode-horizontal {
  grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
}

.text-compare-grid.mode-vertical {
  grid-template-columns: minmax(0, 1fr);
  gap: 24px;
}

.compare-panel {
  min-width: 0;
  min-height: 260px;
  padding: 22px 24px 24px;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #FFFFFF;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
}

.compare-panel.variant-neutral,
.compare-panel.variant-bad {
  background: #F7F7F7;
}

.compare-panel.variant-bad {
  border-color: var(--border-soft);
}

.compare-panel.variant-good {
  border-color: rgba(241, 30, 30, 0.45);
  background: #FFF3F3;
}

.compare-panel.variant-accent {
  border-color: var(--accent);
  background: #FFF7F7;
}

.compare-panel-header {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.compare-panel-kicker {
  font: 700 12px/1 'Inter', sans-serif;
  color: var(--text-soft);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

.compare-panel-title {
  font-family: 'Outfit', sans-serif;
  font-size: 24px;
  font-weight: 700;
  line-height: 1.1;
  color: var(--text);
  text-wrap: balance;
}

.compare-panel.variant-good .compare-panel-kicker,
.compare-panel.variant-accent .compare-panel-kicker,
.compare-panel.variant-good .compare-panel-title,
.compare-panel.variant-accent .compare-panel-title {
  color: var(--accent);
}

.compare-panel-body {
  margin-top: 16px;
  min-width: 0;
  flex: 1;
  font: 500 19px/1.5 'Inter', sans-serif;
  color: var(--text);
}

.compare-panel-body :deep(*) {
  max-width: 100%;
}

.compare-panel-body :deep(p),
.compare-panel-body :deep(ul),
.compare-panel-body :deep(ol) {
  margin: 0;
}

.compare-panel-body :deep(p + p),
.compare-panel-body :deep(p + ul),
.compare-panel-body :deep(p + ol),
.compare-panel-body :deep(ul + p),
.compare-panel-body :deep(ol + p),
.compare-panel-body :deep(ul + ul),
.compare-panel-body :deep(ol + ol) {
  margin-top: 12px;
}

.compare-panel-body :deep(pre) {
  width: 100%;
  margin: 0;
  padding: 20px 22px !important;
  border: 1px solid var(--border-soft);
  border-radius: 14px;
  background: rgba(255, 255, 255, 0.7) !important;
  box-sizing: border-box;
  color: var(--text) !important;
  font-family: 'Inter', monospace !important;
  font-size: clamp(16px, 1.55vw, 19px) !important;
  font-weight: 500;
  line-height: 1.45 !important;
  white-space: pre-wrap !important;
  word-break: break-word;
  overflow-wrap: anywhere;
  overflow: hidden;
}

.compare-panel.variant-accent .compare-panel-body :deep(pre),
.compare-panel.variant-good .compare-panel-body :deep(pre) {
  border-color: rgba(241, 30, 30, 0.2);
}

.compare-panel-body :deep(pre code) {
  display: block;
  padding: 0;
  background: transparent;
  color: inherit;
  font: inherit;
  white-space: inherit;
  word-break: inherit;
  overflow-wrap: inherit;
}

.compare-panel-body :deep(code):not(pre code) {
  padding: 0.08em 0.32em;
  border-radius: 6px;
  background: rgba(17, 17, 17, 0.06);
  font-family: 'Inter', monospace;
  font-size: 0.92em;
}

.text-compare-note {
  margin-top: 22px;
  max-width: 900px;
  font-family: 'Inter', sans-serif;
  font-size: 18px;
  line-height: 1.4;
  color: var(--text-soft);
}
</style>
