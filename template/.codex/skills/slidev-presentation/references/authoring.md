# Tvorba a kontrola prezentace

Načti tuto referenci při plánování nebo revizi dramaturgie, hustoty, speaker
notes, výukového videa, jazyka či přístupnosti.

## Obsah

- [Základní pravidla](#základní-pravidla)
- [Dramaturgické vzory](#dramaturgické-vzory)
- [Hustota a čitelnost](#hustota-a-čitelnost)
- [Speaker notes](#speaker-notes)
- [Výukové video](#výukové-video)
- [Jazyk a přístupnost](#jazyk-a-přístupnost)
- [Kontrolní seznam](#kontrolní-seznam)

## Základní pravidla

- Jeden slide nese jednu hlavní myšlenku a jeden takeaway nadpis.
- Viditelný obsah drž minimální; detail patří do speaker notes.
- Preferuj diagram, porovnání, tabulku, schéma, šipky nebo rámované skupiny
  před seznamem a seznam před odstavcem.
- Text použij, když přesná viditelná struktura sama nese informaci: prompt,
  krátký kód, příkaz, rovnice nebo citace.
- Nepopisuj na slidu, co bude lektor říkat.
- Dekorace bez informační funkce vynech.
- Zachovej světlé pozadí, tmavý text, šedý sekundární text, červený akcent
  `#F11E1E`, výraznou typografii a dostatek prostoru.

## Dramaturgické vzory

### Výuková nebo technická prezentace

1. Konkrétní problém nebo otázka.
2. Co bude publikum umět nebo chápat.
3. Nejjednodušší užitečný mentální model.
4. Praktická ukázka.
5. Typická chyba.
6. Malý úkol nebo otázka.
7. Shrnutí a další krok.

### Návrh nebo rozhodovací prezentace

1. Současná situace.
2. Problém nebo omezení.
3. Možnosti či rozhodovací model.
4. Doporučený směr.
5. Důkazy a trade-offy.
6. Implementační cesta.
7. Požadované rozhodnutí nebo další akce.

### Krátký status

1. Co se změnilo.
2. Proč na tom záleží.
3. Co je blokované.
4. Co bude následovat.

Vzory nejsou povinné osnovy. Přizpůsob je publiku, cíli a délce, ale zachovej
jasný úvod, střed a závěr.

## Hustota a čitelnost

- Hero titul: obvykle 2–6 slov nebo jedna krátká zalomená fráze.
- Nadpis obsahového slidu: pokud možno méně než 10 slov.
- Poznámka pod vizuálem: jedna krátká věta.
- Krok procesu: 1–3 slova a nejvýše jedna doplňující fráze.
- Karty: nejvýše 3–4 v jednom řádku.
- Kód nebo prompt: pouze část potřebná pro aktuální pointu.
- Jeden slide má obvykle podporovat přibližně 10–60 sekund výkladu.

Pokud slide obsahuje více point, působí přeplněně nebo potřebuje přes minutu,
rozděl ho typicky na koncept, příklad a důsledek.

## Speaker notes

Použij HTML komentář:

```md
<!--
Speaker notes:
- Vysvětli pointu přirozeným mluveným jazykem.
- Doplň příklad, přechod nebo důležité omezení.
- Neopakuj pouze text, který už je vidět na slidu.
-->
```

Poznámky mají pomoci lektorovi mluvit, ne fungovat jako další viditelná vrstva.
Přidej je tam, kde by bez nich chyběl kontext nebo přechod.

## Výukové video

Pro prezentaci určenou k OBS nebo podobnému záznamu:

- používej jeden slide na jednu mikromyšlenku,
- drž vizuál jednoduchý a stabilní,
- počítej s rychlým přepínáním mezi slidy a živou ukázkou,
- nepředpokládej složitou animaci nebo střih,
- použij speaker notes jako plán mluveného výkladu,
- zakonči malým cvičením, reflexí nebo dalším krokem.

Krátká výuková sekvence může být: hook, cíl, mentální model, příklad, chyba,
mini cvičení a shrnutí.

## Jazyk a přístupnost

- Viditelný text piš jazykem požadovaným uživatelem nebo použitým v decku.
- Angličtinu preferuj pro kód, názvy proměnných a technická metadata.
- Nemíchej jazyky bez didaktického důvodu.
- Zachovej vysoký kontrast a dostatečně velké písmo.
- Nespoléhej pouze na barvu; význam vyjádři také textem nebo tvarem.
- Diagramy drž jednoduché a jednoznačně popsané.
- Pokud obrázek nese význam, popiš ho ve speaker notes.
- Vynech blikání a nadměrný pohyb.

## Kontrolní seznam

Před dokončením ověř:

- Prezentace má jednu hlavní zprávu a zřetelný výsledek pro publikum.
- Každý slide má jednu pointu a nadpis, který ji sděluje.
- Úvod je konkrétní a závěr shrnuje nebo žádá další akci.
- Layout odpovídá účelu slidu.
- Většina slidů používá vizuální strukturu místo dlouhého textu.
- Speaker notes doplňují výklad tam, kde jsou potřeba.
- Breadcrumbs, jazyk a vizuální styl jsou konzistentní.
- Cesty k assetům jsou platné.
- `pnpm run build` skončí úspěšně.
- `pnpm run export` proběhne, pokud je export součástí zadání.
