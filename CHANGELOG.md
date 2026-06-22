# Changelog

Všechny významné změny v tomto templatu se zapisují sem.

Formát vychází z Keep a Changelog a releasy se verzují pomocí SemVer.

## [0.1.0] - 2026-06-22

### Added

- Zaveden root `CHANGELOG.md` pro sledování změn templatu.
- Přidána interní proměnná `template_version` v `copier.yml` jako jedno zdrojové místo verze templatu.
- Doplněn stručný root `AGENTS.md` s release workflow pravidly.
- Do root `README.md` a generovaného `template/README.md.jinja` přidána informace o verzi templatu.
- Do `template/package.json.jinja` přidáno pole `version` pro verzování vygenerovaného projektu.
