# AGENTS.md

## Purpose

This repository is the source Copier template for Slidev presentation projects.

Keep release metadata and release workflow consistent across every change.

## Release rules

- Keep the authoritative template version in `copier.yml` under `template_version`.
- Record every user-visible or maintenance-relevant template change in `CHANGELOG.md`.
- Use Conventional Commits for commit messages, for example `feat:`, `fix:`, `docs:`, `chore:`.
- Every new released version must have a matching Git tag, for example `v0.1.0`.

## Default slide rules

By default, generated presentation guidance should enforce these rules:

- One slide = one main idea.
- Keep visible text to a minimum.
- Prefer diagrams, comparisons, tables, schemas, arrows, framed groupings, and other visual structure.
- Use text only when another form is not suitable.
- A slide may contain a full prompt, short code sample, or other structured text when that exact visible structure matters.
- Do not use long paragraphs.
- Do not describe what the lecturer will say.
- Put on the slide only what should be visible on screen.
- Slides should stay minimalist.
- Each slide should usually stay on screen for about 10 to 60 seconds.
- If a slide would stay on screen for longer than one minute, it probably contains too much information.

## Change workflow

1. Update `template_version` in `copier.yml`.
2. Add or update the matching entry in `CHANGELOG.md`.
3. Ensure docs or generated template files reflect the new version where relevant.
4. Create a Conventional Commit.
5. Create a Git tag for the released version.
