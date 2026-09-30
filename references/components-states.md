# Components and states

Load this when you build a component, a form, a table or a list. This is the sheet that separates a demo from a product.

## The seven states

Every interactive component has them. Shipping only the nominal state is the most common mistake.

| State | What it must show |
|---|---|
| Rest | The default form, already readable without hover |
| Hover | A light change (background, border), 100 to 150 ms |
| Keyboard focus | A visible ring, at least 3:1 contrast with the background, never removed |
| Active (pressed) | A physical press: `scale(0.98)` or 1 px down |
| Disabled | Reduced but readable contrast, explicit cursor, reason available to assistive tech |
| Loading | On the component itself, label kept, width locked |
| Error | The message next to its cause, not only at the top of the page |

Keyboard focus deserves emphasis: removing it because it looks ugly makes the interface unusable for anyone navigating by keyboard. It gets redesigned, never removed.

## The three cases of a list or table

- **Full**: the easy case.
- **Empty**: it teaches the interface. "No leads match these filters. Widen the date range or import a file." A bare "No data" is a dead end.
- **Error**: what failed, and what to do. Never show an empty list when loading failed: the user will think their data is gone.

Loading renders as skeletons that match the final shape, not as a spinner in the middle. The skeleton reserves the space and prevents layout shift.

## Buttons

- Three levels are enough: primary (the accent, one per screen), secondary (border or neutral fill), subtle (text only).
- The label names the action: "Save lease", not "Submit".
- One to three words. A label that wraps on a large screen is a broken button: shorten the text or widen the button.
- Two buttons with the same intent on one page ("Contact us" and "Let's talk"): keep one label, everywhere.
- Check the contrast of the text on the button background, including ghost buttons placed over a photo: they need a scrim or a border.

## Forms

- **Label above the field**, always visible. Placeholder text is not a label: it disappears as soon as you type, and the user no longer knows what they are filling in.
- Help text under the field, before input. Error under the field, after.
- Validate when the field loses focus, not on every keystroke. Fixing an error flagged at the third character is infuriating.
- The message states the problem and the way out: "Invalid phone number. Expected format: +1 555 010 0000."
- Group by meaning, with a heading per group once the form goes past six fields.
- Required or optional fields: mark whichever category is smaller, and say which at the top of the form.
- A long form is split into steps with a progress indicator, not a wall of thirty fields.

## Data tables

This is the most mistreated component in business applications.

- Headers stick to the top while scrolling, and the first column sticks if the table scrolls horizontally.
- Numbers right-aligned, tabular figures, same number of decimals within a column.
- Text left-aligned. Never center a column of text of varying lengths.
- Zebra striping, or 1 px separators: not both.
- Row actions stay visible, or appear on hover AND on keyboard focus. An action that exists only on hover is invisible to keyboard and touch users.
- Sorting: show which column is sorted and in which direction. Filters: show the active filters and a way to remove them one at a time.
- On a phone, a table becomes a list of cards: each row a card, the columns become label and value pairs. Horizontal scrolling of a table on a phone is a last resort.
- Pagination: say how many items in total and where the user is.

## Cards

A card is justified when elevation carries a real hierarchy, or when the whole element is clickable. Otherwise a rule, a gap or a heading is enough.

- Same-size cards repeated as the structure of the whole page: a sign that no hierarchy was decided.
- Cards inside cards: always a mistake.
- In a dense dashboard, metrics breathe better without containers, separated by rules.

## Modal dialogs

A modal is almost always a surrender: it interrupts. Look first for inline editing, a side panel, a dedicated page. It is justified for a destructive confirmation or a short task that demands focus.

When it is justified: closes on Escape and on outside click, focus moves inside on open and returns to the triggering element on close, focus is trapped while it is open.

## Navigation

- On a large screen, navigation fits on one line. Two lines: shorten the labels or collapse into a menu.
- Bar height: 64 to 72 px, 80 px at most. A bar that eats 15 % of the height steals the page.
- In an application: top bar plus side navigation, breadcrumbs as soon as there are three levels, current location always visible.
- The browser back button works, and important state (filters, active tab) lives in the URL. A filter that cannot be shared by link is a half-built filter.

## Check

- Pick a component at random and ask for its seven states. If three are missing, nothing is finished.
- The form has its labels above and its errors under the fields.
- The table has an empty state, an error state, and defined behavior on a phone.
- No action exists only on hover.
