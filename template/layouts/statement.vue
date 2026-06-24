<template>
  <section class="slidev-layout statement-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="statement-content" :class="`align-${align}`">
      <div v-if="icon" class="statement-icon"><VisualIcon :name="icon" /></div>
      <div class="slide-title statement-title">
        <slot name="title" />
      </div>
      <div v-if="$slots.subtitle" class="statement-subtitle">
        <slot name="subtitle" />
      </div>
    </main>
  </section>
</template>

<script setup>
import VisualIcon from '../components/VisualIcon.vue'

defineProps({
  icon: { type: String, default: '' },
  align: {
    type: String,
    default: 'left',
    validator: (value) => ['left', 'center'].includes(value),
  },
})
</script>

<style scoped>
.statement-layout {
  background: var(--bg);
  display: flex;
  flex-direction: column;
}

.statement-content {
  margin: auto var(--content-inline-margin);
  padding-bottom: 4%;
  max-width: 980px;
}

.statement-content.align-center {
  align-self: center;
  text-align: center;
}

.statement-icon { width: 58px; height: 58px; margin-bottom: 24px; color: var(--accent); }
.statement-icon :deep(svg) { width: 100%; height: 100%; }
.statement-content.align-center .statement-icon { margin-left: auto; margin-right: auto; }

.statement-title {
  --slide-title-size: clamp(52px, 6.4vw, 74px);
  --slide-title-line-height: 1.04;
  --slide-title-letter-spacing: -0.045em;
}

.statement-subtitle {
  margin-top: 26px;
  max-width: 760px;
  color: var(--text-soft);
  font: 500 22px/1.35 'Inter', sans-serif;
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
}

.statement-content.align-center .statement-subtitle {
  margin-left: auto;
  margin-right: auto;
}
</style>
