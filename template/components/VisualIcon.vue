<template>
  <component :is="iconComponent" class="visual-icon-svg" aria-hidden="true" />
</template>

<script setup>
import { computed } from 'vue'
import IconArrowClockwise from '~icons/ph/arrow-clockwise-duotone'
import IconArrowsClockwise from '~icons/ph/arrows-clockwise-duotone'
import IconBookOpen from '~icons/ph/book-open-duotone'
import IconBracketsCurly from '~icons/ph/brackets-curly-duotone'
import IconBrain from '~icons/ph/brain-duotone'
import IconBrowser from '~icons/ph/browser-duotone'
import IconBug from '~icons/ph/bug-duotone'
import IconCamera from '~icons/ph/camera-duotone'
import IconChartBar from '~icons/ph/chart-bar-duotone'
import IconChatCircleText from '~icons/ph/chat-circle-text-duotone'
import IconChat from '~icons/ph/chat-centered-text-duotone'
import IconCheckCircle from '~icons/ph/check-circle-duotone'
import IconChecks from '~icons/ph/checks-duotone'
import IconCircles from '~icons/ph/circles-three-plus-duotone'
import IconCursorText from '~icons/ph/cursor-text-duotone'
import IconDatabase from '~icons/ph/database-duotone'
import IconFiles from '~icons/ph/files-duotone'
import IconGauge from '~icons/ph/gauge-duotone'
import IconGear from '~icons/ph/gear-duotone'
import IconGlobe from '~icons/ph/globe-duotone'
import IconGraph from '~icons/ph/graph-duotone'
import IconImage from '~icons/ph/image-duotone'
import IconInfo from '~icons/ph/info-duotone'
import IconLaptop from '~icons/ph/laptop-duotone'
import IconLightbulb from '~icons/ph/lightbulb-duotone'
import IconListChecks from '~icons/ph/list-checks-duotone'
import IconMagnifyingGlass from '~icons/ph/magnifying-glass-duotone'
import IconMap from '~icons/ph/map-trifold-duotone'
import IconPaintBrush from '~icons/ph/paint-brush-duotone'
import IconPencil from '~icons/ph/pencil-simple-duotone'
import IconPlayCircle from '~icons/ph/play-circle-duotone'
import IconPlay from '~icons/ph/play-duotone'
import IconPresentationChart from '~icons/ph/presentation-chart-duotone'
import IconQuestion from '~icons/ph/question-duotone'
import IconRobot from '~icons/ph/robot-duotone'
import IconRocket from '~icons/ph/rocket-launch-duotone'
import IconShieldCheck from '~icons/ph/shield-check-duotone'
import IconSparkle from '~icons/ph/sparkle-duotone'
import IconStudent from '~icons/ph/student-duotone'
import IconTarget from '~icons/ph/target-duotone'
import IconTestTube from '~icons/ph/test-tube-duotone'
import IconTree from '~icons/ph/tree-structure-duotone'
import IconTrendDown from '~icons/ph/trend-down-duotone'
import IconTrendUp from '~icons/ph/trend-up-duotone'
import IconUserFocus from '~icons/ph/user-focus-duotone'
import IconUsers from '~icons/ph/users-three-duotone'
import IconWarning from '~icons/ph/warning-duotone'
import IconWrench from '~icons/ph/wrench-duotone'
import IconXCircle from '~icons/ph/x-circle-duotone'

const props = defineProps({ name: { type: String, required: true } })

const legacyAliases = {
  student: 'ph:student-duotone', bug: 'ph:bug-duotone', pair: 'ph:users-three-duotone',
  review: 'ph:checks-duotone', docs: 'ph:book-open-duotone', tests: 'ph:test-tube-duotone',
}

const icons = {
  'ph:arrow-clockwise-duotone': IconArrowClockwise,
  'ph:arrows-clockwise-duotone': IconArrowsClockwise,
  'ph:book-open-duotone': IconBookOpen,
  'ph:brackets-curly-duotone': IconBracketsCurly,
  'ph:brain-duotone': IconBrain,
  'ph:browser-duotone': IconBrowser,
  'ph:bug-duotone': IconBug,
  'ph:camera-duotone': IconCamera,
  'ph:chart-bar-duotone': IconChartBar,
  'ph:chat-circle-text-duotone': IconChatCircleText,
  'ph:chat-centered-text-duotone': IconChat,
  'ph:check-circle-duotone': IconCheckCircle,
  'ph:checks-duotone': IconChecks,
  'ph:circles-three-plus-duotone': IconCircles,
  'ph:cursor-text-duotone': IconCursorText,
  'ph:database-duotone': IconDatabase,
  'ph:files-duotone': IconFiles,
  'ph:gauge-duotone': IconGauge,
  'ph:gear-duotone': IconGear,
  'ph:globe-duotone': IconGlobe,
  'ph:graph-duotone': IconGraph,
  'ph:image-duotone': IconImage,
  'ph:info-duotone': IconInfo,
  'ph:laptop-duotone': IconLaptop,
  'ph:lightbulb-duotone': IconLightbulb,
  'ph:list-checks-duotone': IconListChecks,
  'ph:magnifying-glass-duotone': IconMagnifyingGlass,
  'ph:map-trifold-duotone': IconMap,
  'ph:paint-brush-duotone': IconPaintBrush,
  'ph:pencil-simple-duotone': IconPencil,
  'ph:play-circle-duotone': IconPlayCircle,
  'ph:play-duotone': IconPlay,
  'ph:presentation-chart-duotone': IconPresentationChart,
  'ph:question-duotone': IconQuestion,
  'ph:robot-duotone': IconRobot,
  'ph:rocket-launch-duotone': IconRocket,
  'ph:shield-check-duotone': IconShieldCheck,
  'ph:sparkle-duotone': IconSparkle,
  'ph:student-duotone': IconStudent,
  'ph:target-duotone': IconTarget,
  'ph:test-tube-duotone': IconTestTube,
  'ph:tree-structure-duotone': IconTree,
  'ph:trend-down-duotone': IconTrendDown,
  'ph:trend-up-duotone': IconTrendUp,
  'ph:user-focus-duotone': IconUserFocus,
  'ph:users-three-duotone': IconUsers,
  'ph:warning-duotone': IconWarning,
  'ph:wrench-duotone': IconWrench,
  'ph:x-circle-duotone': IconXCircle,
}

function normalizeName(name) {
  const normalized = (legacyAliases[name] ?? name ?? '').trim()
  if (normalized.startsWith('~icons/ph/')) return `ph:${normalized.slice(10)}`
  if (normalized.startsWith('i-ph-')) return `ph:${normalized.slice(5)}`
  if (!normalized.includes(':') && !normalized.includes('/')) return `ph:${normalized}`
  return normalized.replace('/', ':')
}

const iconComponent = computed(() => icons[normalizeName(props.name)] ?? IconQuestion)
</script>
