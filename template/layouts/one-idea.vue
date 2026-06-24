<template>
  <section class="slidev-layout one-idea-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="one-idea-content">
      <div class="one-idea-title">
        <slot name="title" />
      </div>

      <div
        ref="visualEl"
        class="one-idea-visual"
        :class="[
          { 'without-frame': !visualFrame },
          `variant-${visualVariant}`,
        ]"
      >
        <slot name="visual" />
      </div>

      <div v-if="$slots.note" class="one-idea-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<script setup>
import { nextTick, onBeforeUnmount, onMounted, onUpdated, ref } from 'vue'

defineProps({
  visualFrame: {
    type: Boolean,
    default: true,
  },
  visualVariant: {
    type: String,
    default: 'default',
  },
})

const visualEl = ref(null)
let resizeObserver

function fitEquationTerms() {
  const terms = visualEl.value?.querySelectorAll('.equation .term')
  if (!terms?.length) return

  terms.forEach((term) => {
    fitSingleLineText(term, 16)
  })
}

function fitFlowLabels() {
  const labels = visualEl.value?.querySelectorAll('.flow-label')
  if (!labels?.length) return

  labels.forEach((label) => {
    fitMultiLineText(label, 18)
  })
}

function fitSingleLineText(element, minSize) {
  element.style.fontSize = ''

  let size = Number.parseFloat(getComputedStyle(element).fontSize)

  while (element.scrollWidth > element.clientWidth && size > minSize) {
    size -= 1
    element.style.fontSize = `${size}px`
  }
}

function fitMultiLineText(element, minSize) {
  element.style.fontSize = ''

  let size = Number.parseFloat(getComputedStyle(element).fontSize)

  while (
    (element.scrollWidth > element.clientWidth || element.scrollHeight > element.clientHeight) &&
    size > minSize
  ) {
    size -= 1
    element.style.fontSize = `${size}px`
  }
}

async function fitVisualText() {
  await nextTick()
  fitEquationTerms()
  fitFlowLabels()
}

onMounted(() => {
  fitVisualText()

  if (visualEl.value) {
    resizeObserver = new ResizeObserver(fitVisualText)
    resizeObserver.observe(visualEl.value)
  }
})

onUpdated(fitVisualText)

onBeforeUnmount(() => {
  resizeObserver?.disconnect()
})
</script>

<style scoped>
.one-idea-layout {
  background: var(--bg);
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.one-idea-content {
  margin-left: var(--content-inline-margin);
  margin-right: var(--content-inline-margin);
  margin-top: 3%;
  width: auto;
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
}

.one-idea-title {
  font-family: 'Outfit', sans-serif;
  font-size: clamp(40px, 5vw, 54px);
  font-weight: 700;
  line-height: 1.06;
  letter-spacing: -0.03em;
  color: var(--text);
  max-width: 980px;
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
  text-wrap: balance;
  flex: 0 0 auto;
}

.one-idea-visual {
  margin-top: 24px;
  width: 100%;
  min-height: 210px;
  max-height: 360px;
  flex: 1 1 300px;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #F4F4F4;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.one-idea-visual.without-frame {
  border: none;
  border-radius: 0;
  background: transparent;
}

.one-idea-visual :deep(img) {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.one-idea-visual :deep(svg) {
  width: 100%;
  height: 100%;
}

.one-idea-visual.variant-diagram,
.one-idea-visual.variant-comparison,
.one-idea-visual.variant-equation,
.one-idea-visual.variant-demo,
.one-idea-visual.variant-warning {
  padding: 28px;
}

.one-idea-visual.variant-equation {
  background: #FFFFFF;
}

.one-idea-visual.variant-demo {
  border-color: #F11E1E;
  background: #FFF7F7;
}

.one-idea-visual.variant-warning {
  background: #111111;
  border-color: #111111;
  color: #FFFFFF;
}

.one-idea-visual :deep(.flow) {
  width: 100%;
  min-width: 0;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(200px, 100%), 1fr));
  gap: 24px;
  align-items: stretch;
}

.one-idea-visual :deep(.flow:has(> .flow-step:nth-child(4):last-child)) {
  grid-template-columns: repeat(2, minmax(0, 1fr));
}

