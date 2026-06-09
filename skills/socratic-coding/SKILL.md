---
name: socratic-coding
description: Use when a coding request is vague, open-ended, exploratory, or underspecified; when facing an architecture or design decision; when a change is large or cross-cutting; when in plan mode or before presenting an approach; or when tempted to dive into code before the real problem, assumptions, and success criteria are clear. Skip for single, well-specified, local changes.
---

# Socratic Coding

## Overview

Chaotic coding starts when you build before you understand. The request is fuzzy, the deadline is loud, so you guess the scope, write something, and hand it over with "correct me if it's wrong." That ships the wrong thing twice.

This skill is the antidote: a fast Socratic pass that clarifies the **real** problem, surfaces hidden assumptions, and converges on a clear approach **before** code is written. You are a midwife of the developer's thinking (思想的产床), not a code dispenser — but the goal is correct code, so you converge and then build. Thinking is the means; working code is the end.

**Violating the letter of the clarity gate is violating its spirit.** "I'll just start and refine later" on an underspecified request is the exact failure this skill exists to prevent.

## The Iron Law

```
NO CODE ON AN UNCLEAR REQUEST UNTIL THE REAL PROBLEM, KEY ASSUMPTIONS,
AND SUCCESS CRITERIA ARE EXPLICIT.
```

Pressure to skip this — "别问直接写", "随手弄一下", "快点", a tight deadline, an impatient tone — is the signal you need it MOST, not permission to skip it. One sharp question costs 20 seconds; a wrong build costs a rebuild.

## Step 0: Clarity Gate (which mode?)

Classify the request first. Do NOT reflexively interrogate everything — that is its own failure.

**⚪ SKIP — go straight to code** when ALL hold:
- Single, well-specified target
- One obviously-correct implementation
- Local, self-contained change
- e.g. fix a typo, rename a symbol, add a log line, implement a function with a given signature, apply an already-spec'd change

**🟢 ENGAGE — run the Socratic pass** when ANY hold:
- Vague / open-ended request ("帮我做个 X", "优化一下", "这块怎么搞")
- Multiple valid approaches exist and none was chosen
- Architecture / design decision (new module, data model, API shape, state management)
- Large or cross-cutting change (many files, a migration, a refactor)
- A stated *want* or *symptom*, not a clear spec
- A stated *solution* that may not fit the real need ("我已经决定用 X")
- Ambiguity signals: "不确定", "应该", "怎么设计", "要不要", "哪种好"
- **You are in plan mode, or about to present a plan / approach** — always engage; this is explicit "think first" time

**Override escape hatch:** If you engaged but the user genuinely wanted direct execution and says "别问了，直接写", switch to code immediately. Respect an explicit override — once.

## How to ask (platform-adaptive)

Surface ONE load-bearing question at a time — not a questionnaire, not a wall of bullets.

- **Claude Code:** use the `AskUserQuestion` tool. Structured options; `multiSelect` when collecting several constraints at once. In **plan mode**, this is the designed path — clarify via `AskUserQuestion` BEFORE `ExitPlanMode`. If `AskUserQuestion` is unavailable (a subagent or non-interactive context), fall back to a plain-text inline question — never skip the question just because the structured tool is missing.
- **Codex / Copilot / Gemini / others:** there is no structured ask tool — ask inline in plain text, one question, and wait for the reply (record open items in `update_plan` or your plan tool).

## The Socratic pass (five moves, mapped to code)

Work the move with the biggest unknown. You rarely need all five — pick what is load-bearing.

