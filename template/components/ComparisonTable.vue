<template>
  <figure
    class="comparison-table-presenter flex w-full min-w-0 flex-col gap-3"
    :aria-label="resolvedAriaLabel"
  >
    <table
      class="w-full min-w-0 table-fixed border-separate border-spacing-0 overflow-hidden rounded-[18px] border border-solid"
      :class="[dense ? 'text-[14px] leading-[1.28]' : 'text-[15px] leading-[1.34]', { dense }]"
    >
      <caption
        v-if="caption"
        class="caption-side-top px-1 pb-2 text-left text-[12px] font-700 uppercase tracking-[0.08em]"
      >
        {{ caption }}
      </caption>

      <thead>
        <tr>
          <th scope="col" class="header-cell header-left px-4 py-3 text-left" :class="leftVariantClass">
            <div class="flex min-w-0 items-center gap-3">
              <VisualIcon v-if="leftIcon" :name="leftIcon" class="comparison-table-icon" />
              <span class="min-w-0 text-balance">{{ leftTitle }}</span>
            </div>
          </th>

          <th scope="col" class="header-cell header-right px-4 py-3 text-left" :class="rightVariantClass">
            <div class="flex min-w-0 items-center gap-3">
              <VisualIcon v-if="rightIcon" :name="rightIcon" class="comparison-table-icon" />
              <span class="min-w-0 text-balance">{{ rightTitle }}</span>
            </div>
          </th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="(row, rowIndex) in normalizedRows" :key="`compare-row-${rowIndex}`">
          <td class="body-cell left-cell align-top px-4 py-3 font-600" :class="leftVariantClass">
            {{ row[0] }}
          </td>
          <td class="body-cell right-cell align-top px-4 py-3 font-600" :class="rightVariantClass">
            {{ row[1] }}
          </td>
        </tr>
      </tbody>
    </table>
  </figure>
</template>

<script setup>
import { computed } from 'vue'
import VisualIcon from './VisualIcon.vue'

const variants = ['neutral', 'bad', 'good', 'accent', 'warning']

const props = defineProps({
  leftTitle: {
    type: String,
    required: true,
  },
  rightTitle: {
    type: String,
    required: true,
  },
  rows: {
    type: Array,
    default: () => [],
  },
  leftVariant: {
    type: String,
    default: 'neutral',
    validator: (value) => variants.includes(value),
  },
  rightVariant: {
    type: String,
    default: 'accent',
    validator: (value) => variants.includes(value),
  },
  leftIcon: {
    type: String,
    default: '',
  },
  rightIcon: {
    type: String,
    default: '',
  },
  caption: {
    type: String,
    default: '',
  },
  dense: {
    type: Boolean,
    default: false,
  },
  ariaLabel: {
    type: String,
    default: '',
  },
})

const normalizedRows = computed(() => props.rows.map((row) => [
  formatCell(row?.[0]),
  formatCell(row?.[1]),
]))

const leftVariantClass = computed(() => `variant-${props.leftVariant}`)
const rightVariantClass = computed(() => `variant-${props.rightVariant}`)
const resolvedAriaLabel = computed(() => props.ariaLabel || props.caption || 'Porovnávací tabulka')

function formatCell(value) {
  if (value === null || value === undefined)
    return ''

  return String(value)
}
</script>

<style scoped>
.comparison-table-presenter table {
  border-color: var(--border);
  background: #FFFFFF;
}

.comparison-table-presenter caption {
  color: var(--text-soft);
}

.comparison-table-presenter .header-cell {
  border-bottom: 1.5px solid var(--border);
  font-family: 'Outfit', sans-serif;
  font-size: 1.12em;
  font-weight: 700;
  line-height: 1.05;
}

.comparison-table-presenter .body-cell {
  border-bottom: 1px solid var(--border-soft);
  font-family: 'Inter', sans-serif;
  overflow-wrap: anywhere;
}

.comparison-table-presenter tbody tr:last-child .body-cell {
  border-bottom: none;
}

.comparison-table-presenter .header-right,
.comparison-table-presenter .right-cell {
  border-left: 1px solid var(--border-soft);
}

.comparison-table-presenter .variant-neutral {
  background: #F7F7F7;
  color: var(--text);
}

.comparison-table-presenter .variant-accent {
  background: #FFF7F7;
  color: var(--accent);
}

.comparison-table-presenter .variant-good {
  background: var(--semantic-good-soft);
  color: var(--semantic-good);
}

.comparison-table-presenter .variant-bad {
  background: var(--semantic-bad-soft);
  color: var(--semantic-bad);
}

.comparison-table-presenter .variant-warning {
  background: var(--semantic-warning-soft);
  color: var(--semantic-warning);
}

.comparison-table-presenter .body-cell.variant-neutral {
  color: var(--text);
}

.comparison-table-presenter .header-cell.variant-accent,
.comparison-table-presenter .header-cell.variant-good,
.comparison-table-presenter .header-cell.variant-bad,
.comparison-table-presenter .header-cell.variant-warning {
  border-bottom-color: rgba(17, 17, 17, 0.06);
}

.comparison-table-presenter .body-cell.variant-accent,
.comparison-table-presenter .body-cell.variant-good,
.comparison-table-presenter .body-cell.variant-bad,
.comparison-table-presenter .body-cell.variant-warning {
  border-bottom-color: rgba(17, 17, 17, 0.06);
}

.comparison-table-presenter :deep(svg) {
  display: block;
}

.comparison-table-icon {
  width: 24px;
  height: 24px;
  flex: 0 0 24px;
}

.comparison-table-icon :deep(svg) {
  width: 100%;
  height: 100%;
}

.comparison-table-presenter table.dense .header-cell,
.comparison-table-presenter table.dense .body-cell {
  padding-top: 0.7rem;
  padding-bottom: 0.7rem;
}
</style>
