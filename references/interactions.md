# Interactions and motion

Load this when you add motion: feedback on an action, an opening, a state transition. For a scripted sequence or scroll-driven motion, see `motion-gsap.md`.

## The frequency filter, before anything else

This is the deciding question, and it comes before taste.

| How often it is seen | Decision |
|---|---|
| A hundred times a day (keyboard shortcut, command palette, opening a tool menu) | No animation |
| Dozens of times a day (hover, moving through a list) | Keep to the bare minimum, under 150 ms |
| Occasionally (dialog, drawer, notification) | Standard animation |
| Rarely or the first time (onboarding, send confirmation) | Delight is allowed |

**Never animate an action triggered from the keyboard.** It is repeated hundreds of times a day, and animation makes it feel slow and disconnected from the gesture.

## Durations

| Element | Duration |
|---|---|
| Press feedback | 100 to 160 ms |
| Tooltip, small menu | 125 to 200 ms |
| Dropdown, select list | 150 to 250 ms |
| Dialog, drawer, view change | 200 to 500 ms |
| Signature moment on a marketing site | 500 to 800 ms |

Under 300 ms for everything that belongs to the interface. An exit is faster than an entrance: the user has already decided, they are not waiting.

## Easing curves

The browser's built-in curves are too soft to feel intentional.

```css
--ease-exit: cubic-bezier(0.23, 1, 0.32, 1);       /* interface entrances and exits */
--ease-smooth: cubic-bezier(0.77, 0, 0.175, 1);    /* on-screen movement */
--ease-drawer: cubic-bezier(0.32, 0.72, 0, 1);     /* drawers and panels */
--ease-arrival: cubic-bezier(0.16, 1, 0.3, 1);     /* settled arrival, signature moment */
```

How to choose:

- An element enters or leaves: deceleration (`--ease-exit`). It starts fast, so it feels responsive.
- An element moves or transforms on screen: acceleration then deceleration (`--ease-smooth`).
- A hover or a color change: the default curve is fine.
- Constant motion (progress bar, continuous scroll): linear.
- **Never acceleration alone (`ease-in`) on interface elements.** It delays the first movement, exactly the moment the user is watching, and the interface feels sluggish even at the same duration.
- Bounce and elastic are not reflexes: they suit a celebration, not a menu.

## What gets animated, and what does not

- Animate `transform` and `opacity` first: they are composited on the GPU.
- Blur, `backdrop-filter`, `clip-path`, masks and shadows are allowed when they stay smooth and are confined to one area. A blur over a scrolling area destroys smoothness on phones.
- Do not animate `width`, `height`, `top`, `left` or margins: every frame recalculates layout. Use the FLIP technique, transforms, or view transitions.
- `will-change` only for the duration of a known animation, never permanently.

## Details that change the feel

- **Never from `scale(0)`.** An element that grows out of a point looks rubbery and wrong. From 0.95 or 0.96, it feels right.
- **A menu opens from its trigger**: set `transform-origin` on the button's side, otherwise it seems to appear from nowhere.
- **The second tooltip does not wait.** After the first one opens, remove the delay and the animation while the pointer stays in the toolbar: the whole toolbar feels faster.
- **Immediate feedback beats accuracy.** A button that reacts in 100 ms and confirms in 400 ms feels faster than a button that waits for the server before moving.
- Prefer CSS transitions over keyframe animations for anything that can be interrupted: a transition resumes from the current value, a keyframe animation restarts.
- A light blur during an imperfect transition hides the flaw better than tweaking the curve.

## Reduced motion

Every motion needs a `prefers-reduced-motion: reduce` path, with a chosen alternative, not a global kill switch.

- Remove spatial movement, keep opacity, color and state changes.
- Infinite loops, parallax and scroll hijacking stop completely.
- Reduced motion means less motion, not no feedback at all: a button must still confirm that it heard.

## Arbitration between sources

- **Motion intensity**: taste-skill offers a dial that goes up to complex choreography; emil-design-eng bans animating frequent actions; impeccable limits tools to 150 to 250 ms. Kept: the frequency filter comes before the intensity dial. Reason: it is the only criterion that protects the everyday user, the one who will see the animation a thousand times.
- **Curves**: emil gives strong curves and bans acceleration alone; impeccable offers a settled arrival curve. Kept: both, each with its role, the settled arrival reserved for a marketing site's signature moment.
- **Property palette**: taste-skill limits motion to `transform` and `opacity`; impeccable opens it to blur, masks and shadows. Kept: `transform` and `opacity` by default, the rest allowed when confined to one area and measured on real hardware. Reason: the strict restriction rules out effects that cost nothing when confined, but the default must stay safe.

## Check

- Every animation answers the question: which state, relationship or feedback does it explain?
- An animation interrupted midway resumes cleanly.
- The reduced motion path exists and keeps state feedback.
- Nothing in the everyday interface moves for longer than 300 ms.
