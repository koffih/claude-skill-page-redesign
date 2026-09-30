# Interface copy

Load this when you write a label, a section heading, an empty state, an error message, help text, a confirmation. This copy is half the experience and the first thing that gets rushed.

This sheet covers interface copy. For an article or an editorial page, the project's own writing rules take precedence.

## The five rules

1. **The button names its action.** "Save lease", "Send application", "Delete permanently". Not "Submit", "Confirm", "OK", which force the user to scroll back up to learn what is about to happen.
2. **The error names the problem and the way out.** "This number is already used by another tenant. Open their record or change the number." Not "An error occurred".
3. **The empty state teaches how to fill it.** "No leads match these filters. Widen the date range, or import a file." Not "No data".
4. **"You" rather than "the user".** "You don't have an active lease yet" reads better than "The user has no active lease".
5. **One sentence says one thing.** One label, one idea. If two ideas are fighting over a line, the second goes into the help text under the field.

## What gives away default-generated copy

These phrasings keep coming back because they are statistically likely, not because they are useful.

- The self-announcing opener: "In this section", "Here's what you can do", "It's important to note that".
- The hollow contrast: "It's not X, it's Y." Just say Y.
- The unmeasured superlative: "an exceptional experience", "an innovative solution", "unmatched performance".
- Adjective triplets: "simple, fast and effective".
- The reinforcing adverb: "simply", "easily", "quickly". If the action is simple, the interface shows it.
- The passive voice: "Your request has been received" becomes "We received your request".
- The object that acts: "The system detected an anomaly" becomes "We couldn't read this file".
- The rhetorical question as a heading: "Why choose us?".
- Lazy absolutes: "always", "never", "everyone".

## Short forms

- **Field label**: one or two words, no colon, no article or possessive. "Address", not "Your address:".
- **Help text under the field**: what cannot be guessed, before input. A format, a limit, a consequence.
- **Destructive confirmation**: the button carries the action, not "Yes". "Delete 3 documents" is a sentence people reread before clicking.
- **Loading**: if the wait goes past three seconds, say what is happening. "Importing 1,200 rows, about 30 seconds."
- **Success**: short, and it offers the next step. "Lease saved. Generate the receipt?"
- **Notification**: one sentence, one optional action, dismisses itself unless it carries an error.

## Numbers, dates and currencies

- Formatting follows the user's locale, not the developer's.
- A currency amount is always written with its unit: "EUR 650,000" or "650,000 USD", never "650000".
- A relative date for recent items ("3 days ago"), an absolute date beyond that, and the exact date in a tooltip in both cases.
- Zero is distinct from missing data. "0" and "not provided" do not mean the same thing, especially for a rent or a balance.
- Large numbers are grouped by thousands, and the separator follows the locale.

## Multiple languages

When the interface exists in several languages, write for translation:

- Allow 30 % more width: French is longer than English, and German longer still.
- No sentences built from concatenated fragments: word order changes from one language to another.
- Plurals go through the form the framework provides, not through a "greater than 1" test.
- Copy is adapted, not translated word for word: the same facts, in the natural phrasing of the language.

## Arbitration between sources

- **Scope of stop-slop**: the source targets long-form prose and, among other things, bans em dashes. Kept: its rules for spotting automatic phrasings, applied to interface copy, where concision matters even more. Rejected: its five-dimension scoring grid, built for an article and pointless on a three-word label.
- This skill already bans em dashes, en dashes and emoji in all of its copy: that rule comes from the author's house style, the source only confirms it.

## Check

- Read the button labels out loud, out of context: do you know what will happen?
- Every error message offers a way out.
- Every list has an empty state that teaches something.
- None of the phrasings listed above survived.
