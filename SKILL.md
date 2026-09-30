---
name: page-redesign
description: Redesigns one existing page end to end for the best possible user experience. Captures the current page, inventories everything it must keep doing, diagnoses its UX problems, sets one design direction and system, rebuilds the page in the project's own stack, then checks the real render at three widths until it passes a critique grid. Delivers before and after screenshots and a report. Use when the user points at a page, file, route or URL and wants it redesigned, not just touched up.
argument-hint: "<page: file path, route or URL> [intent, e.g. 'more trust for first-time buyers'] [--refine] [--keep-brand] [--unattended]"
disable-model-invocation: true
---

# Page redesign: from an existing page to the best version of it

**Page and intent given by the user:** $ARGUMENTS

You are redesigning one page. Not decorating it: redesigning what the visitor sees, understands and does, then rebuilding it so the render proves it. The method is sober by default and rich when the brief asks for it. A sober page makes one strong decision and holds it everywhere; a timid page stacks effects to hide that no decision was made.

Flags in the arguments:

- `--refine`: keep the structure and layout family, fix hierarchy, system, states, copy and accessibility. Default is a full redesign.
- `--keep-brand`: the existing colors, logo and typefaces are fixed. Everything else may change.
- `--unattended`: never stop to ask. Where you would ask, take the recommended default, write it in the report, and continue.

The detailed rules live in `references/`. Load a file only at the step that needs it.

## Step 0: find the page and make it render

