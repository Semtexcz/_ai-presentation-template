<template>
  <figure
    class="data-table-presenter flex w-full min-w-0 flex-col gap-3"
    :aria-label="resolvedAriaLabel"
  >
    <table
      class="w-full min-w-0 table-fixed border-separate border-spacing-0 overflow-hidden rounded-[18px] border border-solid"
      :class="[
        dense ? 'text-[14px] leading-[1.28]' : 'text-[15px] leading-[1.35]',
        { striped, dense, 'highlight-first-column': highlightFirstColumn },
      ]"
    >
      <caption
        v-if="caption"
        class="caption-side-top px-1 pb-2 text-left text-[12px] font-700 uppercase tracking-[0.08em]"
      >
        {{ caption }}
      </caption>

      <thead>
        <tr>
          <th
            v-for="(column, index) in normalizedColumns"
            :key="`${column}-${index}`"
            scope="col"
            class="px-4 py-3 text-left font-700"
          >
            {{ column }}
          </th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="(row, rowIndex) in normalizedRows"
          :key="`row-${rowIndex}`"
        >
          <td
            v-for="(cell, cellIndex) in row"
            :key="`cell-${rowIndex}-${cellIndex}`"
            class="align-top px-4 py-3"
            :class="cellIndex === 0 && highlightFirstColumn ? 'font-700' : 'font-500'"
          >
            {{ cell }}
          </td>
        </tr>
      </tbody>
    </table>
  </figure>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  columns: {
    type: Array,
    default: () => [],
  },
  rows: {
    type: Array,
    default: () => [],
  },
  caption: {
    type: String,
    default: '',
  },
  dense: {
    type: Boolean,
    default: false,
  },
  striped: {
    type: Boolean,
    default: false,
  },
  highlightFirstColumn: {
    type: Boolean,
    default: false,
  },
  ariaLabel: {
    type: String,
    default: '',
  },
})

const normalizedColumns = computed(() => props.columns.map((column) => String(column ?? '').trim()))

const normalizedRows = computed(() => {
  const columnCount = normalizedColumns.value.length

  return props.rows.map((row) => {
    if (Array.isArray(row)) {
      return normalizedColumns.value.map((_, index) => formatCell(row[index]))
    }

    return normalizedColumns.value.map((column) => formatCell(row?.[column]))
  })
})

const resolvedAriaLabel = computed(() => props.ariaLabel || props.caption || 'Datová tabulka')

function formatCell(value) {
  if (value === null || value === undefined)
    return ''

  return String(value)
}
</script>

<style scoped>
.data-table-presenter table {
  border-color: var(--border);
  background: #FFFFFF;
}

.data-table-presenter caption {
  color: var(--text-soft);
}

.data-table-presenter thead th {
  border-bottom: 1.5px solid var(--border);
  background: #F6F6F6;
  color: var(--text);
  font-family: 'Outfit', sans-serif;
  font-size: 1.08em;
  line-height: 1.05;
  text-wrap: balance;
}

.data-table-presenter tbody td {
  border-bottom: 1px solid var(--border-soft);
  color: var(--text);
  font-family: 'Inter', sans-serif;
  overflow-wrap: anywhere;
}

.data-table-presenter tbody tr:last-child td {
  border-bottom: none;
}

.data-table-presenter tbody td + td,
.data-table-presenter thead th + th {
  border-left: 1px solid var(--border-soft);
}

.data-table-presenter.striped tbody tr:nth-child(even) td {
  background: #FCFCFC;
}

.data-table-presenter.highlight-first-column tbody td:first-child {
  background: #FFF8F8;
  color: var(--accent);
}

.data-table-presenter.dense thead th,
.data-table-presenter.dense tbody td {
  padding-top: 0.7rem;
  padding-bottom: 0.7rem;
}
</style>
