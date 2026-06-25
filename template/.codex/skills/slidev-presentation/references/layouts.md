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
| Vstup vlevo, prompt nebo reakce vpravo | `split-demo` | Demo-first slide pro kód, zadání, dokumentaci a prompt. |
| Přechod k živé ukázce | `live-demo` | Prohlížeč, AI nástroj nebo terminál. |
| Fotografie, screenshot nebo obrazový důkaz | `image-focus` | Lokální obrázek nebo popsaný placeholder. |

Pro množství použij `BarChart`, pro několik klíčových hodnot `MetricStrip`, pro
vztahy `HubDiagram`, pro přesný prompt `PromptCard`, pro krátkou sledovanou
sekvenci `StepCards`, pro strukturovaná data `DataTable` a pro krátké
dvousloupcové kontrasty `ComparisonTable` uvnitř `one-idea` nebo
`split-demo`. Obecná schémata lze zapsat také pomocí Mermaid. `pipeline`
ponech pro lineární pořadí a `grid` pro rovnocenné kategorie.

Layouty jsou výchozí doporučení. Pokud zvolený layout zhoršuje čitelnost nebo
nutí obsah do špatné struktury, použij `one-idea` s vhodnými komponentami nebo
vlastní jednoduchou HTML strukturou.

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
- prop `icon` — volitelná významová Iconify ikona.

### `statement`

Použití: jedna silná takeaway věta.

- prop `align`: `left` (výchozí) nebo `center`.
- prop `icon` — volitelná ikona upozornění, pravidla nebo stavu.
- `#title` — hlavní věta.
- `#subtitle` — volitelné krátké upřesnění.

### `toc`

Použití: obsah, mapa nebo rekapitulace částí.

- prop `items` — pole položek.
- položka může být string nebo `{ label, icon? }`.
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
- krok může být string nebo `{ label, subtitle?, icon? }`.
- prop `active` — index aktivního kroku od `0`.
- prop `mode` — `vertical` nebo `snake`.
- prop `columns` — počet sloupců ve `snake` režimu.

`vertical` používej pro krátký sled kroků a drž ho maximálně na 5 položkách.
Od 6 kroků přepni na `snake`, jinak slide zbytečně ztrácí čitelnost.

### `code`

Použití: kód, prompt, příkaz, výpočet nebo terminálový výstup.

- prop `codeFontMin` — minimální velikost písma, výchozí `12`.
- prop `icon` — volitelná ikona typu obsahu, například prompt, terminál či kód.
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
- props `leftIcon`, `rightIcon` — volitelné významové ikony panelů.
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

Pro jednoduché dvě varianty bez širšího demo kontextu používej raději
`text-compare`. `split-demo` je vhodnější tehdy, když levý a pravý panel nesou
odlišnou roli, například vstup vs prompt nebo kód vs revizní zadání.

### `split-demo`

Použití: demo-first slide pro práci vedle sebe, typicky vstup vlevo a prompt,
iteraci nebo otázky vpravo.

- `#title` — takeaway nadpis.
- `#left`, `#right` — levý a pravý panel.
- `#note` — volitelná krátká pointa pod oběma panely.
- props `leftTitle`, `rightTitle` — titulky panelů.
- props `leftIcon`, `rightIcon` — volitelné významové ikony panelů.
- props `leftVariant`, `rightVariant` — `neutral`, `bad`, `good`, `accent`,
  `warning`.
- prop `codeFontMin` — minimální velikost písma pro bloky `pre`, výchozí `12`.
- prop `leftWidth` — poměr levého panelu vůči pravému; výchozí `1`.

Výchozí poměr je 1:1. Pokud blok začíná být přehuštěný, neroztahuj slide
nekonečně ani nesnižuj písmo pod čitelnost; rozděl obsah do dvou slidů.

Pro jeden dlouhý prompt nebo jeden dlouhý kód používej raději `code`.

### `live-demo`

Použití: čistý přechod před živou ukázkou.

