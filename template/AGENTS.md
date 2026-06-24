# AGENTS.md

## Project context

This is a generated Slidev presentation project. Work on this presentation; do
not treat it as the source Copier template.

Keep this file focused on project boundaries. Presentation methodology and
layout documentation live in the `slidev-presentation` skill.

## Instruction priority

Apply instructions in this order:

1. Direct user instructions.
2. This file for project boundaries and validation.
3. `.codex/skills/slidev-presentation/SKILL.md` for presentation work.
4. Existing project conventions.

If instructions conflict, this file controls files, commands, and technical
boundaries; the skill controls narrative, design, and slide-writing decisions.

## Skill routing

Read `.codex/skills/slidev-presentation/SKILL.md` before work that changes:

- presentation content or structure,
- narrative flow or speaker notes,
- slide density or visual design,
- layout selection,
- an article, brief, or outline into a deck,
- presentation-quality review.

For a narrowly technical fix, do not load presentation references unless the
change also affects content or design. If the skill is unavailable, continue
with best effort and report that limitation.

## Project boundaries

Always:

- Read `slides.md` before changing presentation content or structure.
- Prefer editing `slides.md` over layouts, components, or global styles.
- Preserve valid Slidev frontmatter and existing layout and slot names.
- Match the visible language of the existing presentation unless asked otherwise.
- Keep the change as small as reasonably possible.
- Validate non-trivial changes with `pnpm run build` when possible.

Do not:

- Add Jinja syntax or Copier variables; this is already a generated project.
- Rewrite the whole deck unless explicitly requested.
- Create a layout for a one-off slide.
- Add a dependency without a clear reusable need.
- Change global styles to solve a single-slide problem.
- Treat build or export output as source files.
- Commit changes unless the user asks.

## File responsibilities

- `slides.md` — presentation content, order, frontmatter, and speaker notes.
- `layouts/` — reusable Slidev layouts and their public APIs.
- `components/` — shared Vue components.
- `styles/` — global presentation styling.
- `snippets/` — reusable code or text examples.
- `prompts/` — localized generation and review prompts.
- `.codex/skills/slidev-presentation/` — agent workflow and references.

Modify layouts, components, or styles only for a reusable need, an existing
bug, or a limitation that cannot be handled cleanly in `slides.md`.

## Validation

After changing `slides.md`, layouts, components, styles, dependencies, or
assets:

1. Check frontmatter and asset paths.
2. Check that affected layouts still use valid props and slots.
3. Run `pnpm run build`.
4. Run `pnpm run export` only when an exported artifact is requested.

If a check cannot run, state exactly what was not verified.
