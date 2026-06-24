<template>
  <section class="slidev-layout grid-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="grid-content">
      <div class="slide-title grid-title">
        <slot name="title" />
      </div>

      <div class="grid-cards" :class="`columns-${normalizedColumns}`">
        <article
          v-for="(item, index) in items"
          :key="index"
          class="grid-card"
          :class="{ 'has-icon': item.icon }"
        >
          <div v-if="item.icon" class="grid-icon" aria-hidden="true">
            <VisualIcon :name="item.icon" />
          </div>

          <div class="grid-copy">
            <div v-if="item.kicker" class="grid-kicker">{{ item.kicker }}</div>
            <div class="grid-label">{{ item.title }}</div>
            <div v-if="item.subtitle" class="grid-sub">{{ item.subtitle }}</div>
          </div>
        </article>
      </div>

      <div v-if="$slots.note" class="grid-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from '../components/VisualIcon.vue'

const props = defineProps({
  items: {
    type: Array,
    default: () => [],
  },
  columns: {
    type: Number,
    default: 3,
  },
})

const normalizedColumns = computed(() => (props.columns === 2 ? 2 : 3))
</script>

<style scoped>
.grid-layout {
  background: var(--bg);
  overflow: hidden;
}

.grid-content {
  margin-left: var(--content-inline-margin);
  margin-right: var(--content-inline-margin);
  margin-top: var(--slide-header-gap);
  width: auto;
  display: flex;
  flex-direction: column;
}

.grid-title {
  --slide-title-max-width: 900px;
}

.grid-cards {
  margin-top: 28px;
  width: 100%;
  display: grid;
  gap: 18px;
  align-items: stretch;
}

.grid-cards.columns-2 {
  grid-template-columns: repeat(2, minmax(0, 1fr));
}

.grid-cards.columns-3 {
  grid-template-columns: repeat(3, minmax(0, 1fr));
}

.grid-card {
  min-width: 0;
  min-height: 142px;
  padding: 18px 18px 20px;
  border: 1.5px solid var(--border);
  border-radius: 16px;
  background: #FFFFFF;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  gap: 18px;
}

.grid-card.has-icon {
  background: #FFF8F8;
}

.grid-icon {
  width: 52px;
  height: 52px;
  border-radius: 14px;
  border: 1.5px solid rgba(241, 30, 30, 0.2);
  background: #FFF5F5;
  color: var(--accent);
  display: inline-flex;
  align-items: center;
  justify-content: center;
  box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.65);
}

.grid-icon :deep(svg),
.grid-icon :deep(.role-icon-svg) {
  width: 30px;
  height: 30px;
  display: block;
}

.grid-copy {
  display: flex;
  flex-direction: column;
  gap: 8px;
  min-width: 0;
}

.grid-kicker {
  font: 700 12px/1 'Inter', sans-serif;
  color: var(--text-soft);
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.grid-label {
  font: 700 22px/1.08 'Outfit', sans-serif;
  color: var(--text);
  text-wrap: balance;
}

.grid-sub {
  font: 500 14px/1.32 'Inter', sans-serif;
  color: var(--text-soft);
}

.grid-note {
  margin-top: 22px;
  font: 500 18px/1.35 'Inter', sans-serif;
  color: var(--text-soft);
  max-width: 820px;
}
</style>
