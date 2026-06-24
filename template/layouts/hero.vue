<template>
  <section class="slidev-layout hero-layout">
    <Breadcrumb
      :levels="$attrs.breadcrumb"
      :section="$attrs.section"
      :current="$attrs.current"
    />

    <main class="hero-content">
      <div class="slide-title hero-title">
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
  margin-top: clamp(28px, 5vh, 48px);

  max-width: 560px;
}

.hero-title {
  --slide-title-size: clamp(56px, 6.3vw, 68px);
  --slide-title-line-height: 1.03;
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
