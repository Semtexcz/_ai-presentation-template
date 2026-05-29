# Slidev Presentation Template

Čistá šablona pro tvorbu dalších prezentací ve Slidev. Obsahuje vlastní layouty, globální styl a startovací `slides.md`.

## Použití

```bash
pnpm install
pnpm run dev
```

Výchozí adresa je `http://localhost:3030`. Pokud je port obsazený:

```bash
pnpm exec slidev --port 4100
```

Produkční build:

```bash
pnpm run build
```

Export:

```bash
pnpm run export
```

## Jak založit novou prezentaci

1. Vytvoř nové repo z této šablony.
2. Uprav `package.json`, hlavně `name`.
3. Přepiš `slides.md`.
4. Přidej vlastní obrázky do `images/` nebo `public/`, pokud je prezentace potřebuje.
5. Layouty měň jen tehdy, když se změna má projevit ve všech dalších prezentacích.

## Struktura

- `slides.md` - startovací prezentace.
- `layouts/` - vlastní Slidev layouty.
- `components/` - sdílené komponenty layoutů.
- `styles/index.css` - globální barvy, fonty a breadcrumb styl.
- `snippets/` - volitelné ukázkové soubory pro code slidy.

## Společný frontmatter

Vlastní layouty používají tyto společné atributy:

```yaml
section: Kontext
current: Hlavní otázka
breadcrumb:
  - Název prezentace
  - Kontext
  - Hlavní otázka
title: "Jakou otázku řešíme?"
```

`breadcrumb` se zobrazí v horní navigační stopě. Pokud chybí, layout použije dvojici `section` a `current`. `title` je metadata pro Slidev; viditelný nadpis se většinou vkládá do slotu `#title`.

## Layout: hero

Použití pro úvodní, závěrečné a velké přechodové slidy.

Sloty:

- `#title` - hlavní nadpis.
- `#subtitle` - podpůrný text pod nadpisem.

```md
---
layout: hero
section: Název prezentace
current: Úvod
title: "Název prezentace"
---

<template #title>
Název<br>
prezentace.
</template>

<template #subtitle>
Krátký podtitulek prezentace.
</template>
```

## Layout: toc

Použití pro mapu prezentace nebo rekapitulaci částí.

Frontmatter:

- `items` - pole položek obsahu.
- `active` - index aktivní položky, počítáno od `0`.
- `columns` - `1` nebo `2`; výchozí hodnota je `1`.
- `showAnchor` - `true` zobrazí dekorativní kruhový symbol vpravo.

## Layout: one-idea

Použití pro jeden silný koncept na slide. Má nadpis, vizuální plochu a krátkou poznámku.

Frontmatter:

- `visualFrame` - `true`/`false`; výchozí `true`.
- `visualVariant` - `default`, `diagram`, `equation`, `comparison`, `demo` nebo `warning`.

Sloty:

- `#title` - hlavní myšlenka slidu.
- `#visual` - obrázek, SVG nebo HTML struktura.
- `#note` - krátká vysvětlující věta pod vizuálem.

Pomocné CSS třídy ve vizuálu:

- `.flow`, `.flow-step`, `.flow-kicker`, `.flow-label`, `.flow-sub`
- `.equation`, `.term`, `.operator`, `.term.accent`
- `.comparison`, `.comparison-panel`, `.comparison-panel.accent`
- `.demo-card`, `.demo-mark`, `.demo-title`, `.demo-sub`
- `.warning-grid`, `.warning-panel`, `.not-equal`
- `.mini-graph`

## Layout: pipeline

Použití pro procesy a opakující se kroky.

Frontmatter:

- `steps` - pole kroků.
- `active` - index aktivního kroku, počítáno od `0`.
- `mode` - `vertical` nebo `snake`.
- `columns` - počet sloupců pro `snake`.

## Layout: code

Použití pro ukázky textu, kódu, výpočtů nebo terminálových příkladů.

Sloty:

- `#title` - nadpis ukázky.
- výchozí slot - Markdown obsah, typicky fenced code block.
- `#note` - krátká poznámka pod ukázkou.

## Stylové zásady

- Drž jednoduchou paletu definovanou v `styles/index.css`.
- Nepoužívej dekorace bez informační funkce.
- U `one-idea` preferuj konkrétní diagram, srovnání nebo graf před dlouhým textem.
- Dlouhé vysvětlení patří do speaker notes.
- Nový layout přidej jen tehdy, když opakovaně řeší jiný typ slidu než existující layouty.
