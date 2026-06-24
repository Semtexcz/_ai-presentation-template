---
name: slidev-presentation
description: Create, restructure, review, and refine Slidev presentations generated from Semtexcz/_ai-presentation-template. Use for editing slides.md, converting an article, brief, or outline into slides, choosing bundled layouts, improving narrative flow or speaker notes, reducing slide density, and preparing educational or live-lecture decks.
---

# Slidev Presentation

Work on the generated Slidev presentation, not the source Copier template.
Produce or edit `slides.md` by default and preserve the existing visual system.

## Read context progressively

Load only the reference needed for the task:

| Task | Read |
|---|---|
| Choose a layout, use props or slots, write frontmatter, or use visual helper classes | [references/layouts.md](references/layouts.md) |
| Plan or review narrative, density, speaker notes, video flow, language, or accessibility | [references/authoring.md](references/authoring.md) |
| Convert an article, brief, or outline using a bundled workflow | The matching file in `prompts/<language>/` |
| Make a narrow technical fix that does not affect presentation content | No presentation reference unless needed |

Read both references only for a full-deck creation or comprehensive review.
Do not load README as an agent reference; it is the human-facing project index.

## Operating boundaries

1. Read `slides.md` before editing an existing deck.
2. Edit presentation content before changing layouts, components, or styles.
3. Reuse existing layouts. Add one only for a pattern reusable across decks.
4. Preserve frontmatter, layout names, slot names, language, and project style.
5. Put spoken explanation in HTML speaker-note comments.
6. Use local assets and existing dependencies when possible.
7. Validate with `pnpm run build`; export only when requested.

## Core slide defaults

- Give each slide one main idea and a takeaway headline.
- Minimize visible text; prefer diagrams, comparisons, tables, schemas, arrows,
  and meaningful grouping.
- Show a full prompt, short code sample, or structured text when its exact visible
  form matters.
- Avoid long paragraphs and descriptions of what the presenter will say.
- Keep slides minimalist and useful for roughly 10–60 seconds of attention.
- Split a slide that feels crowded or needs more than one minute of explanation.
- Use visual elements only when they communicate information.

Detailed authoring rules belong in `references/authoring.md`, not here.

## Workflow

For a new deck:

1. Identify audience, purpose, duration, and desired outcome.
2. State the central promise or thesis in one sentence.
3. Outline slide titles, takeaways, layout choices, and visual ideas.
4. Write a complete, valid `slides.md` with existing layouts.
5. Add speaker notes where spoken context is needed.
6. Review density, narrative, breadcrumbs, asset paths, and build readiness.

For an existing deck:

1. Inspect the complete deck and the user-requested edit boundary.
2. Identify content, structure, design, or technical problems.
3. Make the smallest coherent change that solves the request.
4. Recheck adjacent slides for continuity and consistency.
5. Build the deck and report any remaining validation gap.

Do not block on minor missing context. Make a reasonable assumption and state it.
Ask only when the answer would materially change the deck.

## Output expectations

When editing files in the project, implement the change directly unless the
user requested only a review or proposal.

For a new presentation, provide:

- assumptions only when material,
- a complete `slides.md`,
- a short list of genuinely missing assets,
- the validation result.

For an existing presentation, provide the requested edit and summarize:

- what changed,
- why it changed,
- what validation ran.

For a template-level layout change, first establish why existing layouts are
insufficient, then define the reusable API and include an example slide.

## Technical rules

- Use valid Slidev Markdown and YAML frontmatter.
- Use `<template #name>` only for slots supported by the selected layout.
- Keep breadcrumbs short and consistent in longer decks.
- Avoid Vue complexity for static slide content.
- Do not add dependencies for work achievable with Slidev, Vue, CSS, HTML, SVG,
  existing layouts, or local assets.
- Do not edit generated build or export output as source.

## Validation

Before completion:

1. Check that every changed slide has one clear takeaway.
2. Check the selected layouts against `references/layouts.md` when relevant.
3. Check frontmatter, slots, breadcrumbs, and asset paths.
4. Run `pnpm run build`.
5. Run `pnpm run export` only if the user needs an export.

Report commands that could not run instead of implying validation succeeded.