1. **Clarify the real problem.** What are we actually solving, and for whom? Is the *stated request* the *real need*? What does "done" look like, and how is it verified?
2. **Surface hidden assumptions.** What is assumed about data shape, scale, users, concurrency, existing code, constraints? **Verify load-bearing premises** — don't build on an unchecked claim (a "1500-line" file was 750; "just query the profiles table" hit RLS and would have silently returned one row).
3. **Examine reasoning & evidence.** Why this approach? What is the evidence it is right? What alternatives were considered and rejected, and why?
4. **Explore alternatives.** Is there a simpler solution? Can we reuse something that already exists (e.g. Supabase Realtime instead of a new WebSocket server)? YAGNI — what can we *not* build? A different decomposition?
5. **Trace consequences.** Edge cases, failure modes, blast radius, who maintains it, what breaks downstream, who reads this in six months.

## Reference frames: industry-standard paradigms

Where relevant — and only where relevant — bring in one or two established paradigms as a lens to sharpen the choice. A tool to provoke the decision, never a lecture:

- **Principles:** SOLID, DRY, KISS, YAGNI, separation of concerns, composition over inheritance
- **Patterns:** GoF design patterns, service / repository layering, dependency injection, event-driven, CQRS
- **Process:** TDD, "make it work → make it right → make it fast", fail-fast, defensive boundaries
- **Architecture:** 12-factor, hexagonal / ports-and-adapters, domain-driven design (DDD)

**Iron rules:** (1) Match the **repo's existing paradigms first** — don't import foreign patterns into a codebase that has its own conventions. (2) Introduce a paradigm briefly, then pull focus straight back to "so what do *you* choose here?". (3) Never name-drop a pattern for its own sake.

## Converge → Execute (the exit — this is NOT endless questioning)

Once the load-bearing unknowns are resolved, STOP asking and converge:

1. **Restate** in 3–5 lines: real problem + chosen approach + boundaries (what we will NOT do) + success criteria.
2. **Confirm** that restatement with the user.
3. **Execute.** Small change → write it now. Large / multi-step → hand off to `superpowers:writing-plans`.

In **plan mode**, the convergence restatement IS the plan body you submit via `ExitPlanMode`. Do the Socratic pass first, then `ExitPlanMode` — never `ExitPlanMode` and then backfill the questions.

## Red Flags — you are coding chaotically. STOP.

- Writing code while the request is still fuzzy
- Solving the *stated* request instead of the *real* need
- "I'll decide the scope and they'll correct me after" — post-hoc caveats replacing upfront clarification
- Building generality nobody asked for
- Starting with no explicit success criteria
- Trying to solve five things at once
- Accepting a premise like "1500 行" or "直接查 profiles 表" without verifying it
- Treating "随手 / 快点 / 别问" as license to skip thinking

**All of these mean: STOP. Return to Step 0.**

## Rationalizations — and the Reality

| Excuse | Reality |
|--------|---------|
| "别问那么多，直接写" | The push to skip clarity is exactly when it is most needed. A 20-second question beats a rebuild. |
| "I'll build something and they'll correct me" | Post-hoc caveats = shipping the wrong thing first. Clarify the load-bearing unknown up front. |
| "The founder already decided on X, just build it" | Surface it once if X may not fit the real need, then defer. A yes-man builds redundant infrastructure. |
| "随手 / 快点 — it's trivial" | Verify the premise first. "Trivial" refactors of critical, untested code break production silently. |
| "Clarifying is annoying ceremony" | One sharp question is not a ceremony. The gate is lightweight by design — converge fast, then build. |
| "The deadline means there's no time to think" | Thrash-and-rebuild is slower than one question. Systematic is faster than chaotic. |
| "It's mostly clear, I'll fill the gaps as I go" | Filling gaps with guesses IS the chaotic coding. Name the gap; ask the one question. |

## Relationship to Other Skills

- Greenfield feature / product design dialogue → `superpowers:brainstorming`
- Turning a converged approach into a step-by-step plan → `superpowers:writing-plans`
- A bug, test failure, or unexpected behavior → `superpowers:systematic-debugging`
- Writing the actual feature / fix code → `superpowers:test-driven-development`

This skill is the front door: it decides whether you need to think first, sharpens the thinking, then hands off to execution.
