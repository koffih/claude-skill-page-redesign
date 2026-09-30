# The system: typography, color, spacing, grid

Load this when you set the tokens, before the first component. A system decided after the fact is no longer a system, it is an inventory.

## Typography

### Marketing site

- One display family that carries the voice, one readable text family. Two at most, and only if the second does a job the first cannot.
- A fluid scale is allowed: `clamp()` between the heading's bounds. Display ceiling of 6 rem, beyond which the heading turns into an image.
- Letter spacing: tighten large headings (down to -0.04 em, no further), leave body text at zero.
- Heading: two lines at most on a large screen. A heading on four lines is a sizing mistake, never a copy-length mistake.

### Business application

- **One family only.** A well-tuned sans carries headings, buttons, labels, text and data. A display plus text pairing creates noise where twenty roles are already on screen.
- **Fixed scale in rem, not fluid.** A heading that shrinks inside a side panel looks broken, not responsive.
- **Tight scale ratio: 1.125 to 1.2.** Many roles coexist; exaggerated contrast makes them unreadable together.
- Tabular figures (`font-variant-numeric: tabular-nums`) in tables, amounts and counters. Without them, columns of numbers jitter from one row to the next.

### Both paths

- Body text: 16 px floor on the web. Below that, sustained reading is tiring and zoom becomes mandatory.
- Reading measure: 65 to 75 characters per line for prose. Tables and dense interfaces can exceed it, that is normal.
- Line height scales with the measure: wider line, taller line height. 1.5 for body text, 1.1 to 1.2 for large headings.
- Four roles are almost always enough: heading, body, label, metadata. If two roles are hard to tell apart by eye, they are one role.

## Color

Three layers, in this order.

1. **Neutrals**: background, surface, secondary surface (sidebars, panels, headers), border, primary text, secondary text, disabled text. Pick warm or cool, once and for all.
2. **A single accent**: primary action, current selection, active status indicator. Saturation under 80 % by default: a highly saturated accent pulls the eye toward secondary elements and tires it over long use.
3. **Semantic**: success, warning, error, info. Each with a background version (light, for banners) and a text version (dark, high contrast).

Rules that hold on both paths:

- Secondary text on a colored surface is tinted from that hue, it does not turn gray. A neutral gray on a colored background looks dirty.
- Shadows are tinted from the background. A pure black shadow on a light background is a visible flaw even when nobody can name it.
- A shadow has a vertical offset and a soft blur. A colored glow with no offset is decoration, not depth.
- Never color alone to carry information: a status dot comes with text or a shape.

## Spacing

4 px base, scale: 4, 8, 12, 16, 24, 32, 48, 64, 96. The 4 px base gives the in-between steps that an 8-only scale cannot.

| Density | Path | Section gaps | Component padding |
|---|---|---|---|
| Airy | Marketing site | 96 to 128 px | 24 to 32 px |
| Standard | Dense marketing site, comfortable application | 48 to 64 px | 16 to 24 px |
| Dense | Dashboard, data table | 24 to 32 px | 8 to 12 px |

The rule that makes the most difference: **tight groups, generous separations**, and more space above a heading than below it. A heading stuck to the previous section visually belongs to the wrong section.

Group by proximity before adding a container. A card used to say "these three things belong together" is an admission that spacing did not do its job.

## Grid and responsiveness

- Twelve columns is still a good default on large screens, but the real question is the number of zones, not columns.
- Responsiveness is structural: collapse the sidebar, turn the table into a list of cards, go from three zones to one. It is not typographic.
- Define a single explicit breakpoint for every multi-column layout: below 768 px, say what happens, in the same component. Do not count on the framework to guess.
- Touch target: 44 by 44 px minimum, 8 px between two neighboring targets, even if the visible mark is smaller.

## Elevation and radii

- Three elevation levels are enough: resting (0), raised (menus, tooltips), floating (modal windows). Beyond that, nobody knows which layer is in front.
- Stacking order (`z-index`) documented on one line in the project constants: content, sticky bar, menu, dialog, notification. Arbitrary values scattered through components produce bugs nobody can read.
- Menus and tooltips escape their container. A menu absolutely positioned inside a parent with `overflow: hidden` will be clipped: use `<dialog>`, the popover API, `position: fixed` or a portal.

## Arbitration between sources

- **Fluid versus fixed scale**: taste-skill uses fluid sizes by default; impeccable bans fluid sizes in applications. Kept: fluid on marketing sites, fixed in applications. Reason: a tool's user looks at it from a constant distance and resolution, and a heading that varies with the panel width looks broken.
- **One family versus two**: taste-skill suggests display plus text pairings; impeccable says one family is enough in an application. Kept: two at most on marketing sites, one only in applications.
- **Spacing scale**: ui-ux-pro-max offers three density levels as tokens, impeccable a documented 4 px base. Kept: both, the 4 px base as the scale and density as a setting depending on the path.

## Check

- Every value comes from the scale, no one-off hard-coded value.
- Body text at 16 px minimum, prose between 65 and 75 characters.
- One accent, three elevation levels, a documented stacking order.
- Table numbers are tabular.
