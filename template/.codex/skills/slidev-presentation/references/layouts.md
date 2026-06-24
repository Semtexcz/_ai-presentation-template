# Layouty a jejich API

Načti tuto referenci pouze při výběru layoutu, práci s jeho props nebo sloty,
úpravě frontmatteru či použití pomocných vizuálních tříd.

## Obsah

- [Výběr layoutu](#výběr-layoutu)
- [Společný frontmatter](#společný-frontmatter)
- [API layoutů](#api-layoutů)
- [Vizuální stavební bloky](#vizuální-stavební-bloky)
- [Minimální příklad](#minimální-příklad)

## Výběr layoutu

| Potřeba | Layout | Použití |
|---|---|---|
| Úvod, závěr nebo velký přechod | `hero` | Krátký titul a podtitul. |
| Jedna silná věta | `statement` | Jedna pointa bez karet. |
| Obsah, mapa nebo rekapitulace | `toc` | Sekce a aktivní položka. |
| Koncept s vizuálem | `one-idea` | Výchozí volba pro výukový slide. |
| Mřížka rolí, kategorií nebo karet | `grid` | Opakující se položky s volitelnou ikonou. |
| Proces nebo algoritmus | `pipeline` | Krátké navazující kroky. |
| Kód, prompt, příkaz nebo strukturovaný text | `code` | Jen relevantní výřez. |
| Dva porovnávané textové bloky | `text-compare` | Původní vs upravené, špatné vs lepší. |
| Přechod k živé ukázce | `live-demo` | Prohlížeč, AI nástroj nebo terminál. |

## Společný frontmatter

```yaml
section: Kontext
current: Hlavní otázka
breadcrumb:
  - Název prezentace
  - Kontext
  - Hlavní otázka
title: "Jakou otázku řešíme?"
```

- `breadcrumb` preferuj u delších prezentací.
- `section` a `current` fungují jako náhradní navigační metadata.
- `title` jsou Slidev metadata; viditelný nadpis obvykle patří do `#title`.
- Navigační popisky drž krátké a konzistentní.

## API layoutů

### `hero`

Použití: úvod, závěr nebo velký přechod.

- `#title` — hlavní nadpis.
- `#subtitle` — volitelný podpůrný text.

### `statement`

Použití: jedna silná takeaway věta.

- prop `align`: `left` (výchozí) nebo `center`.
- `#title` — hlavní věta.
- `#subtitle` — volitelné krátké upřesnění.

### `toc`

Použití: obsah, mapa nebo rekapitulace částí.

- prop `items` — pole položek.
- prop `active` — index aktivní položky od `0`.
- prop `columns` — `1` nebo `2`, výchozí `1`.
- prop `showAnchor` — zobrazí pravý kruhový symbol.

### `one-idea`

Použití: jeden koncept s vizuální plochou.

- prop `visualFrame` — zobrazí rám vizuálu; výchozí `true`.
- prop `visualVariant` — `default`, `diagram`, `equation`, `comparison`,
  `demo` nebo `warning`.
- `#title` — takeaway nadpis.
- `#visual` — HTML, SVG, obrázek nebo jiná vizuální struktura.
- `#note` — volitelná krátká věta pod vizuálem.

### `grid`

Použití: opakující se karty, role, use-casy, kategorie nebo stručná tabulka bez
potřeby ručně skládat HTML.

- prop `items` — pole objektů s klíči:
  `title` (povinné), `subtitle` (volitelné), `kicker` (volitelné),
  `icon` (volitelné; podporuje Iconify identifikátor jako `ph:student-duotone`
  nebo `carbon:user-avatar`, případně staré aliasy `student`, `bug`, `pair`,
  `review`, `docs`, `tests` kvůli kompatibilitě).
- prop `columns` — `2` nebo `3`, výchozí `3`.
- `#title` — takeaway nadpis.
- `#note` — volitelná krátká věta pod gridem.

`grid` použij tehdy, když všechny položky mají stejnou vizuální strukturu.
Pokud potřebuješ různorodý HTML obsah nebo složitější diagram, vrať se k
`one-idea` a vlastnímu `#visual`.

### `pipeline`

Použití: proces, workflow nebo algoritmus.

- prop `steps` — pole krátkých popisků kroků.
- prop `active` — index aktivního kroku od `0`.
- prop `mode` — `vertical` nebo `snake`.
- prop `columns` — počet sloupců ve `snake` režimu.

`vertical` používej pro krátký sled kroků a drž ho maximálně na 5 položkách.
Od 6 kroků přepni na `snake`, jinak slide zbytečně ztrácí čitelnost.

### `code`

Použití: kód, prompt, příkaz, výpočet nebo terminálový výstup.

- prop `codeFontMin` — minimální velikost písma, výchozí `12`.
- `#title` — nadpis ukázky.
- výchozí slot — Markdown, obvykle fenced code block.
- `#note` — krátký kontext pod ukázkou.

Layout sjednocuje velikost více bloků a při hustším obsahu ji zmenšuje, ale
nejde pod `codeFontMin`. Dlouhý obsah raději rozděl.

### `text-compare`

Použití: přesně dva textové bloky.

- prop `mode` — `horizontal` (výchozí) nebo `vertical`.
- props `leftTitle`, `rightTitle` — titulky panelů.
- props `leftKicker`, `rightKicker` — volitelné kickery.
- props `leftVariant`, `rightVariant` — `neutral`, `bad`, `good` nebo `accent`.
- `#title` — takeaway nadpis.
- `#left`, `#right` — porovnávaný obsah.
- `#note` — volitelná krátká pointa.

`horizontal` použij pro krátký kontrast. `vertical` použij pro delší prompt
určený ke čtení nebo kopírování. Pro tři a více bloků obsah rozděl; pro jeden
velmi dlouhý blok použij `code`.

Pro polarity typu špatně vs dobře používej `bad` a `good`: špatná varianta je
červená, dobrá zelená. `accent` nech jen pro zvýraznění bez hodnotového
kontrastu.

### `live-demo`

Použití: čistý přechod před živou ukázkou.

- prop `kicker` — přepis výchozího textu `Živá ukázka`.
- `#title` — co se bude dít.
- `#subtitle` — volitelný krátký popis.

## Vizuální stavební bloky

Před vlastním HTML/CSS preferuj existující třídy:

- `.flow`, `.flow-step`, `.flow-kicker`, `.flow-label`, `.flow-sub`
- `.equation`, `.term`, `.operator`, `.term.accent`
- `.comparison`, `.comparison-panel`, `.comparison-panel.bad`, `.comparison-panel.good`, `.comparison-panel.accent`
- `.demo-card`, `.demo-mark`, `.demo-title`, `.demo-sub`
- `.warning-grid`, `.warning-panel`, `.not-equal`
- `.mini-graph`

Používej je k odhalení struktury, ne jako dekoraci. Pro skutečný proces použij
`pipeline`; položky `.flow` nemají automatické šipky.

## Minimální příklad

```md
---
layout: one-idea
section: Kontext
current: Hlavní myšlenka
breadcrumb:
  - Název prezentace
  - Kontext
  - Hlavní myšlenka
visualVariant: diagram
title: "Jedna jasná myšlenka"
---

<template #title>
Jedna jasná myšlenka.
</template>

<template #visual>
<div class="flow">
  <div class="flow-step">
    <div class="flow-kicker">1</div>
    <div class="flow-label">Vstup</div>
    <div class="flow-sub">Co máme na začátku.</div>
  </div>
  <div class="flow-step">
    <div class="flow-kicker">2</div>
    <div class="flow-label">Model</div>
    <div class="flow-sub">Jak tomu rozumíme.</div>
  </div>
  <div class="flow-step">
    <div class="flow-kicker">3</div>
    <div class="flow-label">Akce</div>
    <div class="flow-sub">Co uděláme dál.</div>
  </div>
</div>
</template>

<template #note>
Detail vysvětli ústně, ne textem na slidu.
</template>
```
