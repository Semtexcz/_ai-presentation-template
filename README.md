# Copier Template pro Slidev prezentace

Čistá Copier šablona pro tvorbu dalších prezentací ve Slidev. Obsahuje vlastní layouty, globální styl a startovací `slides.md`.

Aktuální verze templatu: `v0.2.0`.

## Použití

```bash
copier copy path/to/_ai-presentation-template moje-prezentace
cd moje-prezentace
pnpm install
pnpm run dev
```

Výchozí adresa je `http://localhost:3030`. Pokud je port obsazený:

```bash
pnpm exec slidev --port 4100
```

Produkční build ve vygenerované prezentaci:

```bash
pnpm run build
```

Export ve vygenerované prezentaci:

```bash
pnpm run export
```

## Jak založit novou prezentaci

1. Nainstaluj Copier podle dokumentace: `pipx install copier`, `uv tool install copier` nebo jiným podporovaným způsobem.
2. Spusť `copier copy path/to/_ai-presentation-template moje-prezentace`.
3. Odpověz na otázky pro název projektu, slug, titulek, podtitulek a autora.
4. Ve vygenerovaném adresáři spusť `pnpm install` a `pnpm run dev`.
5. Přepiš `slides.md`.
6. Přidej vlastní obrázky do `images/` nebo `public/`, pokud je prezentace potřebuje.

Pozdější update z nové verze templatu:

```bash
copier update
```

Změny mezi releasy jsou v [CHANGELOG.md](/mnt/Data/1_Drive/1_Projekty/Softwarové projekty/_ai-presentation-template/CHANGELOG.md).

## Struktura

- `copier.yml` - otázky a nastavení Copier templatu.
- `template/` - soubory, ze kterých vzniká nová prezentace.
- `template/slides.md.jinja` - startovací prezentace s proměnnými.
- `template/package.json.jinja` - package metadata s názvem podle `project_slug`.
- `template/{{ _copier_conf.answers_file }}.jinja` - answers soubor pro budoucí `copier update`.
- `template/layouts/` - vlastní Slidev layouty.
- `template/components/` - sdílené komponenty layoutů.
- `template/styles/index.css` - globální barvy, fonty a breadcrumb styl.
- `template/snippets/` - volitelné ukázkové soubory pro code slidy.

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

## Live lecture pravidla

Template je určený pro živý výklad. Slide funguje jako vizuální kotva pro řečníka, ne jako samostatný studijní materiál.

- Slide není studijní materiál.
- Každý slide má jednu funkci: myšlenka, ukázka, demo, cvičení nebo shrnutí.
- Dlouhé vysvětlení patří do speaker notes jako HTML komentář.
- Prompt na slidu má mít maximálně 4–6 řádků.
- Nepoužívej více než 3–4 karty v jednom řádku.
- Pokud se text nevejde bez ošklivého lámání slov, slide je příliš hustý.
- Pro živý přechod do prohlížeče nebo terminálu použij `live-demo`.
- Pro jednu silnou větu použij `statement`.

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

## Layout: statement

Použití pro jednu velkou větu bez karet nebo rámu. Volitelný `#subtitle` doplní krátké upřesnění. Frontmatter `align` podporuje `left` (výchozí) a `center`.

Sloty:

- `#title` - jediná hlavní myšlenka.
- `#subtitle` - volitelná krátká podpůrná věta.

## Layout: one-idea

Použití pro jeden silný koncept na slide. Má nadpis, vizuální plochu a krátkou poznámku.

Frontmatter:

- `visualFrame` - `true`/`false`; výchozí `true`.
- `visualVariant` - `default`, `diagram`, `equation`, `comparison`, `demo` nebo `warning`.

Sloty:

- `#title` - hlavní myšlenka slidu.
- `#visual` - obrázek, SVG nebo HTML struktura.
- `#note` - volitelná krátká takeaway věta pod vizuálem; dlouhý výklad patří do speaker notes.

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

Běžný fenced code block se zobrazí jako světlá, velká karta vhodná pro prompt nebo krátkou demo ukázku. Drž ho na 4–6 řádcích; syntax highlighting použij jen tehdy, když pomáhá výkladu.

## Layout: live-demo

Použití jako čistý přechod před živou ukázkou v AI, prohlížeči nebo terminálu. Neobsahuje karty, code area ani note area.

