<template>
  <section class="slidev-layout code-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main ref="codeContentEl" class="code-content">
      <div class="code-title">
        <slot name="title" />
      </div>

      <div ref="codeAreaEl" class="code-area">
        <slot />
      </div>

      <div v-if="$slots.note" class="code-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<script setup>
import { nextTick, onBeforeUnmount, onMounted, onUpdated, ref } from 'vue'

const props = defineProps({
  codeFontMin: {
    type: Number,
    default: 12,
  },
})

const codeContentEl = ref(null)
const codeAreaEl = ref(null)
let resizeObserver

function getCodeBlocks() {
  return Array.from(codeAreaEl.value?.querySelectorAll('.generation-code, pre') ?? [])
}

function getBaseCodeFontSize(blocks) {
  const sizes = blocks
    .map((block) => Number.parseFloat(getComputedStyle(block).fontSize))
    .filter((size) => Number.isFinite(size))

  return sizes.length ? Math.min(...sizes) : props.codeFontMin
}

function getTrackedBottom(blocks) {
  const note = codeContentEl.value?.querySelector('.code-note')

  if (note)
    return note.getBoundingClientRect().bottom

  const lastBlock = blocks.at(-1)
  if (lastBlock)
    return lastBlock.getBoundingClientRect().bottom

  return codeAreaEl.value?.getBoundingClientRect().bottom ?? 0
}

function fitsWithinBottomGap(blocks) {
  const contentRect = codeContentEl.value?.getBoundingClientRect()
  if (!contentRect)
    return true

  const bottomGap = Number.parseFloat(
    getComputedStyle(codeContentEl.value).getPropertyValue('--code-bottom-gap'),
  ) || 0

  return getTrackedBottom(blocks) <= contentRect.bottom - bottomGap
}

async function fitCodeBlocks() {
  await nextTick()

  const codeArea = codeAreaEl.value
  if (!codeArea)
    return

  const blocks = getCodeBlocks()
  if (!blocks.length) {
    codeArea.style.removeProperty('--code-font-size')
    return
  }

  codeArea.style.removeProperty('--code-font-size')
  await nextTick()

  const minSize = Math.max(1, props.codeFontMin)
  let size = Math.max(getBaseCodeFontSize(blocks), minSize)
  codeArea.style.setProperty('--code-font-size', `${size}px`)
  await nextTick()

  while (!fitsWithinBottomGap(blocks) && size > minSize) {
    size -= 1
    codeArea.style.setProperty('--code-font-size', `${size}px`)
    await nextTick()
  }
}

onMounted(() => {
  fitCodeBlocks()

  if (codeContentEl.value) {
    resizeObserver = new ResizeObserver(fitCodeBlocks)
    resizeObserver.observe(codeContentEl.value)
  }
})

onUpdated(fitCodeBlocks)

onBeforeUnmount(() => {
  resizeObserver?.disconnect()
})
</script>

<style scoped>
.code-layout {
  background: var(--bg);
  height: 100%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.code-content {
  --code-bottom-gap: 24px;
  margin-left: 8%;
  margin-right: 8%;
  margin-top: 4%;
  padding-bottom: var(--code-bottom-gap);
  width: auto;
  max-width: 1100px;
  height: 100%;
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
}

.code-title {
  font-family: 'Outfit', sans-serif;
  font-size: 52px;
  font-weight: 700;
  line-height: 1.06;
  letter-spacing: -0.03em;
  color: var(--text);
}

.code-area {
  --code-font-size: 26px;
  margin-top: 30px;
  width: 100%;
  min-height: 0;
}

.code-note {
  margin-top: 24px;
  font-family: 'Inter', sans-serif;
  font-size: 18px;
  line-height: 1.4;
  color: var(--text-soft);
  max-width: 820px;
}

.code-area :deep(.generation-card) {
  width: 100%;
  padding: 26px 28px;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #FFFFFF;
  box-sizing: border-box;
}

.code-area :deep(.generation-prompt) {
  display: inline-flex;
  max-width: 100%;
  padding: 10px 14px;
  border-radius: 12px;
  background: #F4F4F4;
  font: 600 18px/1.25 'Inter', sans-serif;
  color: var(--text);
}

.code-area :deep(.generation-code) {
  margin: 26px 0 0;
  min-height: 130px;
  padding: 22px 24px;
  border-radius: 14px;
  background: #111111;
  color: #FFFFFF;
  font-family: 'Inter', monospace;
  font-size: var(--code-font-size);
  font-weight: 600;
  line-height: 1.45;
  white-space: pre-wrap;
  overflow: hidden;
}

.code-area :deep(.generation-code code) {
  font: inherit;
}

.code-area :deep(.generation-code .slidev-vclick-target) {
  color: #FFFFFF;
}

.code-area :deep(.generation-hint) {
  margin-top: 18px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.code-area :deep(.generation-hint span) {
  padding: 8px 12px;
  border-radius: 999px;
  background: #FFF7F7;
  color: var(--accent);
  font: 700 13px/1 'Inter', sans-serif;
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.code-area :deep(.slidev-code-wrapper) {
  width: 100%;
}

.code-area :deep(pre) {
  width: 100%;
  margin: 0;
  padding: 24px 28px !important;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #F4F4F4 !important;
  box-sizing: border-box;
  color: var(--text) !important;
  font-family: 'Inter', monospace !important;
  font-size: var(--code-font-size) !important;
  font-weight: 500;
  line-height: 1.38 !important;
  white-space: pre-wrap !important;
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
  overflow: hidden;
}

.code-area :deep(pre code) {
  display: block;
  padding: 0;
  background: transparent;
  color: inherit;
  font: inherit;
  white-space: inherit;
  word-break: inherit;
  overflow-wrap: inherit;
}

</style>
