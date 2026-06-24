<template>
  <section class="slidev-layout pipeline-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="pipeline-content">
      <div class="slide-title pipeline-title">
        <slot name="title" />
      </div>

      <div
        class="pipeline"
        :class="mode === 'snake' ? 'pipeline-snake' : 'pipeline-vertical'"
        :style="pipelineStyle"
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

const pipelineStyle = computed(() => {
  const isVertical = props.mode !== 'snake'
  const denseVertical = isVertical && props.steps.length >= 5

  return {
    '--columns': props.columns,
    '--pipeline-margin-top': denseVertical ? '20px' : '30px',
    '--pipeline-step-min-height': denseVertical ? '52px' : '64px',
    '--pipeline-step-padding': denseVertical ? '10px 16px' : '12px 18px',
    '--pipeline-step-font-size': denseVertical ? '16px' : '18px',
    '--pipeline-step-line-height': denseVertical ? '1.15' : '1.2',
    '--pipeline-vertical-gap': denseVertical ? '4px' : '6px',
    '--pipeline-vertical-arrow-height': denseVertical ? '10px' : '16px',
    '--pipeline-note-margin-top': denseVertical ? '18px' : '26px',
    '--pipeline-snake-column-gap': '34px',
    '--pipeline-snake-row-gap': '42px',
    '--pipeline-snake-arrow-side-offset': '-25px',
    '--pipeline-snake-arrow-bottom-offset': '-32px',
    '--pipeline-snake-arrow-size': '20px',
  }
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
  margin-left: var(--content-inline-margin);
  margin-right: var(--content-inline-margin);
  margin-top: var(--slide-header-gap);
  width: auto;
  max-width: 1040px;
}

.pipeline-title {
  --slide-title-max-width: 820px;
  --slide-title-size: clamp(36px, 4.2vw, 46px);
  --slide-title-line-height: 1.04;
}

/* Shared */

.pipeline {
  margin-top: var(--pipeline-margin-top);
}

.pipeline-step {
  position: relative;

  min-height: var(--pipeline-step-min-height);
  height: auto;
  border: 1px solid var(--border);
  border-radius: 14px;
  background: #F4F4F4;

  display: flex;
  align-items: center;
  justify-content: center;

  padding: var(--pipeline-step-padding);

  font-family: 'Inter', sans-serif;
  font-size: var(--pipeline-step-font-size);
  font-weight: 500;
  color: var(--text);

  line-height: var(--pipeline-step-line-height);
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
  gap: var(--pipeline-vertical-gap);
}

.pipeline-vertical .pipeline-arrow {
  height: var(--pipeline-vertical-arrow-height);
}

/* Snake mode */

.pipeline-snake {
  width: 100%;

  display: grid;
  grid-template-columns: repeat(var(--columns), minmax(160px, 1fr));
  column-gap: var(--pipeline-snake-column-gap);
  row-gap: var(--pipeline-snake-row-gap);

  align-items: center;
}

/* Snake arrows */

.pipeline-snake .pipeline-step.arrow-right::after {
  content: "→";
  position: absolute;
  right: var(--pipeline-snake-arrow-side-offset);
  top: 50%;
  transform: translateY(-50%);
  color: #BBBBBB;
  font-size: var(--pipeline-snake-arrow-size);
  font-weight: 400;
}

.pipeline-snake .pipeline-step.arrow-left::after {
  content: "←";
  position: absolute;
  left: var(--pipeline-snake-arrow-side-offset);
  top: 50%;
  transform: translateY(-50%);
  color: #BBBBBB;
  font-size: var(--pipeline-snake-arrow-size);
  font-weight: 400;
}

.pipeline-snake .pipeline-step.arrow-down::after {
  content: "↓";
  position: absolute;
  left: 50%;
  bottom: var(--pipeline-snake-arrow-bottom-offset);
  transform: translateX(-50%);
  color: #BBBBBB;
  font-size: var(--pipeline-snake-arrow-size);
  font-weight: 400;
}

.pipeline-snake .pipeline-step.no-arrow::after {
  content: "";
}

/* Note */

.pipeline-note {
  margin-top: var(--pipeline-note-margin-top);
  max-width: 760px;

  font-family: 'Inter', sans-serif;
  font-size: 15px;
  line-height: 1.35;
  color: var(--text-soft);
}
</style>
