---
name: ai-presentation-template
description: Create and refine Slidev presentations using Semtexcz/_ai-presentation-template.
metadata:
  author: Semtexcz
  version: 2.0.0
---

# AI Presentation Template Skill

Use this skill to create, rewrite, review, or extend Slidev presentations based on `Semtexcz/_ai-presentation-template`.

This is a **Slidev + Copier** workflow with custom layouts and a minimal visual system. It is not a generic PPTX, Google Slides, Marp, or graphic-design workflow.

## When to Use This Skill

Use this skill when the user asks to:

- create a new presentation from a topic, outline, article, script, lesson note, or technical document,
- convert content into a Slidev `slides.md`,
- improve an existing Slidev deck,
- design an educational video deck for OBS-style recording,
- choose the right custom layout for a slide,
- keep a deck consistent with this template.

## When Not to Use This Skill

Do not use this as the primary workflow when the user wants:

- native PowerPoint-first work,
- Google Slides-first work,
- a generic Marp/reveal.js deck,
- a new visual identity unrelated to this template,
- heavy animation or decorative slide design,
- layout component development without an explicit request.

If the user asks for PPTX, create the canonical version in Slidev first, then export if needed.

## Operating Rules

1. **Default output is `slides.md`.** For new decks, produce Slidev Markdown unless the user asks for another artifact.
2. **Preserve the template.** Edit generated presentation content first. Modify `layouts/`, `components/`, or `styles/` only when explicitly requested.
3. **Prefer existing layouts.** Add a new layout only when the same new pattern will be reused across multiple presentations.
4. **Use README as the layout reference.** This skill defines the decision process; README contains the detailed template documentation.
5. **Slides support the talk.** Put explanation, nuance, and examples into speaker notes, not onto the visible slide.
6. **Optimize for fast iteration.** Produce a usable first draft before polishing details.

## Default Workflow

1. **Define the communication goal.** Identify audience, purpose, duration, and desired action.
2. **Extract the main message.** Write the central promise or thesis in one sentence.
3. **Create a slide outline.** Use slide titles, takeaways, layout choices, and visual ideas.
4. **Generate `slides.md`.** Use existing custom layouts and consistent frontmatter.
5. **Add speaker notes.** Use HTML comments for spoken explanation.
6. **Validate the deck.** Check density, layout fit, breadcrumbs, style, and export readiness.

If information is missing, make reasonable assumptions and state them briefly. Do not block progress unless the missing detail changes the whole deck.

## Output Contract

For a new presentation, return:

1. assumptions, if needed,
2. slide-by-slide outline, if useful,
3. complete `slides.md`,
4. missing assets list, if any,
5. short validation checklist.

For editing an existing deck, return one of:

- a patch,
- a full replacement of `slides.md`,
- a focused review with specific slide-level changes.

For template changes, first explain why existing layouts are insufficient. Then provide the proposed layout API, implementation changes, and an example slide.

## Slide Design Principles

Use these as hard defaults:

- one idea per slide,
- one clear takeaway headline per slide,
- minimal visible text,
- visual structure before bullet lists,
- speaker notes for detailed explanation,
- no decoration without an information function,
- consistent breadcrumbs for longer decks,
- strong typography and whitespace.

If a slide feels crowded, split it into concept, example, and implication.

## Narrative Patterns

### Educational / technical explanation

Use for lessons, tutorials, STEM explanations, and programming content:

1. Hook: a concrete problem or motivating question.
2. Goal: what the viewer will understand or be able to do.
3. Mental model: the simplest useful structure.
4. Example: one practical demonstration.
5. Common mistake: one thing to avoid.
6. Practice: a tiny task or reflection question.
7. Summary: what to remember next.

### Proposal / decision deck

Use for business, product, technical architecture, or strategy:

1. Current situation.
2. Problem or constraint.
3. Options or model.
4. Recommended direction.
5. Evidence or trade-offs.
6. Implementation path.
7. Decision or next action.

### Short status / review deck

Use for concise updates:

1. What changed.
2. Why it matters.
3. What is blocked.
4. What happens next.

## Layout Decision Table

| Need | Use layout | Notes |
|---|---|---|
| Opening, closing, section break, strong statement | `hero` | Short title and subtitle. |
| One strong sentence | `statement` | One takeaway, optional short subtitle. |
| Agenda, map, progress, recap | `toc` | Use `active` to show the current section. |
| One concept with a visual | `one-idea` | Best default for teaching slides. |
| Process, sequence, workflow, algorithm | `pipeline` | Use short step labels. |
| Code, prompt, command, structured text, terminal output | `code` | Show only the relevant excerpt. |
| Switch to a live tool | `live-demo` | Clean transition to browser, AI, or terminal. |

## Shared Frontmatter

Most custom layouts should include:

```yaml
section: Kontext
current: Hlavní otázka
breadcrumb:
  - Název prezentace
  - Kontext
  - Hlavní otázka
title: "Jakou otázku řešíme?"
```

Rules:

- `breadcrumb` is preferred for longer decks.
- `section` and `current` can be used as fallback navigation metadata.
- `title` is Slidev metadata.
- Visible headings usually belong in `<template #title>`.
- Keep breadcrumb labels short.

## Layout API Summary

