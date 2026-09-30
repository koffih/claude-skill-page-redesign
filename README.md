# page-redesign

A [Claude Code](https://claude.com/claude-code) skill that redesigns one existing page end to end for the best possible user experience.

You point it at a page: a file, a route or a URL. The agent renders it, captures it at three widths, writes down everything the page must keep doing, diagnoses what stops visitors from getting their job done, sets one design direction and system, rebuilds the page in your project's own stack, then looks at the real render and fixes it until it passes a critique grid. You get before and after screenshots and a report.

Part of the [koffih skills catalog](https://github.com/koffih/claude-skills).

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/koffih/claude-skill-page-redesign/main/install.sh | bash
```

This clones the skill into `~/.claude/skills/page-redesign`. Run the same command again to update it.

Other options:

```bash
# into the current project only (./.claude/skills)
curl -fsSL https://raw.githubusercontent.com/koffih/claude-skill-page-redesign/main/install.sh | bash -s -- --project

# remove
curl -fsSL https://raw.githubusercontent.com/koffih/claude-skill-page-redesign/main/install.sh | bash -s -- --uninstall
```

Screenshots need Node.js (`npx`). The Playwright Chromium is downloaded on first use.

## Use

In a new Claude Code session, from the project directory:

```
/page-redesign src/pages/Pricing.tsx
/page-redesign /dashboard more calm, overdue invoices first
/page-redesign http://localhost:3000/contact --refine
/page-redesign landing.html --keep-brand --unattended
```

| Flag | Effect |
|---|---|
| `--refine` | Keep the structure, fix hierarchy, system, states, copy and accessibility |
| `--keep-brand` | Existing colors, logo and typefaces are fixed inputs |
| `--unattended` | Never stop to ask: take the recommended default and record it in the report |

The skill never triggers on its own (`disable-model-invocation: true`): it rewrites files, so running it is always your call.

## What it does

1. **Renders and captures** the current page at 360, 768 and 1440 px.
2. **Writes a contract**: every action, form, data source, hook, id and SEO element the page must keep.
3. **Diagnoses**: who comes, what job they came to do, the one primary action, and 3 to 7 ranked findings.
4. **Decides** the path (showcase or app screen), a direction and a token system, avoiding the tell-tale defaults of generated design.
5. **Rebuilds** in the same stack with real content, every component in its seven states, rewritten interface copy.
6. **Checks the render**: squint test, critique grid, measured contrast, 360 px without horizontal scroll, keyboard path, contract line by line. Up to three fix rounds.
7. **Reports** in `.redesign/REPORT.md` with before and after screenshots, and never commits to main or deploys.

## Files

| File | Role |
|---|---|
| `SKILL.md` | The redesign method Claude follows |
| `references/direction.md` | Visual direction, and the model defaults to avoid |
| `references/system.md` | Type, color, spacing, grid, radius and elevation tokens |
| `references/components-states.md` | The seven states, forms, tables, lists |
| `references/interface-copy.md` | Labels, errors, empty states, automatic phrasing to cut |
| `references/interactions.md` | Feedback, durations, easing, the frequency filter |
| `references/motion-gsap.md` | Scripted and scroll-driven motion, when it is worth it |
| `references/accessibility-performance.md` | The quality floor before calling it done |
| `references/critique.md` | The grid used on both the old and the new page |
| `scripts/capture.sh` | Full-page screenshots at the three widths |
| `SOURCES.md` | Sources, licenses and how their conflicts were settled |
| `install.sh` | Install, update, uninstall |

## License

MIT. Distilled from several public skills under MIT and Apache 2.0 licenses, see `SOURCES.md`.