.one-idea-visual :deep(.flow-step) {
  position: relative;
  min-height: 124px;
  padding: 18px 20px;
  border: 1.5px solid var(--border);
  border-radius: 14px;
  background: #FFFFFF;
  box-sizing: border-box;
  min-width: 0;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.one-idea-visual :deep(.flow-kicker),
.one-idea-visual :deep(.viz-kicker) {
  font: 600 13px/1 'Inter', sans-serif;
  color: var(--accent);
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.one-idea-visual :deep(.flow-label),
.one-idea-visual :deep(.viz-label) {
  font: 700 24px/1.08 'Outfit', sans-serif;
  color: var(--text);
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
  text-wrap: balance;
}

.one-idea-visual :deep(.flow-label) {
  min-height: 50px;
}

.one-idea-visual :deep(.flow-sub),
.one-idea-visual :deep(.viz-sub) {
  font: 500 14px/1.28 'Inter', sans-serif;
  color: var(--text-soft);
}

.one-idea-visual :deep(.equation) {
  width: 100%;
  min-width: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 14px;
  font: 700 30px/1.12 'Outfit', sans-serif;
  color: var(--text);
}

.one-idea-visual :deep(.term) {
  flex: 1 1 0;
  min-width: 0;
  max-width: 230px;
  padding: 18px 20px;
  border-radius: 14px;
  border: 1.5px solid var(--border);
  background: #F8F8F8;
  text-align: center;
  overflow: hidden;
  white-space: nowrap;
}

.one-idea-visual :deep(.term.accent) {
  border-color: var(--accent);
  background: #FFF7F7;
  color: var(--accent);
}

.one-idea-visual :deep(.operator) {
  flex: 0 0 auto;
  color: #A0A0A0;
  font-size: 30px;
}

.one-idea-visual :deep(.comparison) {
  width: 100%;
  min-width: 0;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

.one-idea-visual :deep(.comparison-panel) {
  min-height: 160px;
  padding: 22px;
  border-radius: 14px;
  border: 1.5px solid var(--border);
  background: #FFFFFF;
  box-sizing: border-box;
  min-width: 0;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.one-idea-visual :deep(.comparison-panel.accent) {
  border-color: var(--accent);
  background: #FFF7F7;
}

.one-idea-visual :deep(.comparison-panel.bad) {
  border-color: rgba(217, 45, 32, 0.36);
  background: var(--semantic-bad-soft);
  color: var(--semantic-bad);
}

.one-idea-visual :deep(.comparison-panel.good) {
  border-color: rgba(19, 115, 51, 0.32);
  background: var(--semantic-good-soft);
  color: var(--semantic-good);
}

.one-idea-visual :deep(.demo-card) {
  width: 100%;
  min-width: 0;
  min-height: 180px;
  display: grid;
  grid-template-columns: 132px minmax(0, 1fr);
  gap: 28px;
  align-items: center;
}

.one-idea-visual :deep(.demo-mark) {
  width: 132px;
  height: 132px;
  border-radius: 18px;
  background: var(--accent);
  color: #FFFFFF;
  display: flex;
  align-items: center;
  justify-content: center;
  font: 700 54px/1 'Outfit', sans-serif;
}

.one-idea-visual :deep(.demo-title) {
  font: 700 42px/1.04 'Outfit', sans-serif;
  color: var(--text);
}

.one-idea-visual :deep(.demo-sub) {
  margin-top: 12px;
  font: 500 20px/1.32 'Inter', sans-serif;
  color: var(--text-soft);
}

.one-idea-visual :deep(.mini-graph) {
  width: 100%;
  height: 210px;
}

.one-idea-visual :deep(.warning-grid) {
  width: 100%;
  min-width: 0;
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: 24px;
  align-items: center;
}

.one-idea-visual :deep(.warning-panel) {
  min-height: 150px;
  padding: 24px;
  border-radius: 14px;
  background: #242424;
  border: 1.5px solid #3A3A3A;
  box-sizing: border-box;
  min-width: 0;
}

.one-idea-visual :deep(.warning-panel .viz-label) {
  color: #FFFFFF;
}

.one-idea-visual :deep(.warning-panel .viz-sub) {
  color: #BBBBBB;
}

.one-idea-visual :deep(.not-equal) {
  color: var(--accent);
  font: 700 48px/1 'Outfit', sans-serif;
}

.visual-placeholder {
  font-family: 'Inter', sans-serif;
  font-size: 20px;
  color: var(--text-muted);
}

.one-idea-note {
  margin-top: 18px;
  margin-bottom: 0;
  max-width: 760px;
  font-family: 'Inter', sans-serif;
  font-size: 18px;
  line-height: 1.4;
  color: var(--text-soft);
  flex: 0 0 auto;
}
</style>