1. Resolve the argument to the source that produces the page: a file, a route in the router, a template, or a URL. For a URL, find the matching source in the current project if there is one. If there is no source (someone else's site), you are producing a new standalone page: say so in the report.
2. Identify the stack: framework, styling approach (CSS files, CSS modules, utility classes, CSS-in-JS), existing design tokens, component library, icon set. **You will rebuild in this stack**, reusing its components and tokens, not by importing a new framework.
3. Make the page render: start the dev server if needed (read the project's scripts), or open the static file. If it cannot render, stop and report why: a redesign you cannot look at is a guess.
4. Capture the page as it is:

   ```bash
   <skill-dir>/scripts/capture.sh <url-or-file> .redesign/shots before
   ```

   It writes full-page PNGs at 360, 768 and 1440 px. **Open and look at them** (read the image files). Everything that follows is judged on the render, not on the source.

Work in a git branch (`redesign/<page>`) when the project is a repository with a clean tree. Otherwise keep the original file next to the new one until the report is delivered.

## Step 1: the contract, what the page must keep doing

Before any design decision, write `.redesign/contract.md`: the list of everything the current page does that the redesign must preserve. Read the source for it, not only the screenshot.

- Every action: buttons, links, forms and their fields, submit targets, validation, keyboard shortcuts.
- Every piece of data shown, and where it comes from (props, API calls, template variables).
- Every piece of content: headings, copy, images, legal text. Content may be rewritten (step 4), never silently dropped.
- What other code depends on: ids, classes or `data-*` attributes used by scripts, tests, analytics or anchors; route and URL; query parameters.
- SEO and sharing: title, meta description, the single `h1`, structured data, canonical, Open Graph.
- Behavior across states: loading, empty, error, logged in or out, permissions.

This contract is checked item by item at the end. A beautiful page that lost the newsletter form or the analytics hook is a regression, not a redesign.

## Step 2: diagnose

Load `references/critique.md` and run its grid on the **before** screenshots. Then answer, in writing, in `.redesign/diagnosis.md`:

- **Who** arrives on this page, from where, and on what device most of the time.
- **What job** they came to do. One sentence.
- **The primary action**: the one thing the page must get done. If the current page has three competing ones, that is finding number one.
- **What stops them**: 3 to 7 findings, each with place, problem and fix, ranked blocking, important, detail. Look beyond visuals: order of information, missing answers to the visitor's real questions (price, delay, trust, next step), friction in forms, vague labels, dead ends.

Then write the brief line, one sentence, before producing anything: "Showcase, <domain>, <audience>, <tone>, <what comes first>." Example: "App screen, invoicing, accountants all day long, dense and calm, overdue items first."

**The path decides most rules.** A showcase (landing, product page, public profile) is about deciding and acting: impact, narrative, one memorable idea, one authored motion moment allowed. An app screen (dashboard, CRM, back office, settings) is about finishing a task: density, states, readability over a whole day, almost no motion, familiarity over distinctiveness. The path comes from the surface, not the product.

If the brief is ambiguous on something that changes everything (audience, tone, brand constraint) and `--unattended` is absent, ask ONE question with your recommended answer, and wait. Otherwise take the recommendation and record it.

## Step 3: direction and system

Load `references/direction.md`, then `references/system.md`.

- **Direction**: the visual world, what the page refuses to be, one accent, one radius scale, one layout family. Avoid the defaults a model produces without thinking (purple and electric blue, beige and brass for "premium", decorative gradients, a serif by reflex, eyebrow labels above every title): not because they are ugly, but because they read as machine defaults and erase the brand.
- **System**: typography scale, color tokens with measured contrast, spacing scale, grid, radii, elevation, light and dark if the path requires it. Decide the system before the first component. If the project already has tokens, extend them rather than creating a parallel set; with `--keep-brand`, the brand values are inputs, not choices.

Write the decisions at the top of `.redesign/diagnosis.md` under "Decisions". They are what the report will explain.

## Step 4: rebuild

Load the references as you reach each concern:

- `references/components-states.md` for each component, form, table or list. **Every interactive component has its seven states** (rest, hover, keyboard focus, active, disabled, loading, error), and every list has its three cases (full, empty, error). Shipping only the nominal case is shipping a third of the work.
- `references/interface-copy.md` for every label, heading, empty state, error and help text. A button names its action. An error names the problem and the way out. Rewrite the copy that the diagnosis flagged; keep facts, prices and legal text exact.
- `references/interactions.md` for feedback and transitions, and `references/motion-gsap.md` only for a scripted sequence or scroll-driven motion. Filter first: how often will the user see this animation? A hundred times a day: none.
- `references/accessibility-performance.md` before calling it done.

Build rules:

- Same stack, same data sources, same routes. Do not touch the backend, the API contract or unrelated pages. If the redesign truly needs a backend change (a missing field, a new endpoint), note it in the report as a follow-up instead of doing it.
- Real content only: the real texts, the real numbers, the longest name in the data. No lorem ipsum, no invented testimonials, logos, figures or reviews. If the page needs proof it does not have, leave a clearly marked slot and list it in the report.
- Images: reuse the existing assets. Do not hotlink stock photos. A missing visual gets a sober placeholder with its intended content described, listed in the report.
- Keep the one `h1`, the semantic landmarks, and every id or hook from the contract.

## Step 5: check the render, fix, check again

Capture the result:

```bash
<skill-dir>/scripts/capture.sh <url-or-file> .redesign/shots after
```

Open all three images and judge them as a stranger would:

1. **Squint test**: blurred or at 25 %, the primary element, the second, and the main groups are recognizable in that order, without reading.
2. **Critique grid** from `references/critique.md`, on the after screenshots.
3. **Measured, not eyeballed**: compute contrast of body text, secondary text and text on the accent from the actual computed colors (4.5:1 body, 3:1 large text and UI parts). Check there is no horizontal scroll at 360 px, touch targets at least 44 by 44 px, body text at least 16 px on mobile.
4. **Keyboard**: every action reachable by Tab in a sensible order, focus always visible.
5. **Contract**: go through `.redesign/contract.md` line by line and mark each item kept, moved or intentionally changed (with the reason).
6. If the project has tests, a linter or a type checker, run them.

Fix what is blocking or important, capture again, look again. Stop when a round finds nothing blocking and nothing important, or after three rounds: then list what remains honestly.

## Step 6: deliver

Write `.redesign/REPORT.md` and give the user its summary:

- The brief line and the path.
- The diagnosis: the findings on the old page, most severe first.
- The decisions: direction, accent, type, layout, and why they serve the job of the page.
- Before and after screenshots, side by side, at 360 and 1440 px (paths to the PNGs).
- The contract check: every item, kept or changed, nothing silently lost.
- What needs the owner: missing real content (photos, proof, figures), backend follow-ups, anything left unresolved after three rounds.
- How to review: branch name or file paths, and the command to see it running.

Do not commit to the main branch and do not deploy. The user reviews the render first.

## When two rules conflict

1. **The user's explicit brief**: a requested aesthetic, an existing charter, a brand constraint wins over everything below, including the sober default. Redirecting a clear brief toward your own taste is a failure.
2. **Accessibility and accuracy**: insufficient contrast or a misleading label is never traded for aesthetics.
3. **The path from step 2**: what is right on a showcase can be wrong in an app.
4. **The sober default**: with none of the above deciding, choose the calmest version that does the job.

## Traps already paid for

- **Redesigning the screenshot instead of the page.** The layout looks great at 1440 px and breaks at 360 px, or the form no longer posts. Always capture three widths and always check the contract.
- **The half-delivered component.** A table without its empty state, a form without its error state: the nominal case works, the product breaks on day one.
- **The card reflex.** A card is a container; it is justified when elevation carries real hierarchy. Otherwise a rule, a gap, a heading is enough. Cards inside cards are always wrong.
- **Decorative motion in a tool.** A 400 ms animation on an action repeated twenty times a day turns a fast tool into a slow one.
- **Contrast tested by eye.** Grey on grey always passes the designer's eye and never the meter.
- **Consistency lost on the way.** The accent chosen in the hero and forgotten by section seven is the most frequent sign of work that was not held.
- **Invented proof.** Fake testimonials, client logos or statistics make a page look finished and make it dishonest. Leave the slot, name what is needed.
