---
name: commit
description: "Create commit messages following Conventional Commits specification. Use when committing code changes, writing commit messages, or formatting git history."
source: "https://www.conventionalcommits.org/"
risk: safe
model: "gemini-3.0-flash"
---

# Conventional Commits

Follow these conventions when creating commits following the Conventional Commits specification.

## When to Use This Skill

Use this skill when:
- Committing code changes
- Writing commit messages
- Formatting git history
- Referencing issues in commits

## Prerequisites

Before committing, ensure you're working on a feature branch, not the main branch.

```bash
# Check current branch
git branch --show-current
```

If you're on `main` or `master`, create a new branch first:

```bash
# Create and switch to a new branch
git checkout -b <type>/<short-description>
```

Branch naming should follow the pattern: `<type>/<short-description>` where type matches the commit type (e.g., `feat/add-user-auth`, `fix/null-pointer-error`, `ref/extract-validation`).

## Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

The header is required. Scope is optional. All lines must stay under 100 characters.

## Commit Types

| Type | Purpose |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf` | Performance improvement |
| `docs` | Documentation only |
| `test` | Adding or correcting tests |
| `build` | Build system or dependencies |
| `ci` | CI configuration |
| `chore` | Other changes that don't modify src or test files |
| `style` | Code style/formatting (no logic change) |
| `revert` | Reverts a previous commit |

## Subject Line Rules

- Use imperative, present tense: "Add feature" not "Added feature"
- Capitalize the first letter
- No period at the end
- Maximum 70 characters

## Body Guidelines

- Explain **what** and **why**, not how
- Use imperative mood and present tense
- Include motivation for the change
- Contrast with previous behavior when relevant

## Footer: Issue References

Reference issues in the footer using these patterns:

```
Fixes #1234
Closes #1234
Resolves #1234
Refs #1234
```

- `Fixes`, `Closes`, `Resolves` - closes the issue when merged
- `Refs` - links without closing

For breaking changes, use the footer:
```
BREAKING CHANGE: description of the breaking change
```

Or add `!` after the type/scope:
```
feat!: breaking change
feat(api)!: breaking change in API
```

## Examples

### Simple fix

```
fix(api): Handle null response in user endpoint

The user API could return null for deleted accounts, causing a crash
in the dashboard. Add null check before accessing user properties.

Fixes #5678
```

### Feature with scope

```
feat(alerts): Add Slack thread replies for alert updates

When an alert is updated or resolved, post a reply to the original
Slack thread instead of creating a new message. This keeps related
notifications grouped together.

Refs #1234
```

### Refactor

```
refactor: Extract common validation logic to shared module

Move duplicate validation code from three endpoints into a shared
validator class. No behavior change.
```

### Breaking change

```
feat(api)!: Remove deprecated v1 endpoints

Remove all v1 API endpoints that were deprecated in version 23.1.
Clients should migrate to v2 endpoints.

BREAKING CHANGE: v1 endpoints no longer available
Fixes #9999
```

## Revert Format

```
revert: feat(api): Add new endpoint

This reverts commit abc123def456.

Reason: Caused performance regression in production.
```

## Principles

- Each commit should be a single, stable change
- Commits should be independently reviewable
- The repository should be in a working state after each commit

## References

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)