Sloty:

- `#title` - co se teď bude dít.
- `#subtitle` - volitelný krátký popis ukázky.

Frontmatter `kicker` může přepsat výchozí text `Živá ukázka`.

## Stylové zásady

- Drž jednoduchou paletu definovanou v `styles/index.css`.
- Nepoužívej dekorace bez informační funkce.
- U `one-idea` preferuj konkrétní diagram, srovnání nebo graf před dlouhým textem.
- Pro skutečné procesy použij `pipeline`; karty v `.flow` nemají výchozí šipky.
- Dlouhé vysvětlení patří do speaker notes.
- Nový layout přidej jen tehdy, když opakovaně řeší jiný typ slidu než existující layouty.

## Příklady dobrých promptů

Pokud chceš přes AI vygenerovat první verzi `slides.md`, vyplatí se zadat nejen téma, ale i cílové publikum, strukturu a omezení templatu. Tyto prompty fungují výrazně lépe než obecné "udělej mi prezentaci".

### 1. Návrh celé prezentace

```text
Vytvoř obsah souboru slides.md pro Slidev prezentaci v češtině.
Téma: Jak zavést interní AI asistenty do produktového týmu.
Cílové publikum: vedení firmy a seniorní product manažeři.
Cíl prezentace: vysvětlit přínosy, rizika, plán pilotu a rozhodnutí na konci.

Použij pouze layouty hero, toc, one-idea, pipeline a code.
Prezentace má mít 10 slidů.
Každý slide musí mít smysluplný frontmatter včetně section, current a title.
U one-idea preferuj diagram, srovnání nebo jednoduchý decision framework místo odstavců textu.
Text drž stručný, konkrétní a bez marketingových frází.
Na konec přidej slide s jasným doporučením a dalšími kroky.

Vrať pouze validní obsah slides.md.
```

### 2. Přepsání osnovy do tohoto templatu

```text
Převeď tuto osnovu do Slidev slides.md s využitím layoutů z tohoto templatu:
1. Problém: týmy tráví moc času ruční přípravou podkladů
2. Kde AI pomůže nejdřív
3. Kde AI naopak nechceme nasadit
4. Návrh pilotu na 6 týdnů
5. Metriky úspěchu
6. Rozhodnutí pro management

Požadavky:
- první slide jako hero
- druhý slide jako toc
- procesní část dej do pipeline
- pokud se hodí ukázka promptu nebo výstupu, použij code layout
- každý slide ať obsahuje jen jednu hlavní myšlenku
- speaker notes nepřidávej

Vrať jen Markdown pro slides.md.
```

### 3. Jeden silný slide místo textové omáčky

```text
Navrhni jeden slide s layoutem one-idea pro téma:
"Ne každá AI automatizace šetří čas."

Chci:
- výrazný titul do slotu title
- vizuál jako comparison mezi "rychlé demo" a "udržitelný provoz"
- krátkou note větu, která vysvětlí trade-off
- minimum textu, maximum srozumitelnosti

Výstup vrať jako kompletní Markdown jednoho slidu včetně frontmatteru.
```

### 4. Slide s ukázkou promptu nebo terminálu

```text
Vytvoř slide s layoutem code, který ukazuje praktický prompt pro shrnutí zákaznických ticketů.
Potřebuji:
- krátký český nadpis
- realistický prompt ve fenced code blocku
- pod tím krátkou poznámku, kdy takový prompt funguje a kdy už nestačí
- žádné obecné poučky, jen konkrétní ukázku

Vrať pouze jeden slide jako Markdown.
```

### 5. Revize už existující prezentace

```text
Zkontroluj následující obsah slides.md a navrhni jeho lepší verzi pro tento template.
Hledej hlavně:
- slidy s příliš mnoha myšlenkami
- místa, kde má být one-idea místo odstavců
- části, které je lepší převést do pipeline nebo code layoutu
- nejasné nebo generické titulky

Pak vrať upravený obsah slides.md, ne seznam doporučení.
```

Nejlepší výsledky obvykle vzniknou, když do promptu doplníš ještě konkrétní kontext: typ publika, délku prezentace, očekávané rozhodnutí a 2 až 3 klíčové teze, které musí zaznít.
