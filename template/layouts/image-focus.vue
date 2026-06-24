<template>
  <section class="slidev-layout image-focus-layout">
    <Breadcrumb :levels="$attrs.breadcrumb" :section="$attrs.section" :current="$attrs.current" />

    <main class="image-focus-content" :class="`position-${normalizedPosition}`">
      <div class="image-focus-copy">
        <div class="slide-title image-focus-title"><slot name="title" /></div>
        <div v-if="$slots.caption" class="image-focus-caption"><slot name="caption" /></div>
        <div v-if="$slots.source" class="image-focus-source"><slot name="source" /></div>
      </div>

      <div class="image-focus-media" :class="`fit-${normalizedFit}`">
        <img v-if="image && !imageFailed" :src="image" :alt="alt" @error="imageFailed = true">
        <VisualPlaceholder
          v-else
          :description="placeholder || alt || 'Doplňte obrázek, který nese hlavní sdělení slidu.'"
          :kind="placeholderKind"
          :expected-path="image"
        />
      </div>
    </main>
  </section>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import VisualPlaceholder from '../components/VisualPlaceholder.vue'

const props = defineProps({
  image: { type: String, default: '' },
  alt: { type: String, default: '' },
  position: { type: String, default: 'right' },
  fit: { type: String, default: 'cover' },
  placeholder: { type: String, default: '' },
  placeholderKind: { type: String, default: 'image' },
})

const imageFailed = ref(false)
watch(() => props.image, () => { imageFailed.value = false })
const normalizedPosition = computed(() => props.position === 'left' ? 'left' : 'right')
const normalizedFit = computed(() => props.fit === 'contain' ? 'contain' : 'cover')
</script>

<style scoped>
.image-focus-layout { background: var(--bg); overflow: hidden; }
.image-focus-content { margin: var(--slide-header-gap) var(--content-inline-margin) 0; height: calc(100% - 64px); display: grid; grid-template-columns: minmax(280px, .75fr) minmax(460px, 1.25fr); gap: 34px; align-items: stretch; }
.image-focus-content.position-left { grid-template-columns: minmax(460px, 1.25fr) minmax(280px, .75fr); }
.image-focus-content.position-left .image-focus-copy { order: 2; }
.image-focus-content.position-left .image-focus-media { order: 1; }
.image-focus-copy { padding: 18px 0 30px; display: flex; flex-direction: column; justify-content: center; }
.image-focus-title { --slide-title-size: clamp(38px, 4.5vw, 50px); --slide-title-max-width: 480px; }
.image-focus-caption { margin-top: 24px; color: var(--text-soft); font: 500 19px/1.4 'Inter', sans-serif; }
.image-focus-source { margin-top: auto; padding-top: 20px; color: var(--text-muted); font: 500 12px/1.3 'Inter', sans-serif; }
.image-focus-media { min-width: 0; min-height: 0; margin-bottom: 12px; border-radius: 20px; overflow: hidden; background: #F2F2F2; display: flex; align-items: center; justify-content: center; }
.image-focus-media img { width: 100%; height: 100%; display: block; }
.image-focus-media.fit-cover img { object-fit: cover; }
.image-focus-media.fit-contain img { object-fit: contain; padding: 20px; box-sizing: border-box; }
</style>
