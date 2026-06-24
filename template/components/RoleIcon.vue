<template>
  <component :is="iconComponent" class="role-icon-svg" />
</template>

<script setup>
import { computed } from 'vue'
import IconBookOpen from '~icons/ph/book-open-duotone'
import IconBug from '~icons/ph/bug-duotone'
import IconChecks from '~icons/ph/checks-duotone'
import IconStudent from '~icons/ph/student-duotone'
import IconTestTube from '~icons/ph/test-tube-duotone'
import IconUsersThree from '~icons/ph/users-three-duotone'

const props = defineProps({
  name: {
    type: String,
    required: true,
  },
})

const icons = {
  student: IconStudent,
  bug: IconBug,
  pair: IconUsersThree,
  review: IconChecks,
  docs: IconBookOpen,
  tests: IconTestTube,
}

const iconComponent = computed(() => icons[props.name] ?? IconStudent)
</script>
