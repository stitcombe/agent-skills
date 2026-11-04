---
name: diataxis
description: Use when writing, restructuring, or reviewing technical documentation - tutorials, getting-started guides, quickstarts, how-to guides, READMEs, API/CLI/config reference, conceptual or background pages - or when deciding where a piece of content belongs, or when docs feel muddled, bloated, or hard to follow. Based on the Diátaxis framework (diataxis.fr).
license: CC-BY-SA-4.0
---

# Diátaxis

## Overview

Documentation serves four different user needs. Each need gets its own document type, with its own shape and language. Most bad documentation mixes types: a tutorial that tours options, a how-to guide that explains history, a reference page that teaches. Decide the type first, write to that type's contract, and send everything else to its own type with a link.

## The compass

Ask two questions about the user need, or about the content in front of you (a page, a section, a sentence):

1. Does it inform **action** (doing) or **cognition** (knowing)?
2. Does it serve **acquisition** (study) or **application** (work)?

|               | Acquisition (study) | Application (work) |
|---------------|---------------------|--------------------|
| **Action**    | Tutorial            | How-to guide       |
| **Cognition** | Explanation         | Reference          |

| Type | Answers | Form | Analogy |
|---|---|---|---|
| Tutorial | "Can you teach me to…?" | a lesson | teaching a child to cook |
| How-to guide | "How do I…?" | steps to a goal | a recipe |
| Reference | "What is…?" | dry description | the label on a food packet |
| Explanation | "Why…?" | discussion | a book on the history of cooking |

A "Quickstart" or "Getting started" page is a tutorial. Basic is not the same as tutorial: a how-to guide can cover basics, and a tutorial can be advanced. The test is study versus work.

## Contracts

The output of each type has these parts, in this order.

**Tutorial** - a lesson that a beginner completes with you.
1. Title and opening name the concrete thing the learner makes: "In this tutorial, we will track the time for one project and read the log."
2. Prerequisites: only what the first step needs.
3. Steps on one single path. Each step has: one instruction, the exact command or action, the exact expected output, and a "Notice that…" line where the output shows something worth seeing.
4. Close: say what the learner made, and link to the how-to guides.

Path rules: pick one value for every choice and use only that value; flags, alternatives, environment variables, and "you can also" belong in reference. Give a reason in one clause at most ("We use X because Y"), then link to the explanation. Write "we". Before you finish, walk the steps in order and track the state that each step leaves (running processes, files, timers, elapsed time). Every command must succeed in that state, and every expected output must agree with it.

**How-to guide** - directions for a competent user who has a goal.
1. Title: "How to <goal>", in the user's words ("How to bill a client for tracked time"), not a tool's name ("Using `tally log`").
2. One sentence: "This guide shows you how to <goal>." State the starting point that the guide assumes.
3. Numbered actions in dependency order. Branches as conditionals: "If you need X, do Y."
4. Stop when the goal is reached. Link to the reference for the full options.

Build each guide around a goal or a problem; such a guide often uses several commands. If a guide only restates one command, move its content to that command's reference entry.

**Reference** - a description of the machinery, for consultation during work.
1. Structure mirrors the product: one entry per command, module, endpoint, or configuration key, in the product's own hierarchy.
2. Every entry uses the same pattern: synopsis, description, parameters (name, type, default, allowed values), output, errors and exit codes, one short example.
3. Neutral statements of fact. Warnings as "You must…", "Never…".

**Explanation** - a discussion that builds understanding, read away from the work.
1. Title takes "About": "About data storage".
2. Body answers a "why": design decisions, history, constraints, trade-offs, alternatives that were rejected. Make connections to other topics. Opinion is permitted: "X suits Y better than Z, because…".
3. Link to the how-to guides and the reference for steps and facts.

## Facts, not filler

Expected output, defaults, limits, and error text come from the source material, the code, or a command that you run. If a contract slot needs a fact that you do not have, write a visible placeholder (`TODO: confirm output`) and list the gap for the user.

## Content in the wrong place

| You find | In | Do |
|---|---|---|
| a reason or history | a tutorial, how-to guide, or reference | keep one clause, move the rest to explanation, link |
| options, flags, full lists | a tutorial or how-to guide | move to reference, link |
| steps to reach a goal | reference or explanation | move to a how-to guide, link |
| a tour of features | a tutorial | cut to the one path; the features go in reference |

## Existing documentation

If a type has no content yet, do not create a section for it. The structure grows as you move content. Work in a loop:

1. Choose one piece: a page, a section, or a paragraph.
2. Assess it: which need does it serve (use the compass), how well, and does its language match that type's contract?
3. Choose the one change that gives the largest improvement: add, move, remove, or rewrite.
4. Make the change and commit it.
5. Repeat.

## When to read reference.md

Read [reference.md](reference.md) when at least one of these is true:

- You review or restructure existing documentation.
- The border between two types is not clear.
- You plan a navigation tree, a home page, or a landing page.
- You need the language patterns for a type.

---
Derived from [Diátaxis](https://diataxis.fr) by Daniele Procida, licensed [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). This skill is licensed CC BY-SA 4.0.
