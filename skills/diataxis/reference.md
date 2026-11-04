# Diátaxis reference

Detail behind the contracts in [SKILL.md](SKILL.md).

## Tutorials

The author is responsible for the learner's success. The learner's only job is to follow the steps. What the learner *does* is not what they *learn*: they pick up names, tools, and habits through the doing.

- **Do not try to teach.** Give the learner things to do, and let the learning happen.
- **Show where we are going.** State the concrete result at the start. "You will learn…" is presumptuous; say what we will make.
- **Visible results early and often.** Every step produces a result the learner can see, so they connect cause and effect.
- **Narrate the expected.** "You will notice that…", "After a few moments, the server responds with…". Show the real output. Warn about surprising output (pages of logs). Name the likely failure: "If you do not see X, you probably forgot to Y."
- **Point out what to notice.** The prompt changed; a file appeared.
- **Permit repetition.** Make steps safe to run again where possible.
- **Minimise explanation.** One clause and a link. The user asks for explanation; the author does not push it.
- **Stay concrete.** This problem, this command, this result. Generalisation comes later, from the examples.
- **Ignore options and alternatives.** One path keeps the lesson short and certain.
- **Aim for perfect reliability.** Every step works for every learner, every time. One failure destroys trust in the tutorial and in the learner's own ability.

Patterns: "In this tutorial, we will…" · "First, do x. Now do y. Now that you have done y, do z." · "The output should look something like…" · "Notice that… Remember that… Let's check…" · "We must always do x before y because… (see <explanation link>)." · Close: "You have built a working…".

## How-to guides

A how-to guide is a contract: if you are in this situation, take these steps. It serves a competent user at work.

- **Goals, not tools.** Write for the user's project or problem. "To shut off the water, turn the tap clockwise" is useless to a competent user.
- **Real-world complexity.** Real problems fork. The guide must adapt to the user's case, not only one narrow case.
- **Omit the unnecessary.** Usability beats completeness. Start and stop at a meaningful place; the user joins the guide to their own work.
- **Logical sequence and flow.** Order steps by dependency. Avoid switches between tools and contexts. Do not make the user hold a thought open for long or jump back.
- **Actions include judgement.** "Decide whether you need X" is a valid step.
- **Name it exactly.** "How to integrate application performance monitoring" is good. "Integrating application performance monitoring" is unclear (it can mean whether to). "Application performance monitoring" is bad.
- A good list of how-to guides also shows what the product can do. These are usually the most-read pages.

Patterns: "This guide shows you how to…" · "If you want x, do y. To achieve w, do z." · "Refer to the <x> reference for a full list of options."

## Reference

Reference is led by the product, not by the user's task. The user consults it; the user does not read it.

- **Describe and only describe.** Austere, neutral, factual. Accuracy, precision, completeness, clarity.
- **Standard patterns.** The same layout for every entry. Consistency is what makes reference useful. This is not the place for style.
- **Mirror the machinery.** Module > class > method, like a map of the territory. This also makes gaps visible.
- **Examples illustrate.** A short usage example, with no instruction or discussion around it.
- Generated API documentation keeps reference accurate. It is not the whole documentation.

Patterns: "<X> is available as `<y>` and is defined in `<z>`." · "Subcommands are: a, b, c." · "You must use a. You must not apply b unless c. Never d."

## Explanation

Explanation is less urgent than the other types but not less important. Without it, knowledge stays fragmented and practice stays anxious. Other names: Background, Discussion, Concepts, Topics. In many doc sets it hides in small parcels inside other pages.

- **Make connections**, also to things outside the topic.
- **Give context.** Design decisions, history, technical constraints.
- **Talk about the subject.** The title should take "About" in front of it.
- **Admit opinion and perspective.** Weigh alternatives and counter-examples.
- **Keep it bounded.** Explanation absorbs instruction and description; keep those in their own types. Use a real or imagined "why" question to set the scope.

Patterns: "The reason for x is that, historically, y…" · "W is better than z, because…" · "An x in system y is like a w in system z. However…" · "Some users prefer w (because z). This can be a good approach, but…"

## Borders between types

Each type blurs into its neighbours. Most documentation problems come from this blur.

| Pair | What they share | The question that separates them |
|---|---|---|
| Tutorial / how-to guide | both are steps | Is the user studying or working? |
| How-to guide / reference | both serve work | Does the user need to do or to know? |
| Reference / explanation | both are knowledge | Would the user consult it during work, or read it away from the work? |
| Explanation / tutorial | both serve study | Does the user learn by doing or by thinking? |

**Tutorial versus how-to guide** (the most common confusion):

| Tutorial | How-to guide |
|---|---|
| gives basic competence | helps a competent user do a task |
| a managed path in a safe, controlled setting | the real world, with the unexpected |
| one line, no choices | forks: "If this, then that." |
| safe to restart | no promise of safety |
| author holds responsibility | user holds responsibility |
| explicit about basics (where to type, how long to wait) | relies on implicit knowledge |
| concrete and particular | general |

**Reference versus explanation** rules of thumb: boring and unmemorable is reference. Lists and tables are reference. If you could read it in the bath, it is explanation. A tide table is reference; "why are there tides" is explanation. Reference tends to grow: an example gets a "why" and a "what if", and the result is bad reference and stunted explanation.

## The user's journey

Users move between the needs: learn (tutorial), then work (how-to guide), consult (reference), and reflect (explanation). There is no fixed order and users enter anywhere. Link the types to each other along these moves.

## Structure

Diátaxis is not four boxes. The types must stay separate on every page; the navigation tree does not have to be four top-level sections.

1. **List the audiences first.** Find them in the material even when nobody names them: pages for contributors (build, test, release), for developers who extend the product (SDK, plugins), for each deployment target. Write the list down before you draw the tree.
2. **One audience:** the top level is the four types. Add one more level when a section grows: How-to guides > Install > Docker, VM, Kubernetes.
3. **Several audiences or topic areas that see the product differently:** the top level follows how the users see the product (Operate, Build plugins, Contribute). Apply the four types inside each division. Material that all audiences share stays in one place, and each division links to it.
4. **Landing pages** (the home page and each section page) read as an overview: a heading and one or two sentences of introduction for each group, then its links.
5. **Lists in a table of contents:** about seven items at most. If a list has a mechanical order (alphabetical, numerical), it can be longer. Otherwise, break it into groups.

Documentation can be as complex as it needs to be, as long as each part is logical and keeps the types separate.

Source: "Diátaxis in complex hierarchies", removed from diataxis.fr in 2026. Last version: `complex-hierarchies.rst` at commit `de7a2d813e` in [evildmp/diataxis-documentation-framework](https://github.com/evildmp/diataxis-documentation-framework/blob/de7a2d813e/complex-hierarchies.rst).

## Quality

- **Functional quality:** accurate, complete, consistent, precise. Objective and measurable. Diátaxis cannot supply it, but it exposes gaps: reference that mirrors the code shows missing entries; explanation removed from a tutorial shows where the learner was left to guess.
- **Deep quality:** flow, fit to human needs, a feeling that the docs anticipate the user. Subjective, and possible only on top of functional quality. Diátaxis helps by giving each need its own type and by keeping digressions out of the flow.

Review question for any page: which need does this serve, how well, and does every part of it belong to that need?

## Workflow

Diátaxis is a guide, not a plan. Do not draw up a new structure and pour content into it. Improve one piece, publish it, and repeat. Documentation is "complete, not finished": always complete for its current stage, never finished.
