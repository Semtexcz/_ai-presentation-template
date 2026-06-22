<template>
  <section class="slidev-layout pipeline-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="pipeline-content">
      <div class="pipeline-title">
        <slot name="title" />
      </div>

      <div
        class="pipeline"
        :class="mode === 'snake' ? 'pipeline-snake' : 'pipeline-vertical'"
        :style="{ '--columns': columns }"
      >
        <template v-for="(step, index) in arrangedSteps" :key="index">
          <div
            class="pipeline-step"
            :class="[
              { active: step.originalIndex === active },
              stepClass(index),
            ]"
          >
            {{ step.label }}
          </div>

          <div v-if="mode === 'vertical' && index < arrangedSteps.length - 1" class="pipeline-arrow">
            ↓
          </div>
        </template>
      </div>

      <div class="pipeline-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  steps: {
    type: Array,
    default: () => [],
  },
  active: {
    type: Number,
    default: 0,
  },
  mode: {
    type: String,
    default: 'vertical',
  },
  columns: {
    type: Number,
    default: 3,
  },
})

const arrangedSteps = computed(() => {
  if (props.mode !== 'snake') {
    return props.steps.map((label, originalIndex) => ({
      label,
      originalIndex,
    }))
  }

  const rows = []

  for (let i = 0; i < props.steps.length; i += props.columns) {
    const row = props.steps.slice(i, i + props.columns).map((label, offset) => ({
      label,
      originalIndex: i + offset,
    }))

    const rowIndex = Math.floor(i / props.columns)
    rows.push(rowIndex % 2 === 0 ? row : row.reverse())
  }

  return rows.flat()
})

function rowIndex(index) {
  return Math.floor(index / props.columns)
}

function isLastStep(step) {
  return step.originalIndex === props.steps.length - 1
}

function isEndOfRow(index) {
  return props.mode === 'snake' && (index + 1) % props.columns === 0
}

function isStartOfRow(index) {
  return props.mode === 'snake' && index % props.columns === 0
}

function stepClass(index) {
  if (props.mode !== 'snake') return ''

  const step = arrangedSteps.value[index]

  if (isLastStep(step)) return 'no-arrow'

  const row = rowIndex(index)
  const evenRow = row % 2 === 0

  if (evenRow && isEndOfRow(index)) return 'arrow-down'
  if (!evenRow && isStartOfRow(index)) return 'arrow-down'

  return evenRow ? 'arrow-right' : 'arrow-left'
}
</script>

<style scoped>
.pipeline-layout {
  background: var(--bg);
  overflow: hidden;
}

.pipeline-content {
  margin-left: 8%;
  margin-top: 2.8%;
  width: min(76%, 1040px);
}

.pipeline-title {
  font-family: 'Outfit', sans-serif;
  font-size: 44px;
  font-weight: 700;
  line-height: 1.04;
  letter-spacing: -0.03em;
  color: var(--text);
  max-width: 820px;
}

/* Shared */

.pipeline {
  margin-top: 30px;
}

.pipeline-step {
  position: relative;

  min-height: 64px;
  height: auto;
  border: 1px solid var(--border);
  border-radius: 14px;
  background: #F4F4F4;

  display: flex;
  align-items: center;
  justify-content: center;

  padding: 12px 18px;

  font-family: 'Inter', sans-serif;
  font-size: 18px;
  font-weight: 500;
  color: var(--text);

  line-height: 1.2;
  text-align: center;
  white-space: normal;
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
  text-wrap: balance;
}

.pipeline-step.active {
  border: 2px solid var(--accent);
  background: #FFF7F7;
  color: var(--accent);
  font-weight: 600;
}

.pipeline-arrow {
  display: flex;
  align-items: center;
  justify-content: center;
  color: #BBBBBB;
  font-size: 18px;
  line-height: 1;
}

/* Vertical mode */

.pipeline-vertical {
  width: min(38%, 480px);
  margin-left: 12%;

  display: flex;
  flex-direction: column;
  gap: 6px;
}

.pipeline-vertical .pipeline-arrow {
  height: 16px;
}

/* Snake mode */

.pipeline-snake {
  width: 100%;

  display: grid;
  grid-template-columns: repeat(var(--columns), minmax(160px, 1fr));
  column-gap: 34px;
  row-gap: 42px;

  align-items: center;
}

/* Snake arrows */

.pipeline-snake .pipeline-step.arrow-right::after {
  content: "→";
  position: absolute;
  right: -25px;
  top: 50%;
  transform: translateY(-50%);
  color: #BBBBBB;
  font-size: 20px;
  font-weight: 400;
}

.pipeline-snake .pipeline-step.arrow-left::after {
  content: "←";
  position: absolute;
  left: -25px;
  top: 50%;
  transform: translateY(-50%);
  color: #BBBBBB;
  font-size: 20px;
  font-weight: 400;
}

.pipeline-snake .pipeline-step.arrow-down::after {
  content: "↓";
  position: absolute;
  left: 50%;
  bottom: -32px;
  transform: translateX(-50%);
  color: #BBBBBB;
  font-size: 20px;
  font-weight: 400;
}

.pipeline-snake .pipeline-step.no-arrow::after {
  content: "";
}

/* Note */

.pipeline-note {
  margin-top: 26px;
  max-width: 760px;

  font-family: 'Inter', sans-serif;
  font-size: 15px;
  line-height: 1.35;
  color: var(--text-soft);
}
</style>
