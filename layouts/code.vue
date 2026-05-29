<template>
  <section class="slidev-layout code-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="code-content">
      <div class="code-title">
        <slot name="title" />
      </div>

      <div class="code-area">
        <slot />
      </div>

      <div class="code-note">
        <slot name="note" />
      </div>
    </main>
  </section>
</template>

<style scoped>
.code-layout {
  background: var(--bg);
}

.code-content {
  margin-left: 8%;
  margin-top: 4%;
  width: min(72%, 980px);
}

.code-title {
  font-family: 'Outfit', sans-serif;
  font-size: 52px;
  font-weight: 700;
  line-height: 1.06;
  letter-spacing: -0.03em;
  color: var(--text);
}

.code-area {
  margin-top: 36px;
}

.code-note {
  margin-top: 24px;
  font-family: 'Inter', sans-serif;
  font-size: 18px;
  line-height: 1.4;
  color: var(--text-soft);
  max-width: 820px;
}

.code-area :deep(.generation-card) {
  width: min(100%, 820px);
  padding: 26px 28px;
  border: 1.5px solid var(--border);
  border-radius: 18px;
  background: #FFFFFF;
  box-sizing: border-box;
}

.code-area :deep(.generation-prompt) {
  display: inline-flex;
  max-width: 100%;
  padding: 10px 14px;
  border-radius: 12px;
  background: #F4F4F4;
  font: 600 18px/1.25 'Inter', sans-serif;
  color: var(--text);
}

.code-area :deep(.generation-code) {
  margin: 26px 0 0;
  min-height: 130px;
  padding: 22px 24px;
  border-radius: 14px;
  background: #111111;
  color: #FFFFFF;
  font: 600 34px/1.45 'Inter', monospace;
  white-space: pre-wrap;
  overflow: hidden;
}

.code-area :deep(.generation-code code) {
  font: inherit;
}

.code-area :deep(.generation-code .slidev-vclick-target) {
  color: #FFFFFF;
}

.code-area :deep(.generation-hint) {
  margin-top: 18px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.code-area :deep(.generation-hint span) {
  padding: 8px 12px;
  border-radius: 999px;
  background: #FFF7F7;
  color: var(--accent);
  font: 700 13px/1 'Inter', sans-serif;
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

</style>
