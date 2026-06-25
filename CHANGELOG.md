# Changelog

All notable changes to this template are documented in this file.

The format is based on Keep a Changelog and releases follow SemVer.

## [0.10.2] - 2026-06-25

### Added

- Added `codeOverflow: shrink|scroll` frontmatter for the `code` layout so authors can choose between automatic code-size fitting and an internal scrollbar per slide.

## [0.10.1] - 2026-06-25

### Fixed

- Fixed `ComparisonTable` header icon sizing so the two-column comparison layout no longer collapses under oversized Phosphor SVGs.

## [0.10.0] - 2026-06-25

### Added

- Added reusable `DataTable` and `ComparisonTable` components for presentation-safe tabular content inside existing layouts such as `one-idea`, `split-demo`, or custom slide HTML.

### Changed

- Updated the generated presentation reference, generated README, and starter deck to document when tabular content should use `DataTable`, `ComparisonTable`, `text-compare`, `split-demo`, or `grid`.

## [0.9.1] - 2026-06-25

### Fixed

- Made the `code` layout resilient for standard markdown fenced code blocks by keeping the code area inside the slide, allowing font shrink to apply consistently, and falling back to internal code scrolling instead of slide overflow.

## [0.9.0] - 2026-06-25

### Added

- Added the reusable `split-demo` layout for side-by-side demo slides that keep source material and prompt or review instructions visible together.
- Added `PromptCard` for exact prompt display and `StepCards` for compact prompt-iteration or workflow sequences inside `one-idea`, `split-demo`, or custom slide HTML.

### Changed

- Updated the generated presentation skill, layout reference, generated README, and starter deck to steer demo-first decks toward `split-demo`, `PromptCard`, and `StepCards` without forcing theme-specific layouts.

## [0.8.1] - 2026-06-25

### Fixed

- Allowed long `code` layout titles rendered through the `title` slot to shrink and wrap inside the heading row instead of overflowing past the slide edge.

## [0.8.0] - 2026-06-25

### Added

- Added the official upstream Slidev skill under `.codex/skills/slidev/`, including its bundled reference library for core syntax, built-in layouts and components, animations, exporting, hosting, and presenter features.

### Changed

- Updated generated-project guidance, AGENTS routing, and bundled prompts so template-specific deck workflow stays in `.codex/skills/slidev-presentation/` while generic Slidev platform questions route to the official `.codex/skills/slidev/` skill.

## [0.7.1] - 2026-06-24

### Fixed

- Extended the offline `VisualIcon` registry with additional Phosphor icons used by `CycleDiagram`, including `chat-circle-text`, `cursor-text`, `sparkle`, and singular `arrow-clockwise` names so workflow diagrams no longer fall back to the question-mark icon.

## [0.7.0] - 2026-06-24

### Added

- Added reusable `BarChart`, `MetricStrip`, `HubDiagram`, and `CycleDiagram` components for information-bearing visuals inside `one-idea` slides.
- Added the `image-focus` layout and a descriptive `VisualPlaceholder` fallback for missing or failed local images.
- Added a generic `VisualIcon` component while preserving `RoleIcon` as a backward-compatible wrapper.
- Added a curated offline Iconify registry for common presentation concepts without runtime fetching or extra dependencies.
- Added Playwright Chromium as an approved generated-project development dependency so the documented Slidev export command works after installation.

### Changed

- Added optional semantic icons to hero, statement, code, live-demo, table-of-contents, pipeline, comparison, and grid presentations where they improve recognition.
- Extended `toc` and `pipeline` items with backward-compatible object forms for icons and supporting labels.
- Made a per-slide visual plan and final visual audit mandatory in generated presentation guidance and localized prompts.
- Updated the starter deck to demonstrate semantic icons and reusable visual components.

## [0.6.2] - 2026-06-24

### Added

- Added a root `release-template.sh` helper that reads `template_version` from `copier.yml`, creates the matching annotated Git tag, pushes that tag to `origin`, and runs `copier update --defaults --trust`.

## [0.6.1] - 2026-06-24

### Changed

- Generalized `RoleIcon` so grid cards can render explicit Iconify-style icon names instead of only a fixed built-in role list.
- Kept legacy shorthand aliases such as `student` and `bug` working for backward compatibility while updating the starter deck to use explicit icon identifiers.

## [0.6.0] - 2026-06-24

### Added

