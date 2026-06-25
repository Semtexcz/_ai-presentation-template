# Copier Template pro Slidev prezentace

Zdrojový Copier template pro tvorbu dalších Slidev prezentací. Tento repozitář dokumentuje údržbu templatu, release workflow a práci s Copierem. Dokumentace, která se má propsat do vygenerované prezentace, patří do [`template/README.md.jinja`](template/README.md.jinja).

Aktuální verze templatu: `v0.9.0`.

## Co je kde

- `README.md` - dokumentace k tomuto template repozitáři.
- `template/README.md.jinja` - README, které vznikne v každé vygenerované prezentaci.
- `copier.yml` - otázky, validace, interní `template_version` a výchozí `presentation_version`.
- `template/` - soubory, ze kterých Copier vyrenderuje novou prezentaci.
- `CHANGELOG.md` - změny mezi releasy templatu.

## Použití templatu

```bash
copier copy path/to/_ai-presentation-template moje-prezentace
cd moje-prezentace
pnpm install
pnpm run dev
```

Po vygenerování projektu funguje jeho README jako stručný rozcestník. Template-specific workflow a podrobné reference jsou v `.codex/skills/slidev-presentation/`; oficiální Slidev syntaxe, built-in features a exportní dokumentace jsou v `.codex/skills/slidev/`. Oba skilly se mají načítat pouze podle typu úlohy.

## Výchozí pravidla pro slidy

Úplná pravidla jsou ve skillu vygenerované prezentace. README a AGENTS obsahují jen stručné shrnutí a směrování, aby se stejný text nenačítal a neudržoval na více místech:

- Jeden slide = jedna hlavní myšlenka.
- Minimum textu.
- Preferuj diagramy, porovnání, tabulky, schémata, šipky, rámečky a vizuální uspořádání.
- Pro každý obsahový slide proveď visual pass a zvol informační vizuál nebo odůvodni textovou výjimku.
- Významové ikony používej pro kategorie, akce, stavy a navigaci; dekorativní ikona sama nestačí.
- Pokud chybí lokální obrázek, vlož popsaný placeholder a chybějící asset nahlas.
- Text používej pouze tehdy, když jiná forma není vhodná.
- Pokud je to vhodné, slide může obsahovat celý prompt nebo krátký ukázkový kód či jiný text, který má přesně danou strukturu.
- Dlouhé odstavce nepoužívej.
- Nepopisuj to, co bude lektor říkat.
- Na slide patří pouze to, co má být vidět na obrazovce.
- Slidy mají být minimalistické.
- Každý slide by měl být viditelný přibližně 10 až 60 sekund.
- Pokud by byl na obrazovce déle než minutu, pravděpodobně obsahuje příliš mnoho informací.

## Jak založit novou prezentaci

1. Nainstaluj Copier, například přes `pipx install copier` nebo `uv tool install copier`.
2. Spusť `copier copy path/to/_ai-presentation-template moje-prezentace`.
3. Odpověz na otázky pro název projektu, slug, titulek, podtitulek a autora.
4. Ve vygenerovaném adresáři spusť `pnpm install` a `pnpm run dev`.
5. Dál pracuj v `slides.md` a v README vygenerovaného projektu.

## Update existující prezentace

Ve vygenerovaném projektu spusť:

```bash
copier update
```

Copier použije answers soubor z předchozího generování a pokusí se přenést lokální změny nad novou verzí templatu. Před updatem je rozumné mít čistý pracovní strom a po updatu zkontrolovat konflikty v `slides.md`, `README.md` a dalších upravovaných souborech.

Změny mezi releasy jsou v [CHANGELOG.md](CHANGELOG.md).

## Struktura repozitáře

- `copier.yml` - otázky a nastavení Copier templatu.
- `template/slides.md.jinja` - startovací prezentace s proměnnými.
- `template/README.md.jinja` - dokumentace pro uživatele vygenerované prezentace.
- `template/package.json.jinja` - package metadata včetně samostatné verze vygenerované prezentace.
- `template/{{ _copier_conf.answers_file }}.jinja` - answers soubor pro budoucí `copier update`.
- `template/layouts/` - vlastní Slidev layouty.
- `template/components/` - sdílené komponenty layoutů.
- `template/styles/index.css` - globální barvy, fonty a breadcrumb styl.
- `template/snippets/` - volitelné ukázkové soubory pro code slidy.
- `template/prompts/` - lokalizované prompty kopírované do vygenerované prezentace.
- `template/.codex/skills/slidev-presentation/` - template-specific workflow pro dramaturgii, bundled layouty a práci s `slides.md`.
- `template/.codex/skills/slidev/` - oficiální upstream Slidev skill a referenční dokumentace k platformě.

## Release workflow

Autoritativní verze templatu je v `copier.yml` pod `template_version`.

Verze vygenerované prezentace je oddělená a bere se z `presentation_version`. Template release tedy už neurčuje `"version"` v cílovém `package.json`.

Při každé user-visible nebo maintenance-relevant změně:

1. Zvyš `template_version` v `copier.yml`.
2. Přidej odpovídající záznam do `CHANGELOG.md`.
3. Uprav dokumentaci v root README a v `template/README.md.jinja`, pokud se změna týká i vygenerovaného projektu.
4. Vytvoř Conventional Commit, například `docs:` nebo `feat:`.
5. Vytvoř odpovídající Git tag, například `v0.5.0`.

Pro standardní release tag + push + lokální update můžeš použít také:

```bash
./release-template.sh
```
