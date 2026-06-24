<template>
  <component :is="iconComponent" class="role-icon-svg" />
</template>

<script setup>
import { computed, defineAsyncComponent } from 'vue'
import IconQuestion from '~icons/ph/question-duotone'

const props = defineProps({
  name: {
    type: String,
    required: true,
  },
})

const legacyAliases = {
  student: 'ph:student-duotone',
  bug: 'ph:bug-duotone',
  pair: 'ph:users-three-duotone',
  review: 'ph:checks-duotone',
  docs: 'ph:book-open-duotone',
  tests: 'ph:test-tube-duotone',
}

const iconLoaders = {
  ...import.meta.glob('~icons/ph/*'),
  ...import.meta.glob('~icons/carbon/*'),
  ...import.meta.glob('~icons/svg-spinners/*'),
}

const supportedCollections = [...new Set(
  Object.keys(iconLoaders).map((path) => path.split('/')[2]),
)].sort((left, right) => right.length - left.length)

function normalizeIconPath(name) {
  const normalizedName = (legacyAliases[name] ?? name ?? '').trim()

  if (!normalizedName) {
    return null
  }

  if (normalizedName.startsWith('~icons/')) {
    return normalizedName
  }

  if (normalizedName.startsWith('i-')) {
    const componentName = normalizedName.slice(2)
    const collection = supportedCollections.find((candidate) => componentName.startsWith(`${candidate}-`))

    if (collection) {
      return `~icons/${collection}/${componentName.slice(collection.length + 1)}`
    }
  }

  const separator = normalizedName.includes(':')
    ? ':'
    : normalizedName.includes('/')
      ? '/'
      : null

  if (separator) {
    const [collection, iconName] = normalizedName.split(separator)

    if (collection && iconName) {
      return `~icons/${collection}/${iconName}`
    }
  }

  return `~icons/ph/${normalizedName}`
}

const iconComponent = computed(() => {
  const iconPath = normalizeIconPath(props.name)
  const loader = iconPath ? iconLoaders[iconPath] : null

  return loader ? defineAsyncComponent(loader) : IconQuestion
})
</script>
