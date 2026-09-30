# Scripted motion and GSAP

Load this only when the surface calls for a synchronized sequence, scroll-driven motion, pinning, or continuity between two states. For a hover, a menu opening or a press, `interactions.md` is enough and CSS does the job.

## Pick the tool, in this order

1. **CSS transitions and animations**: state change, simple entrance or exit, hover, focus. No dependency, interruptible, optimized by the browser.
2. **Web Animations API, or the library already in the project**: dynamic values, short sequencing, fine-grained interruption.
3. **CSS scroll-driven animations** (`animation-timeline: view()`): revealing elements as they enter the viewport, with a clean fallback.
4. **GSAP**: only when you need a real timeline, pinning, scrubbed scrolling, SVG morphing, or runtime control (pause, reverse, seek).

**Do not add GSAP for an effect the current stack expresses cleanly.** This is an explicit arbitration against the GSAP source, which recommends GSAP as the default choice for any JavaScript animation: on a restrained marketing site, the library costs more than the effect earns.

## Banned, whatever the tool

- `window.addEventListener("scroll", ...)` to drive an animation: called on every frame, not batched, a source of jank. Use `ScrollTrigger`, `IntersectionObserver`, or CSS scroll-driven animations.
- Scroll progress stored in a React component's state: it triggers a re-render on every frame.
- A `requestAnimationFrame` loop that touches component state.

## GSAP essentials

```js
gsap.to(target, { x: 100, duration: 0.5, ease: "power3.out" });
gsap.from(target, { opacity: 0, y: 16, duration: 0.4 });   // entrance
gsap.fromTo(target, { opacity: 0 }, { opacity: 1 });        // explicit start
```

- Properties are written in camelCase (`backgroundColor`, `rotationX`).
- `duration` in seconds, default 0.5.
- Eases: `power2.out` or `power3.out` for an arrival, `power2.inOut` for a move. `back` and `elastic` only for a celebration.
- `stagger` for a list that should appear as a list: `{ each: 0.06, from: "start" }`. Cap the total offset at 400 ms, otherwise the last item arrives after the user has already read the first.

**Timelines** rather than stacked delays: a timeline can be paused, reversed and scrubbed, a cascade of `delay` values can no longer be controlled.

```js
const tl = gsap.timeline({ defaults: { ease: "power3.out", duration: 0.4 } });
tl.from(".title", { y: 24, opacity: 0 })
  .from(".subtitle", { y: 16, opacity: 0 }, "-=0.2")
  .from(".action", { opacity: 0 }, "-=0.15");
```

**Reduced motion and breakpoints** are handled in the same place, with `matchMedia`. This is the function that keeps you from forgetting the accessible path.

```js
const mm = gsap.matchMedia();
mm.add({
  animate: "(prefers-reduced-motion: no-preference)",
  reduced: "(prefers-reduced-motion: reduce)",
}, (ctx) => {
  const { animate } = ctx.conditions;
  gsap.to(".panel", { opacity: 1, y: animate ? 0 : 0, duration: animate ? 0.5 : 0 });
});
```

**In React**, use `useGSAP` (or a `gsap.context()` reverted on unmount) so a component's animations go away with it. Without that, they pile up on every mount.

## Scrolling

- Content stays visible in its default state. If the script fails, the page still reads: a page whose content all starts at `opacity: 0` goes blank at the first incident.
- Pinning is justified when the sequence tells something (a three-step demo, a product coming apart). Pinning to slow down reading is a punishment.
- One pinned moment per page. Two sabotage each other.
- On phones, scroll-driven motion is expensive and fights the browser bars that appear and disappear. Test on a real device, or turn it off.

## What motion does not fix

A page without hierarchy does not become clear because its sections fade in. A fade-up applied to every section is the lowest common denominator: it costs work, says nothing, and signals default-generated output. If you cannot name what an animation explains, remove it.

## Check

- Every animation names its role: continuity, feedback, attention, or brand character.
- The page reads with scripts disabled.
- One pinned moment, a capped list stagger.
- `matchMedia` covers reduced motion, tested by simulating it.
