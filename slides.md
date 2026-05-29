---
layout: hero
section: Název prezentace
current: Úvod
breadcrumb:
  - Název prezentace
  - Úvod
title: "Název prezentace"
---

<template #title>
Název<br>
prezentace.
</template>

<template #subtitle>
Krátký podtitulek, který vysvětlí téma a slib prezentace.
</template>

<!--
Speaker notes:
- Otevři kontext a řekni, proč má téma smysl.
- Vymez jednu hlavní myšlenku celé prezentace.
-->

---
layout: toc
section: Název prezentace
current: Mapa
breadcrumb:
  - Název prezentace
  - Mapa
columns: 2
items:
  - Kontext
  - Hlavní princip
  - Praktická ukázka
  - Shrnutí
active: 0
showAnchor: false
title: "Mapa prezentace"
---

<template #title>
Mapa prezentace
</template>

<!--
Speaker notes:
- Ukaž trasu prezentace.
- Nesnaž se vysvětlit vše hned na mapě.
-->

---
layout: one-idea
section: Kontext
current: Hlavní otázka
breadcrumb:
  - Název prezentace
  - Kontext
  - Hlavní otázka
visualVariant: comparison
title: "Jakou otázku řešíme?"
---

<template #title>
Jakou otázku řešíme?
</template>

<template #visual>
<div class="comparison">
  <div class="comparison-panel accent">
    <div class="viz-kicker">stav dnes</div>
    <div class="viz-label">co lidé dělají teď</div>
    <div class="viz-sub">Popiš výchozí situaci nebo problém.</div>
  </div>
  <div class="comparison-panel">
    <div class="viz-kicker">cílový stav</div>
    <div class="viz-label">co chceme změnit</div>
    <div class="viz-sub">Popiš, kam se má publikum po prezentaci dostat.</div>
  </div>
</div>
</template>

<template #note>
Jeden slide má nést jednu jasnou myšlenku.
</template>

<!--
Speaker notes:
- Doplň konkrétní příklad z praxe.
- Řekni, proč rozdíl mezi oběma stavy stojí za pozornost.
-->

---
layout: pipeline
section: Princip
current: Postup
breadcrumb:
  - Název prezentace
  - Princip
  - Postup
mode: snake
columns: 3
steps:
  - Vstup
  - Rozhodnutí
  - Akce
  - Kontrola
  - Iterace
  - Výsledek
active: 0
title: "Jak postup funguje"
---

<template #title>
Jak postup funguje
</template>

<template #note>
Proces drž krátký. Detail patří do výkladu nebo dalších slidů.
</template>

---
layout: code
section: Ukázka
current: Demo
breadcrumb:
  - Název prezentace
  - Ukázka
  - Demo
title: "Praktická ukázka"
---

<template #title>
Praktická ukázka
</template>

```txt
Sem vlož ukázku textu, kódu, promptu nebo terminálového výstupu.
```

<template #note>
Poznámka pod ukázkou má vysvětlit, čeho si má publikum všimnout.
</template>

---
layout: one-idea
section: Shrnutí
current: Co si odnést
breadcrumb:
  - Název prezentace
  - Shrnutí
  - Co si odnést
visualVariant: diagram
title: "Co si má publikum odnést?"
---

<template #title>
Co si má publikum odnést?
</template>

<template #visual>
<div class="flow" style="--flow-columns: 3;">
  <div class="flow-step">
    <div class="flow-kicker">1</div>
    <div class="flow-label">První pointa</div>
    <div class="flow-sub">Krátké vysvětlení.</div>
  </div>
  <div class="flow-step">
    <div class="flow-kicker">2</div>
    <div class="flow-label">Druhá pointa</div>
    <div class="flow-sub">Krátké vysvětlení.</div>
  </div>
  <div class="flow-step">
    <div class="flow-kicker">3</div>
    <div class="flow-label">Další krok</div>
    <div class="flow-sub">Co má publikum udělat po prezentaci.</div>
  </div>
</div>
</template>

<template #note>
Závěr má být konkrétní a zapamatovatelný.
</template>

---
layout: hero
section: Název prezentace
current: Konec
breadcrumb:
  - Název prezentace
  - Konec
title: "Děkuji"
---

<template #title>
Děkuji.
</template>

<template #subtitle>
Kontakt, odkaz nebo výzva k další práci.
</template>
