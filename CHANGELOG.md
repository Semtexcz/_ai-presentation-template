# Changelog

All notable changes to this template are documented in this file.

The format is based on Keep a Changelog and releases follow SemVer.

## [0.1.0] - 2026-06-22

### Added

- Added a root `CHANGELOG.md` to track template changes.
- Added the internal `template_version` variable to `copier.yml` as the single source of truth for the template version.
- Added a concise root `AGENTS.md` with release workflow rules.
- Added template version information to the root `README.md` and generated `template/README.md.jinja`.
- Added the `version` field to `template/package.json.jinja` for generated project versioning.
