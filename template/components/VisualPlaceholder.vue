<template>
  <div class="visual-placeholder-card" role="img" :aria-label="description">
    <div class="visual-placeholder-icon">
      <VisualIcon :name="resolvedIcon" />
    </div>
    <div class="visual-placeholder-copy">
      <div class="visual-placeholder-kind">{{ kindLabel }}</div>
      <div class="visual-placeholder-description">{{ description }}</div>
      <div v-if="expectedPath" class="visual-placeholder-path">{{ expectedPath }}</div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const props = defineProps({
  description: {
    type: String,
    required: true,
  },
  kind: {
    type: String,
    default: 'image',
  },
  icon: {
    type: String,
    default: '',
  },
  expectedPath: {
    type: String,
    default: '',
  },
})

const kindIcons = {
  image: 'ph:image-duotone',
  photo: 'ph:camera-duotone',
  screenshot: 'ph:browser-duotone',
  diagram: 'ph:graph-duotone',
  illustration: 'ph:paint-brush-duotone',
}

const kindLabels = {
  image: 'Chybějící obrázek',
  photo: 'Chybějící fotografie',
  screenshot: 'Chybějící screenshot',
  diagram: 'Chybějící diagram',
  illustration: 'Chybějící ilustrace',
}

const resolvedIcon = computed(() => props.icon || kindIcons[props.kind] || kindIcons.image)
const kindLabel = computed(() => kindLabels[props.kind] || kindLabels.image)
</script>

<style scoped>
.visual-placeholder-card {
  width: 100%;
  height: 100%;
  min-height: 220px;
  padding: 30px;
  border: 2px dashed #C9C9C9;
  border-radius: 18px;
  background: repeating-linear-gradient(-45deg, #FAFAFA, #FAFAFA 12px, #F5F5F5 12px, #F5F5F5 24px);
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 24px;
  color: var(--text);
}

.visual-placeholder-icon {
  width: 76px;
  height: 76px;
  flex: 0 0 76px;
  border-radius: 18px;
  background: #FFFFFF;
  border: 1.5px solid var(--border);
  color: var(--accent);
  display: flex;
  align-items: center;
  justify-content: center;
}

.visual-placeholder-icon :deep(svg) {
  width: 42px;
  height: 42px;
}

.visual-placeholder-copy { max-width: 620px; }
.visual-placeholder-kind {
  color: var(--accent);
  font: 700 13px/1 'Inter', sans-serif;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}
.visual-placeholder-description {
  margin-top: 10px;
  color: var(--text);
  font: 700 25px/1.15 'Outfit', sans-serif;
  text-wrap: balance;
}
.visual-placeholder-path {
  margin-top: 12px;
  color: var(--text-soft);
  font: 500 14px/1.3 'Inter', sans-serif;
}
</style>
