<template>
  <section class="slidev-layout live-demo-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="live-demo-content">
      <div class="live-demo-heading">
        <VisualIcon v-if="icon" :name="icon" />
        <div class="live-demo-kicker">{{ kicker }}</div>
      </div>
      <div class="slide-title live-demo-title">
        <slot name="title" />
      </div>
      <div v-if="$slots.subtitle" class="live-demo-subtitle">
        <slot name="subtitle" />
      </div>
    </main>
  </section>
</template>

<script setup>
import VisualIcon from '../components/VisualIcon.vue'

defineProps({
  icon: { type: String, default: 'ph:play-circle-duotone' },
  kicker: {
    type: String,
    default: 'Živá ukázka',
  },
})
</script>

<style scoped>
.live-demo-layout {
  background: var(--bg);
  display: flex;
  flex-direction: column;
}

.live-demo-content {
  margin: auto var(--content-inline-margin);
  padding-bottom: 4%;
  max-width: 920px;
}

.live-demo-kicker {
  color: var(--accent);
  font: 700 15px/1 'Inter', sans-serif;
  letter-spacing: 0.1em;
  text-transform: uppercase;
}

.live-demo-heading { display: flex; align-items: center; gap: 12px; color: var(--accent); }
.live-demo-heading :deep(svg) { width: 30px; height: 30px; }

.live-demo-title {
  margin-top: 22px;
  --slide-title-size: clamp(50px, 6.2vw, 72px);
  --slide-title-line-height: 1.02;
  --slide-title-letter-spacing: -0.04em;
}

.live-demo-subtitle {
  margin-top: 28px;
  color: var(--text-soft);
  font: 500 24px/1.3 'Inter', sans-serif;
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
}
</style>