- prop `kicker` — přepis výchozího textu `Živá ukázka`.
- prop `icon` — Iconify ikona; výchozí je symbol spuštění.
- `#title` — co se bude dít.
- `#subtitle` — volitelný krátký popis.

### `image-focus`

Použití: fotografie, screenshot, ilustrace nebo jiný obrazový důkaz.

- prop `image` — lokální cesta k obrázku.
- prop `alt` — smysluplný alternativní popis.
- prop `position` — `left` nebo `right`, výchozí `right`.
- prop `fit` — `cover` nebo `contain`, výchozí `cover`.
- prop `placeholder` — popis požadovaného obrázku, pokud asset chybí.
- prop `placeholderKind` — `image`, `photo`, `screenshot`, `diagram` nebo `illustration`.
- `#title`, `#caption`, `#source` — textové sloty.

Pokud `image` chybí nebo se nenačte, layout automaticky zobrazí
`VisualPlaceholder`. Takový slide se sestaví, ale placeholder musí být uveden
ve finálním reportu jako nedokončený asset.

## Vizuální komponenty

Všechny komponenty jsou určené především do slotu `#visual` layoutu
`one-idea`.

### `VisualIcon`

- prop `name` — Iconify identifikátor z vestavěného registru, například
  `ph:target-duotone` nebo `ph:chart-bar-duotone`.
- Registr obsahuje běžné prezentační koncepty z kolekce Phosphor; neznámá
  ikona se bezpečně nahradí otazníkem. Novou opakovaně potřebnou ikonu přidej
  statickým importem do `VisualIcon.vue`.
- Ikona musí nést význam. Dekorace se nepočítá jako informační vizuál.

### `BarChart`

- props `items`, `max?`, `ariaLabel?`.
- 1–6 položek `{ label, value, displayValue?, highlight? }`.
- Hodnoty jsou nezáporné; `max` umožní držet společnou stupnici.

### `MetricStrip`

- prop `items` — 1–4 položky `{ value, label, detail?, icon?, variant? }`.
- `variant` je `neutral`, `accent`, `good` nebo `bad`.

### `HubDiagram`

- prop `center` — `{ title, subtitle?, icon? }`.
- prop `items` — 2–6 souvisejících uzlů stejného tvaru.
- prop `ariaLabel?` — popis vztahového schématu.

### `CycleDiagram`

- prop `steps` — 3–5 stringů nebo objektů `{ title, subtitle?, icon? }`.
- prop `active?` — index zvýrazněného kroku.
- prop `ariaLabel?` — popis cyklu.

### `PromptCard`

- props `title?`, `kicker?`, `icon?`.
- prop `variant?` — `neutral`, `accent`, `good`, `bad`, `warning`.
- prop `compact?` — zhuštěná varianta pro menší plochy.

Použití: přesně viditelný prompt, který má zůstat na slidu jako artefakt.
Komponenta funguje uvnitř `one-idea`, `split-demo` i vlastního HTML.

Pro dlouhý prompt vlož do slotu fenced code block nebo `<pre>`. `PromptCard`
není kopírovací widget ani editor; je to vizuálně odlišená karta.

### `StepCards`

- props `steps`, `active?`, `columns?`, `ariaLabel?`.
- 2–5 kroků; od 4 kroků se komponenta sama zhušťuje.
- Použití: krátká sekvence, iterace, checklist checkpointů.

### `DataTable`

- props `columns`, `rows`, `caption?`, `dense?`, `striped?`,
  `highlightFirstColumn?`, `ariaLabel?`.
- Použití: problém -> řešení, situace -> doporučení, pojem -> význam, chyba ->
  oprava, checklist, přehled možností.
- Doporučené limity: 2 až 4 sloupce a 3 až 6 řádků.
- `rows` mohou být pole hodnot nebo objekty; u objektů se buňky berou podle
  názvů v `columns`.
- Použij `dense`, jen když se tabulka blíží horní hranici hustoty. Neřeš
  přeplněný slide dalším zmenšováním písma; rozděl obsah do dvou slidů.

