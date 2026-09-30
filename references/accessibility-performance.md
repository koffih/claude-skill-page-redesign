# Accessibility and performance

Load this before declaring an interface finished. This is not a compliance step bolted on at the end: every point below also shows up as a quality flaw to a user without a disability.

## Contrast

| Element | Minimum ratio |
|---|---|
| Body text, placeholder text, help text | 4.5:1 |
| Large text (18 px bold, or 24 px) | 3:1 |
| Field border, meaningful icon, focus ring | 3:1 |
| Disabled text | No required minimum, but it stays readable: it tells the user what is unavailable |

The traps that all slip past the designer's eye: light gray on white for secondary text, placeholder text too pale in a field, a ghost button on a photograph, white text on a light accent. Measure, do not eyeball.

Color never carries information alone: a status has text or a shape, a link inside a paragraph has an underline or another marker besides the hue.

## Keyboard

- Everything you can do with a mouse, you can do with a keyboard. An action that only appears on hover is invisible to keyboard and touch users.
- Tab order follows visual order. A source order that differs from the displayed order is disorienting.
- The focus ring is visible everywhere, including on colored backgrounds. It gets redesigned, never removed.
- Escape closes whatever is open. Focus enters a modal dialog when it opens, stays there, and returns to the triggering element when it closes.
- A skip link to the main content when the navigation has more than five items.

## Structure and screen readers

- One `h1` per page, then a descent with no skipped levels. The heading hierarchy is the screen reader user's table of contents.
- Page landmarks: `header`, `nav`, `main`, `footer`. A `div` says nothing.
- Every informative image has a description; a decorative image has an empty alt attribute so it is ignored.
- An icon-only button has an accessible name.
- A field is linked to its label. The error is linked to the field.
- An area that changes without user action (search results, notification) is announced as a live region, with restraint: an overly chatty region is worse than silence.

## Touch

- Targets of 44 by 44 px minimum, 8 px between two neighboring targets. The visible mark can be smaller, the clickable area cannot.
- Depend on no hover for necessary information: hover does not exist under a finger.
- Zoom allowed up to 200 % with no loss of content and no horizontal scrolling.
- Respect safe areas on phones (notch, bottom bar).

## Perceived performance

The three metrics that matter, and what they mean for design:

- **Largest element rendered in under 2.5 s.** The hero image is preloaded and high priority. A display font loaded before the text delays everything.
- **Response to an interaction in under 200 ms.** If the work is long, show a loading state immediately.
- **Visual stability: no jumps.** Reserve space for images (width, height or aspect ratio), fonts (fallback with close metrics) and late-loading blocks. Content that jumps just as the user clicks makes them click the wrong thing.

In practice:

- Images in a modern format, sized for their real display size, lazy-loaded except for the first visible image.
- Load only the font weights you use, with `font-display: swap`, and a fallback font with close metrics.
- Loading skeletons match the final shape: they reserve space and prevent jumps.
- Very long lists: virtualization, or pagination. Three thousand rows in the DOM make the page unusable on a modest phone.
- Expensive effects (blur, large shadow, filter, canvas) stay confined to one area and are never applied to a scrolling container.

## Slow networks and modest devices

For a product used in markets where most people browse on mid-range phones over mobile data, the real constraint is not the browser, it is the network and the device.

- Aim for a page that is useful in under 3 seconds on simulated 3G, not just on fiber.
- Keep the total weight of a marketing page under 1 MB if possible, images included.
- Every heavy image has to earn its place: an illustrative photo that adds nothing costs the user more than it earns the brand.
- Plan for network failure: an error state with a "Retry" button beats a blank page.

## Check

- Contrast measured on the real color combinations, not on the theoretical palette.
- A full keyboard pass, from the first field to submission, with no mouse.
- 200 % zoom, no horizontal scrolling.
- 3G simulation: the page stays useful.
- Reduced motion on: nothing moves needlessly, state feedback remains.
