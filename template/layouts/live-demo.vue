<template>
  <section class="slidev-layout live-demo-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="live-demo-content">
      <div class="live-demo-kicker">{{ kicker }}</div>
      <div class="live-demo-title">
        <slot name="title" />
      </div>
      <div v-if="$slots.subtitle" class="live-demo-subtitle">
        <slot name="subtitle" />
      </div>
    </main>
  </section>
</template>

<script setup>
defineProps({
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

.live-demo-title {
  margin-top: 22px;
  color: var(--text);
  font: 700 clamp(56px, 7vw, 78px)/1.02 'Outfit', sans-serif;
  letter-spacing: -0.04em;
  word-break: normal;
  overflow-wrap: normal;
  hyphens: none;
  text-wrap: balance;
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
