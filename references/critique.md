# Final critique

Load this before handing work over, or when you are asked to judge an existing interface. The grid looks for one thing only: what gives away work produced by default rather than decided.

## How to critique

A useful critique names the place, the problem and the fix. "The hierarchy is weak" helps nobody; "the section heading and the body text have two similar weights, raise the heading to 600 and drop the body to 400" gets fixed in thirty seconds.

Classify every finding:

- **Blocking**: breaks usability or accessibility. Fixed before handing over.
- **Major**: clearly weakens the result. Fixed if time allows, flagged otherwise.
- **Minor**: noted, delays nothing.

Three to seven findings beat a list of twenty: a list that long never gets fixed.

## The squint test

Look at the page blurred, from a distance, or scaled down to 25 %. Without reading, you should recognize the main element, the second one, and the major groups, in that order. If everything has the same weight, the problem is not the color or the font: it is that no hierarchy was decided.

## Grid

**Hierarchy and structure**

- The main element of the screen is visible without reading.
- Related elements are close, distinct groups are separated. A container compensating for bad spacing is a band-aid.
- One primary action per screen.
- No layout family repeats to the point where two different sections look alike.

**System**

- One accent, one radius scale, one family of neutrals, held through the last section.
- Values come from the spacing scale, not improvised numbers.
- Typographic roles can be told apart by eye without reading the text.

**States and real cases**

- Seven states on interactive components, three cases on lists.
- The page holds up with real content: the longest name in the database, an eight-digit amount, a two-line heading, an empty table.
- Keyboard focus is visible everywhere.

**Copy**

- Buttons name their action.
- Errors offer a way out.
- No automatic phrasing (see `interface-copy.md`).

**Accessibility**

- Contrast measured.
- Full keyboard pass.
- Color never carries information alone.

**Motion**

- Every animation explains a state, a relationship or feedback.
- Nothing in the everyday interface goes past 300 ms.
- The reduced motion path exists.

**Responsiveness**

- 360 px, 768 px, 1440 px, 200 % zoom, no horizontal scrolling.
- The phone behavior of every multi-column layout is explicitly defined.

## Signs of default-generated work

If three of these signs are present, the page was not decided, it was assembled.

- Identical cards (icon, title, three lines) as the main structure.
- An eyebrow in small capitals above every section heading.
- A purple or bright blue gradient with no link to the brand.
- The same fade-up on every section on scroll.
- Three consecutive "image on one side, text on the other" sections.
- Emoji used as icons.
- Unreadable light gray secondary text.
- Made-up numbers as social proof.
- Browser surfaces left at their defaults: text selection, focus ring, custom scrollbar, non-tabular figures in a table. These are the cheapest details to fix and the ones most often forgotten.

## What the critique does not do

- It does not steer a clear brief toward a different taste. If the client asked for a rich, colorful page, the critique judges how well that richness is executed, not the choice.
- It does not ask for a full redo when three fixes are enough.
- It does not confuse familiar with lazy. In a business application, familiarity is a quality: the user should recognize a field, a table, a button without learning anything. Gratuitous strangeness costs more there than banality.

## Output format

```
Reading: [path, audience, intent, on one line]

Blocking
1. [Place] Problem. Fix.

Major
2. [Place] Problem. Fix.

Minor
3. [Place] Problem. Fix.

What works: [two or three points, so nothing that is right gets broken]
```
