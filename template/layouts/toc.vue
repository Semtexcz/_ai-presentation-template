<template>
  <section
    class="slidev-layout toc-layout"
    :class="{ 'with-anchor': showAnchor }"
  >
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="toc-content">
      <div class="toc-title">
        <slot name="title">Co se naučíš?</slot>
      </div>

      <div v-if="columns === 1" class="toc-list">
        <div
          v-for="(item, index) in items"
          :key="item"
          class="toc-item"
          :class="{ active: index === active }"
        >
          <div class="toc-number">
            {{ formatNumber(index) }}
          </div>

          <div class="toc-label">
            {{ item }}
          </div>
        </div>
      </div>

      <div v-else class="toc-columns">
        <div class="toc-column">
          <div
            v-for="(item, index) in leftColumn"
            :key="item"
            class="toc-item"
            :class="{ active: index === active }"
          >
            <div class="toc-number">
              {{ formatNumber(index) }}
            </div>

            <div class="toc-label">
              {{ item }}
            </div>
          </div>
        </div>

        <div class="toc-column">
          <div
            v-for="(item, localIndex) in rightColumn"
            :key="item"
            class="toc-item"
            :class="{ active: splitIndex + localIndex === active }"
          >
            <div class="toc-number">
              {{ formatNumber(splitIndex + localIndex) }}
            </div>

            <div class="toc-label">
              {{ item }}
            </div>
          </div>
        </div>
      </div>
    </main>

    <div v-if="showAnchor" class="toc-anchor"></div>
  </section>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  items: {
    type: Array,
    default: () => [],
  },
  active: {
    type: Number,
    default: 0,
  },
  showAnchor: {
    type: Boolean,
    default: false,
  },
  columns: {
    type: Number,
    default: 1,
  },
})

const splitIndex = computed(() => Math.ceil(props.items.length / 2))

const leftColumn = computed(() => props.items.slice(0, splitIndex.value))

const rightColumn = computed(() => props.items.slice(splitIndex.value))

function formatNumber(index) {
  return String(index + 1).padStart(2, '0')
}
</script>

<style scoped>
.toc-layout {
  position: relative;
  background: var(--bg);
  overflow: hidden;
}

.toc-content {
  margin-left: var(--content-inline-margin);
  margin-right: var(--content-inline-margin);
  margin-top: 3%;
  width: auto;
  max-width: 980px;
}

.toc-title {
  font-family: 'Outfit', sans-serif;
  font-size: 54px;
  font-weight: 700;
  line-height: 1.02;
  letter-spacing: -0.04em;
  color: var(--text);
}

.toc-list {
  margin-top: 36px;
  width: min(58%, 760px);
}

.toc-columns {
  margin-top: 36px;
  width: 100%;

  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 56px;
}

.toc-column {
  display: flex;
  flex-direction: column;
}

.toc-item {
  display: grid;
  grid-template-columns: 44px 1fr;
  column-gap: 28px;
  align-items: center;

  padding: 12px 0;

  border-bottom: 1px solid var(--border-soft);
}

.toc-column .toc-item:last-child,
.toc-list .toc-item:last-child {
  border-bottom: none;
}

.toc-number {
  font-family: 'Inter', sans-serif;
  font-size: 17px;
  font-weight: 600;
  color: #A0A0A0;
}

.toc-label {
  font-family: 'Outfit', sans-serif;
  font-size: 30px;
  font-weight: 600;
  line-height: 1.08;
  color: #333333;
}

.toc-item.active {
  border-bottom: 2px solid var(--accent);
}

.toc-item.active .toc-number,
.toc-item.active .toc-label {
  color: var(--accent);
}

.toc-item.active .toc-label {
  font-weight: 700;
}

.toc-anchor {
  position: absolute;
  right: 13%;
  top: 32%;

  width: 180px;
  height: 180px;

  border-radius: 999px;
  border: 2px solid var(--border-soft);
}

.toc-anchor::before {
  content: '';
  position: absolute;
  left: 50%;
  top: 48%;

  width: 100px;
  height: 50px;

  transform: translate(-50%, -50%);

  border-top-left-radius: 100px;
  border-top-right-radius: 100px;

  border: 5px solid var(--accent);
  border-bottom: none;
}
</style>