- Added a reusable `grid` Slidev layout for role maps, category cards, and other compact table-like overviews with optional icons.
- Added a shared `RoleIcon` component so bundled layouts can render consistent role/category pictograms without slide-specific HTML.

### Changed

- Replaced the starter deck's custom role-grid example with the new `grid` layout API.
- Documented the new layout in the generated README and the bundled layout reference.

## [0.5.5] - 2026-06-24

### Changed

- Made the vertical `pipeline` layout denser when it contains five steps so the full sequence still fits on a slide without clipping.
- Documented that vertical `pipeline` is intended for at most five steps and that longer sequences must switch to `mode: snake`.

## [0.5.4] - 2026-06-24

### Changed

- Moved breadcrumbs slightly higher across bundled layouts and tightened the gap between breadcrumbs and slide titles to free more vertical space for main slide content.
- Unified reusable slide-title styling across layouts so heading scale, weight, and wrapping now inherit from the same shared CSS tokens.

## [0.5.3] - 2026-06-24

### Fixed

- Changed comparison semantics so `text-compare` renders bad variants in red and good variants in green instead of using the brand red for both.

### Changed

- Added matching `bad` and `good` helper classes for `one-idea` comparison panels and documented when to use them in generated presentation guidance.

## [0.5.2] - 2026-06-24

### Changed

- Finalized the horizontal spacing update by applying the same content-side margins across all bundled layouts.
- Reworked layout content wrappers to rely on a shared margin token so future spacing adjustments stay consistent across the template.

## [0.5.1] - 2026-06-24

### Changed

- Reduced the default horizontal slide padding so generated presentations use more of the available canvas width.
- Unified horizontal content margins across all bundled layouts and expanded `one-idea` title width to reduce wasted side space consistently across the template.

## [0.5.0] - 2026-06-24

### Added

- Added progressively loaded layout and authoring references to the generated presentation skill.
- Added dedicated Czech prompts for creating a deck from a brief, designing one slide, and reviewing an existing presentation.
- Added Codex UI metadata for the generated presentation skill.

### Changed

- Renamed the generated skill from `.codex/skills/presentation_skill` to `.codex/skills/slidev-presentation` and aligned its directory and metadata name.
- Reduced generated AGENTS, skill, and README guidance to task-specific routing and removed repeated detailed rules.
- Made the generated README a concise human-facing index for commands, layouts, prompts, and agent references.

### Migration

- `copier update` replaces the old tracked skill path with `.codex/skills/slidev-presentation`; custom references to the previous path must be updated.

## [0.4.5] - 2026-06-24

### Changed

- Standardized the default slide-design rules across README, AGENTS, and the presentation skill to enforce one idea per slide, minimal visible text, and visual-first layouts.
- Added an explicit 10-to-60-second per-slide heuristic so overloaded slides are treated as too dense by default.

## [0.4.4] - 2026-06-24

### Fixed

- Separated generated presentation versioning from template release versioning by adding `presentation_version` to Copier answers.
- Stopped rendering the internal `template_version` into generated `package.json` and now use `presentation_version` instead.

### Changed

- Updated root and generated README documentation to explain the difference between presentation version and template version.

## [0.4.3] - 2026-06-24

### Changed

- Split documentation responsibilities between the root `README.md` and generated `template/README.md.jinja`.
- Kept Copier usage, template maintenance, and release workflow in the root README.
- Moved layout guidance, live-lecture rules, and prompt examples into the generated template README so they ship with every new presentation.

## [0.4.2] - 2026-06-23

### Fixed

- Fixed four-card flows in the `one-idea` Slidev layout to use a balanced 2-by-2 grid instead of wrapping as 3-and-1.

## [0.4.1] - 2026-06-23

### Changed

- Updated the `code` Slidev layout to shrink all code blocks together when content gets dense, while keeping a minimum bottom safe area and allowing the minimum font size to be configured via `codeFontMin` frontmatter.

## [0.4.0] - 2026-06-22

### Added

- Added a universal `text-compare` Slidev layout for side-by-side or stacked comparisons of prompts, outputs, assignments, and short code/text snippets.

### Changed

- Documented when to use `text-compare` in horizontal vs vertical mode and clarified that comparisons should stay limited to exactly two blocks.
- Updated the Czech presentation prompt guidance to prefer `text-compare` over card walls for prompt comparisons.

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
