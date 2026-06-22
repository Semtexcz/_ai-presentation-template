# Changelog

All notable changes to this template are documented in this file.

The format is based on Keep a Changelog and releases follow SemVer.

## [0.3.0] - 2026-06-22

### Added

- Added a localized `prompts/` library to generated presentations.
- Added a Czech prompt for converting an article into a concise live-lecture Slidev deck.

### Changed

- Documented how authors and presentation agents should discover and use bundled prompts.

## [0.2.0] - 2026-06-22

### Added

- Added `live-demo` for clean transitions from slides to a browser, AI tool, or terminal.
- Added `statement` for one large takeaway sentence with an optional subtitle.

### Changed

- Reduced starter-deck density and moved longer lecture guidance into speaker notes.
- Improved Czech word wrapping across headings, labels, cards, pipelines, and prompt blocks.
- Made `one-idea` notes optional and flow cards wrap before becoming cramped.
- Expanded the `code` layout and styled standard fenced blocks as readable prompt/demo cards.
- Allowed pipeline steps to use short multi-line labels without increasing visual weight.

## [0.1.0] - 2026-06-22

### Added

- Added a root `CHANGELOG.md` to track template changes.
- Added the internal `template_version` variable to `copier.yml` as the single source of truth for the template version.
- Added a concise root `AGENTS.md` with release workflow rules.
- Added template version information to the root `README.md` and generated `template/README.md.jinja`.
- Added the `version` field to `template/package.json.jinja` for generated project versioning.
