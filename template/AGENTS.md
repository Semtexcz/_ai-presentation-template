# AGENTS.md

## Purpose

This is a generated Slidev presentation project.

Your job is to help create, edit, improve, and maintain this specific presentation. Do not treat this project as the original Copier template.

This file contains only project-specific rules, workflow boundaries, and validation instructions.

For presentation design, narrative structure, slide quality, visual clarity, and speaker-flow methodology, use the dedicated presentation skill:

```text id="1yecvt"
.codex/skills/presentation_skill
````

Do not duplicate the presentation skill here.

## Instruction priority

When working in this project, use this priority order:

1. Direct user instructions.
2. This `AGENTS.md` file for project-specific rules.
3. `.codex/skills/presentation_skill` for presentation methodology.
4. Existing project structure and code conventions.

If this file and the presentation skill seem to conflict:

* this file wins for project structure, commands, files, and technical boundaries,
* the presentation skill wins for presentation quality, narrative, design, and slide-writing methodology.

## Required skill usage

Before making substantial changes to the presentation, read and apply:

```text id="kh6nrs"
.codex/skills/presentation_skill
```

Use the presentation skill especially when the task involves:

* creating a new deck,
* rewriting or restructuring slides,
* improving slide design,
* improving narrative flow,
* reducing slide density,
* creating speaker notes,
* turning an article or outline into slides,
* reviewing presentation quality.

If the skill is unavailable in the environment, continue with best effort and explicitly mention that the presentation skill was not available.

## Project boundaries

MUST:

* Read `slides.md` before making structural or content changes.
* Prefer editing `slides.md` before changing layouts, components, or global styles.
* Preserve valid Slidev frontmatter.
* Preserve existing layout names and slot names unless there is a strong reason to change them.
* Use the same visible language as the existing presentation unless explicitly asked otherwise.
* Keep changes as small as reasonably possible.
* Validate non-trivial changes with `pnpm run build` when possible.

MUST NOT:

* Treat this project as a Copier template.
* Add Jinja syntax or Copier variables.
* Rewrite the whole deck unless explicitly asked.
* Add a new layout for a one-off slide.
* Add dependencies unless clearly needed.
* Change global styles for a single-slide problem.
* Commit or rely on generated build/export output as source.
* Break build/export behavior.

## Project structure

Typical generated project structure:

```text id="qfwxwi"
slides.md
package.json
layouts/
components/
styles/
snippets/
prompts/
public/
images/
.codex/skills/presentation_skill/
```

Use this structure as follows:

* `slides.md` — main presentation content.
* `layouts/` — reusable Slidev layouts.
* `components/` — shared Vue components used by layouts or slides.
* `styles/` — global visual style.
* `snippets/` — reusable code, prompt, or text examples.
* `prompts/` — reusable, localized instructions for common presentation-generation tasks.
* `public/` and `images/` — static assets.
* `.codex/skills/presentation_skill/` — presentation methodology and quality rules.

## Editing rules

### Prefer `slides.md`

Most presentation work should happen in `slides.md`.

Use it for:

* slide content,
* slide order,
* speaker notes,
* examples,
* diagrams written directly in HTML/SVG/Markdown,
* layout frontmatter.

### Edit layouts only when reusable

Edit `layouts/` only when:

* the same structure is needed repeatedly,
* an existing layout has a bug,
* the current layout API is too limited,
* the change cannot be expressed cleanly in `slides.md`.

Do not create a layout just to make one slide special.

### Edit styles only when global

Edit `styles/` only when:

* the change should apply globally,
* a repeated visual pattern needs a shared class,
* typography, spacing, or color consistency is broken.

Do not scatter repeated hardcoded design values across slides.

### Add components sparingly

Add a component only when:

* the same visual or interactive element appears repeatedly,
* it improves readability of `slides.md`,
* it has a clear reusable purpose.

Avoid Vue complexity for simple static slide content.

## Commands

Use these commands from the project root:

```bash id="yd1ebp"
pnpm install
pnpm run dev
pnpm run build
pnpm run export
```

Use:

* `pnpm run dev` for local preview,
* `pnpm run build` for validation,
* `pnpm run export` only when an exported version is needed.

## Validation

After changing `slides.md`, layouts, components, styles, dependencies, or assets:

1. Check that Slidev frontmatter is valid.
2. Check that existing layouts still render logically.
3. Attempt:

```bash id="87g36y"
pnpm run build
```

If validation cannot be run, explicitly say what was not run.

## Dependency policy

Before adding a dependency, check whether the goal can be solved with:

* Slidev,
* Vue,
* CSS,
* static HTML/SVG,
* existing layouts,
* existing components,
* local assets.

Add a dependency only when it clearly improves the presentation and is worth the maintenance cost.

## Assets

When adding assets:

* use meaningful filenames,
* prefer local assets over fragile remote links,
* keep file sizes reasonable,
* avoid copyrighted material unless permission is clear,
* do not use images only as decoration.

## Preferred agent workflow

For presentation-quality tasks:

1. Read `slides.md`.
2. Read `.codex/skills/presentation_skill`.
3. Identify whether the task is mainly about content, structure, design, speaker notes, or technical implementation.
4. Make the smallest useful change.
5. Preserve project consistency.
6. Validate when possible.
7. Explain what changed and why.

For purely technical tasks, still preserve the presentation’s existing style and structure.
