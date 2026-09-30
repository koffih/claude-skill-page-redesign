# Sources and attributions

This skill is an English adaptation derived from the author's private skill `ui-ux-maitre`, written in French.

It is an arbitrated distillation of six public skills, all under permissive licenses. Nothing is copied verbatim: the rules were translated, compared against each other, and settled according to a single stance (restrained by default, rich when the brief asks for it). Contradictions between sources are resolved in the reference sheets, with the reason for each arbitration.

Distillation made on 2026-09-17, from the state of the repositories on that date.

| Source | License | Taken | Left out |
|---|---|---|---|
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache 2.0 | The four surface modes (reduced to two paths), the quality floor (contrast, measure, states, browser surfaces), the "Operate" depth for business applications, the duration tables, the distinction between refinement and redesign | The command system (`shape`, `audit`, `polish`...), the binary launcher and its scripts, the PRODUCT.md and DESIGN.md files, the native iOS and Android references |
| [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) | MIT | Correcting model defaults (recognizable palettes, reflex serifs, eyebrows, repeated layouts), hero section discipline, complete interactive states, performance and motion guardrails, the idea of dials (variance, motion, density) | The lists of fashionable fonts named one by one (they age within months), the hex codes banned one by one, one particular framework's utility classes, the section code skeletons |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | MIT | The priority order (accessibility first, then interaction, performance), the numeric thresholds (4.5:1, 44 by 44 px, 16 px, 1.5 line height, visual stability), the three spacing density levels | The local search tool and its database (79 styles, 192 palettes, 74 font pairings), persisting a MASTER.md file, the dependency on a Python script |
| [emilkowalski/skill](https://github.com/emilkowalski/skill), skill `emil-design-eng` | MIT | The frequency filter before any animation, the per-component duration table, the strong curves, the ban on acceleration alone, the finesse details (never from `scale(0)`, menu origin, second tooltip without delay, masking blur) | The Swift, iOS and React Native parts, the gesture and swipe recipes, ecosystem-specific components |
| [greensock/gsap-skills](https://github.com/greensock/gsap-skills) | MIT | The core of the API (tweens, timelines, staggers), `matchMedia` for reduced motion and breakpoints, cleanup in React, the scroll bans | The recommendation of GSAP as the default choice for any JavaScript animation (see arbitration below), the seven other skills in the repository (plugins, utilities, framework integrations) |
| [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) | MIT | Detection of automatic phrasings, applied only to interface copy: labels, empty states, errors, help text | The five-dimension scoring grid and its 35 out of 50 threshold, designed for long-form prose |

Not kept, though present in the original bookmarks folder:

- **mattpocock/skills**: general engineering (TDD, code review, spec writing), off topic for interface design.
- **motiondivision/motion**: an animation library, not a skill. Its `.claude/` folder only contains notes for its contributors.
- **21st.dev**: an online component catalog. The installable equivalent would be their MCP server, which requires an API key.

## The arbitrations that required a decision

1. **Eyebrow above section headings.** impeccable bans it outright, taste-skill tolerates one per three sections. Kept: none by default, and if the brief requires it, taste-skill's limit. Reason: it is the most recognizable templated rhythm marker, and the heading never needs it.
2. **Font choice in a business application.** taste-skill discourages Inter and pushes distinctive fonts, impeccable allows system sans in tools. Kept: a well-tuned neutral sans in an application, a chosen, self-hosted font on a marketing site. Reason: in a back office, loading a display font costs something and adds nothing, and familiarity is a quality.
3. **Fluid or fixed type scale.** taste-skill uses fluid sizes by default, impeccable bans fluid sizes in applications. Kept: fluid on marketing sites, fixed in applications. Reason: a heading that shrinks inside a side panel looks broken, not responsive.
4. **Motion intensity.** taste-skill offers a dial that goes up to complex choreography, emil-design-eng bans animating frequent actions, impeccable bounds tools to 150 to 250 ms. Kept: the frequency filter comes before any intensity dial. Reason: it is the only criterion that protects the everyday user, the one who will see the animation a thousand times.
5. **GSAP by default or as a last resort.** gsap-skills recommends GSAP whenever a JavaScript animation is requested, taste-skill reserves it for pinning and scrubbed scrolling. Kept: CSS first, GSAP when you need a timeline, pinning, scrubbed scrolling or runtime control. Reason: on a restrained marketing site, the library costs more than the effect earns.
6. **Light or dark.** taste-skill makes both modes mandatory for any public-facing page, impeccable says to choose from the usage scene. Kept: both modes on a public marketing site, a single mode acceptable in an internal application if the decision is written down. Reason: a half-tested dark mode is worse than no dark mode.

## License of this skill

Derivative work of MIT and Apache 2.0 sources, distributed under the same terms. The attributions above must remain in place.
