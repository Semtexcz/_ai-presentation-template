<template>
  <section class="slidev-layout hero-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="hero-content">
      <div class="hero-title">
        <slot name="title" />
      </div>

      <div class="hero-subtitle">
        <slot name="subtitle" />
      </div>

      <div class="hero-accent"></div>
    </main>
  </section>
</template>

<style scoped>
.hero-layout {
  background: var(--bg);
}

.hero-content {
  margin-left: var(--content-inline-margin);
  margin-right: var(--content-inline-margin);
  margin-top: 7%;

  max-width: 560px;
}

.hero-title {
  font-family: 'Outfit', sans-serif;
  font-size: 68px;
  font-weight: 700;
  line-height: 1.03;
  color: var(--text);

  max-width: 520px;
}

.hero-subtitle {
  font-family: 'Inter', sans-serif;
  font-size: 22px;
  line-height: 1.28;
  color: #666666;

  max-width: 520px;

  margin-top: 34px;
}

.hero-accent {
  width: 96px;
  height: 5px;
  background: var(--accent);
  border-radius: 999px;

  margin-top: 28px;
}
</style>
