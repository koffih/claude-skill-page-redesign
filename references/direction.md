# Art direction

Load this when you are choosing the visual world: personality, palette, materials, what the page refuses to be. Not needed for a one-off fix inside a world that is already established.

## Reading the brief: five signals

Before choosing anything, name these five points. Three lines are enough, and they are what keeps the page from being generic.

1. **Who is looking**, and in what situation (at a desk, on a phone in the street, on a slow connection, on a screen shared by several people).
2. **What they should feel in three seconds**: trust, urgency, calm, expertise, belonging.
3. **What they should do** next. One primary action per screen.
4. **What the brand refuses to be.** That refusal drives more decisions than the list of qualities it wants.
5. **The hard constraints**: existing brand guidelines, languages, information density, the audience's hardware.

## The restrained stance, made explicit

Restrained means: one strong decision, held everywhere, and nothing that does not serve it.

- **One accent, only one.** It serves primary actions, the current selection and status indicators. Never decoration.
- **One radius scale.** Everything sharp, everything rounded between 8 and 16 px, or everything interactive as a pill. A mixed system gets documented in one sentence and followed everywhere.
- **One family of neutrals.** Warm or cool, not both. The mix shows even when nobody can name it, and it reads as patchwork.
- **One layout family per role.** If the "our services" section and the "our work" section have the same shape, one of them is lazy.

Rich is allowed when the brief asks for it, and richness is then decided like everything else: one signature effect, carried all the way through, not five lukewarm ones.

## Defaults not to reproduce

These are not aesthetic bans: they are the reflexes a model falls back on when it has decided nothing. Recognizing them keeps a client from seeing "an AI page" before they see their brand.

**Color**

- Glowing purple or bright blue, in a gradient, on a dark background. The most recognizable reflex of all.
- For a premium or craft brand: cream beige plus brass plus very dark brown. This combination has been produced so many times that it makes the brand invisible. Alternatives to rotate through: silver gray and chrome; deep green, bone and amber; true black and tan; cobalt blue and a single neutral; terracotta and slate.
- Gradient text. Emphasis comes from weight or size.
- More than one accent, or an accent that changes partway down the page.

**Typography**

- A serif chosen because "it looks creative or premium". A serif is justified when the brief names it, or when the world is editorial, heritage or luxury and you can say why that particular one. Otherwise a sans with character does the job, the way black does in fashion.
- Mixing two families to highlight one word in a heading. Italic or bold from the same family is the right answer.
- A system display font (Impact, Arial Black) as the voice of a page that claims to have a world of its own.

**Structure**

- The eyebrow in small, letterspaced capitals above every section heading. See the arbitration below.
- Identical cards (icon, title, three lines) as the structure of the whole page.
- Numbered sections (01, 02, 03) when the sequence carries no information.
- Unicode glyphs or emoji in place of icons. Icons are drawn, from a real library, in a single stroke weight.
- The same layout family repeated: beyond two consecutive "image left, text right" sections, break the pattern.

## Light or dark

Choose from the usage scene, not from the category: who is looking, where, under what light. A tool used eight hours a day in a lit office does not have the same needs as a page read in the evening on a phone.

- **Public marketing site**: plan both modes from the start, as tokens, and respect `prefers-color-scheme`.
- **Internal application**: a single mode is acceptable if the decision is written into the system. Shipping a half-tested dark mode is worse than shipping none.
- In dark mode, compensate on three axes: slightly more line height, slightly more letter spacing, one weight heavier if the font needs it. Light text on a dark background looks thinner than it is.

## Arbitration between sources

- **Eyebrow**: impeccable bans it outright; taste-skill tolerates one per three sections. Kept: no eyebrow by default, the heading stands alone; if the brief requires one, at most one per three sections. Reason: it is the most visible templated rhythm marker, and the heading never needs it.
- **Font choice**: taste-skill discourages Inter and pushes fashionable fonts; impeccable allows system sans in tools. Kept: in a business application, a well-tuned neutral sans (system stack or Inter) is the right default, for load weight and familiarity; on a marketing site, a chosen, self-hosted font with character. Rejected: the blanket ban on Inter, which costs a font download for nothing in a back office.
- **Serif**: taste-skill bans serifs by default; impeccable says the brief wins. Kept: the brief wins, and with no brief, sans serif. Both sources say the same thing in two forms.

## Check

- You can name the central decision in one sentence and point to three places where it shows.
- One accent, one radius scale, one family of neutrals, across the whole surface.
- None of the defaults above is present without a written reason.