Použij `DataTable`, když je nejdůležitější čitelná mřížka vztahů mezi více
sloupci. Nepoužívej ji pro dva delší textové bloky, silně narativní srovnání
ani pro seznam rovnocenných kategorií bez potřeby buněk.

```vue
<DataTable
  :columns="['Situace', 'Použij']"
  :rows="[
    ['Jeden dlouhý prompt', 'code'],
    ['Kód + prompt', 'split-demo'],
    ['Dvě krátké varianty', 'ComparisonTable'],
  ]"
  caption="Volba prezentační struktury"
  striped
  highlight-first-column
/>
```

### `ComparisonTable`

- props `leftTitle`, `rightTitle`, `rows`, `leftVariant?`, `rightVariant?`,
  `leftIcon?`, `rightIcon?`, `caption?`, `dense?`, `ariaLabel?`.
- Použití: vágní vs konkrétní, špatně vs dobře, před vs po, riziko vs
  bezpečnější řešení.
- Doporučené limity: 2 až 6 řádků, krátké texty v obou sloupcích.
- Varianty: `neutral`, `bad`, `good`, `accent`, `warning`.

Použij `ComparisonTable`, když máš několik krátkých dvojic a potřebuješ je
vizuálně čitelně rozlišit po řádcích. Nepoužívej ji pro dva větší odstavcové
bloky; tam je vhodnější `text-compare`. Pokud levý a pravý panel nesou odlišnou
roli, například vstup vs prompt, vrať se ke `split-demo`.

```vue
<ComparisonTable
  left-title="Vágně"
  right-title="Konkrétně"
  left-variant="bad"
  right-variant="good"
  :rows="[
    ['Oprav kód', 'Najdi chybu a vysvětli ji'],
    ['Napiš program', 'Použij pouze input a if'],
  ]"
/>
```

## Rozhodování mezi bloky

- Použij `DataTable`: strukturovaná data ve 2 až 4 sloupcích.
- Použij `ComparisonTable`: více krátkých dvojic v levém a pravém sloupci.
- Použij `text-compare`: dva větší bloky textu nebo promptů.
- Použij `split-demo`: vstup vlevo, prompt nebo instrukce vpravo.
- Použij `grid`: rovnocenné kategorie nebo karty bez tabulkových buněk.

### `VisualPlaceholder`

- prop `description` — povinný konkrétní popis chybějícího vizuálu.
- props `kind?`, `icon?`, `expectedPath?`.
- Použij pouze tehdy, když potřebný lokální asset není dostupný. Placeholder
  zachovává layout a build, ale není hotovým vizuálem.

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

## Demo-first příklady

### `split-demo`

````md
---
layout: split-demo
leftTitle: Zadání
rightTitle: Prompt
leftIcon: ph:brackets-curly-duotone
rightIcon: ph:chat-circle-text-duotone
rightVariant: accent
title: "Přesný vstup vedle přesného promptu"
---

<template #title>
Přesný vstup vedle přesného promptu.
</template>

<template #left>

~~~py
def total(items):
    return sum(items)
~~~

</template>

<template #right>
<PromptCard title="Revizní prompt" kicker="Prompt" icon="ph:chat-circle-text-duotone" variant="accent">

~~~text
Najdi dvě rizika a navrhni bezpečnější variantu.
~~~

</PromptCard>
</template>
````

### `PromptCard`

````md
<PromptCard title="Prompt pro iteraci" kicker="Upřesnění" icon="ph:cursor-text-duotone" variant="good">

~~~text
Doplň konkrétní data z dokumentace a zachovej stejný formát výstupu.
~~~

</PromptCard>
````

### `StepCards`

```md
<StepCards
  :steps="[
    { title: 'Prompt', icon: 'ph:pencil-simple-duotone' },
    { title: 'Výstup', icon: 'ph:chat-centered-text-duotone' },
    { title: 'Kontrola', icon: 'ph:magnifying-glass-duotone', variant: 'accent' },
    { title: 'Iterace', icon: 'ph:arrow-clockwise-duotone' },
  ]"
  :active="2"
/>
```
