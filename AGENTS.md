# AGENTS.md

## Purpose

This repository is the source Copier template for Slidev presentation projects.

Keep release metadata and release workflow consistent across every change.

## Release rules

- Keep the authoritative template version in `copier.yml` under `template_version`.
- Record every user-visible or maintenance-relevant template change in `CHANGELOG.md`.
- Use Conventional Commits for commit messages, for example `feat:`, `fix:`, `docs:`, `chore:`.
- Every new released version must have a matching Git tag, for example `v0.1.0`.

## Change workflow

1. Update `template_version` in `copier.yml`.
2. Add or update the matching entry in `CHANGELOG.md`.
3. Ensure docs or generated template files reflect the new version where relevant.
4. Create a Conventional Commit.
5. Create a Git tag for the released version.
