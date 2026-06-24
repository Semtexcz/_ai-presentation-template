<template>
  <VisualIcon :name="name" class="role-icon-svg" />
</template>

<script setup>
import VisualIcon from './VisualIcon.vue'

const props = defineProps({
  name: {
    type: String,
    required: true,
  },
})

</script>