| Layout | Use for | Key inputs |
|---|---|---|
| `hero` | opening, ending, transition | slots `#title`, `#subtitle` |
| `statement` | one strong takeaway | slots `#title`, optional `#subtitle` |
| `toc` | agenda, progress, recap | `items`, `active`, `columns`, `showAnchor` |
| `one-idea` | concept + visual + note | `visualFrame`, `visualVariant`, slots `#title`, `#visual`, `#note` |
| `pipeline` | process or workflow | `steps`, `active`, `mode`, `columns` |
| `code` | code, prompt, terminal, formula | slot `#title`, default Markdown slot, slot `#note` |
| `live-demo` | transition to a live demo | slots `#title`, optional `#subtitle`; optional `kicker` |

`one-idea.visualVariant` values:

- `default`
- `diagram`
- `equation`
- `comparison`
- `demo`
- `warning`

`pipeline.mode` values:

- `vertical` for short linear sequences,
- `snake` for wider multi-step processes.

## Visual Building Blocks

Prefer existing visual classes before inventing new HTML/CSS:

- `.flow`, `.flow-step`, `.flow-kicker`, `.flow-label`, `.flow-sub`
- `.equation`, `.term`, `.operator`, `.term.accent`
- `.comparison`, `.comparison-panel`, `.comparison-panel.accent`
- `.demo-card`, `.demo-mark`, `.demo-title`, `.demo-sub`
- `.warning-grid`, `.warning-panel`, `.not-equal`
- `.mini-graph`

Use visual blocks to reveal structure, not to decorate.

## Style Rules

Follow the template identity:

- minimal layout,
- near-white background,
- near-black text,
- soft gray secondary text,
- red accent `#F11E1E`,
- strong heading typography,
- generous whitespace.

Do not introduce random colors, fonts, decorative icons, or stock imagery unless explicitly requested.

## Text Density Rules

Default limits:

- Hero title: 2–6 words or one short broken phrase.
- Content slide headline: under 10 words when possible.
- Body text: avoid paragraphs; prefer diagram labels.
- Note under visual: one short sentence.
- Flow step label: 1–3 words.
- Flow subtext: one phrase.
- Code slide: only the relevant excerpt.

Detailed explanation belongs in speaker notes.

## Speaker Notes Rules

Use HTML comments:

```md
<!--
Speaker notes:
- Explain the slide in spoken language.
- Add nuance that would make the visible slide too dense.
- Mention examples, transitions, or warnings.
-->
```

Speaker notes should help the presenter speak naturally. They should not merely repeat visible slide text.

## Educational Video Mode

When the deck is meant for a recorded educational video:

- optimize for OBS-style screen recording,
- keep slides visually simple,
- use one slide per micro-idea,
- make speaker notes the spoken explanation plan,
- avoid complex animation and editing assumptions,
- prefer quick iteration over perfect polish,
- end with a tiny exercise, reflection question, or next step.

Recommended short structure:

```text
1. Hook
2. What you will understand
3. Mental model
4. Practical example
5. Common mistake
6. Mini exercise
7. Summary
```

## Language Rules

- Match the user-requested language for visible slide text.
- For Czech educational decks, Czech slide text is fine.
- Use English for code comments, package metadata, variable names, and reusable technical labels when possible.
- Avoid mixing languages on one slide unless it improves understanding.

## Accessibility Rules

- Use high contrast.
- Do not rely on color alone.
- Keep text large and readable.
- Use simple diagrams with clear labels.
- Add image descriptions in speaker notes when images carry meaning.
- Avoid flashing or excessive motion.

## Commands

Create a new presentation:

```bash
copier copy path/to/_ai-presentation-template my-presentation
cd my-presentation
pnpm install
pnpm run dev
```

Use another port if needed:

```bash
pnpm exec slidev --port 4100
```

Build, export, or update:

```bash
pnpm run build
pnpm run export
copier update
```

## Minimal Slide Example

```md
---
layout: one-idea
section: Kontext
current: Hlavní myšlenka
breadcrumb:
  - Název prezentace
  - Kontext
  - Hlavní myšlenka
visualVariant: diagram
title: "Jedna jasná myšlenka"
---

<template #title>
Jedna jasná myšlenka.
</template>

<template #visual>
<div class="flow">
  <div class="flow-step">
    <div class="flow-kicker">1</div>
    <div class="flow-label">Vstup</div>
    <div class="flow-sub">Co máme na začátku.</div>
  </div>
  <div class="flow-step">
    <div class="flow-kicker">2</div>
    <div class="flow-label">Model</div>
    <div class="flow-sub">Jak tomu rozumíme.</div>
  </div>
  <div class="flow-step">
    <div class="flow-kicker">3</div>
    <div class="flow-label">Akce</div>
    <div class="flow-sub">Co uděláme dál.</div>
  </div>
</div>
</template>

<template #note>
Detail vysvětli ústně, ne textem na slidu.
</template>
```

## Validation Checklist

Before finalizing, check:

- The deck has one clear main message.
- Every slide has one takeaway.
- The opening is concrete and relevant.
- The selected layout matches the slide purpose.
- Most slides are visual, not text-heavy.
- Speaker notes exist where explanation is needed.
- Breadcrumbs are consistent.
- Asset paths are valid.
- The deck can run with `pnpm run dev`.
- The deck can build with `pnpm run build`.
- The deck can export with `pnpm run export` when needed.
- The final slide has a summary or next action.
