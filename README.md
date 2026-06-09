# socratic-skills

> Socratic thinking-guidance for AI coding agents — **clarify the real problem before you write code**, instead of diving into chaotic coding.

A portable [Agent Skill](https://agentskills.io) that makes your coding agent stop and *think with you* when a request is fuzzy: it surfaces the real problem, the hidden assumptions, and the success criteria, then converges on a clear approach and **only then** writes code. On trivial, well-specified changes it gets out of the way.

Works with **Claude Code** and **Codex** (and any agent that reads `SKILL.md`).

---

## Why

LLM coding agents are eager. Hand one a vague request under deadline pressure and it will guess the scope, build something, and hand it back with "correct me if it's wrong" — shipping the wrong thing twice. `socratic-coding` is the antidote: a fast, sharp clarification pass modeled on the Socratic method (澄清 → 假设 → 理由 → 替代 → 后果), tuned for coding and wired to your agent's question tool.

It does **not** turn every task into an interrogation. A dual-mode gate skips anything single, local, and well-specified.

## What it does

| | |
|---|---|
| **Clarity gate** | Classifies each request: trivial & specified → code now; vague / architectural / large / **plan mode** → run the Socratic pass. |
| **Five Socratic moves → code** | Clarify the real problem · surface & verify assumptions · examine reasoning · explore alternatives (reuse / YAGNI) · trace consequences. |
| **Industry-standard paradigms** | Pulls in *one* relevant lens (SOLID, DRY, KISS, GoF, DI, TDD, DDD, 12-factor) — matching your repo's own conventions first. |
| **Converge → execute** | Restates problem + approach + boundaries + success criteria, confirms, then builds (hands big work to a planning skill). Not endless questioning. |
| **Platform-adaptive asking** | Claude Code → `AskUserQuestion`; Codex / others → one inline question at a time. |
| **Plan-mode aware** | In plan mode it clarifies **before** `ExitPlanMode`; the converged restatement becomes the plan. |

## Install

### Option A — Claude Code plugin (one command)

```
/plugin marketplace add RZX00/socratic-skills
/plugin install socratic-coding@socratic-skills
```

### Option B — One-line script (Claude Code **and** Codex)

Installs `SKILL.md` into both `~/.claude/skills/` and `~/.agents/skills/`.

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.sh | bash
```

**Windows (PowerShell)**
```powershell
irm https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.ps1 | iex
```

### Option C — Manual

Copy `skills/socratic-coding/SKILL.md` into your agent's skills directory:
- Claude Code: `~/.claude/skills/socratic-coding/SKILL.md`
- Codex: `~/.agents/skills/socratic-coding/SKILL.md`

Restart the agent afterward. The skill auto-activates on matching requests; you can also invoke it explicitly (e.g. `/socratic-coding` in Claude Code).

## How it triggers

🟢 **Engages** when the request is vague/open-ended, has multiple valid approaches, is an architecture decision, is large/cross-cutting, states a want or a possibly-wrong solution, shows ambiguity signals, **or you are in plan mode**.

⚪ **Skips** when the change is single, well-specified, and local (typo, rename, add a log line, implement a given-signature function).

Pressure to skip thinking ("just write it", a tight deadline) is treated as the signal you need it *most* — but an explicit override is always honored.

## Uninstall

Delete the skill folder from `~/.claude/skills/socratic-coding` and/or `~/.agents/skills/socratic-coding`. For the plugin: `/plugin uninstall socratic-coding@socratic-skills`.

## License

[MIT](./LICENSE) © rzx00

---

<a name="中文"></a>

# 中文说明

> 给 AI 编码 agent 的「苏格拉底式引导思考」技能 —— **写代码前先把真问题想清楚**，而不是一上来就混乱地编程。

一个可移植的 [Agent Skill](https://agentskills.io)：当你的请求还模糊时，让编码 agent 先停下来**和你一起想**——逼出真问题、隐含假设、成功标准，收敛成一个清晰方案，**然后才**动手写代码。遇到明确的小改动则自动让路、直接干。

兼容 **Claude Code** 和 **Codex**（以及任何会读 `SKILL.md` 的 agent）。

## 为什么

LLM 编码 agent 太「勤快」：丢给它一个模糊需求 + deadline 压力，它会猜个范围、建一堆东西，再附一句"嫌不对就说"——结果把错东西做两遍。`socratic-coding` 就是解药：一套快而锋利的澄清流程，照搬苏格拉底方法（**澄清 → 假设 → 理由 → 替代 → 后果**），针对编码场景调校，并接上你 agent 的提问工具。

它**不会**把每个任务都变成审问——双模式闸门会跳过一切单一、局部、已明确的改动。

## 它做什么

| | |
|---|---|
| **清晰度闸门** | 给每个请求分类：明确小改 → 直接写；模糊/架构/大改/**plan 模式** → 走苏格拉底引导。 |
| **苏格拉底五步 → 编码** | 澄清真问题 · 挖并核验假设 · 检验理由证据 · 探索替代（复用/YAGNI）· 推演后果。 |
| **行业标准范式参照系** | 在相关处引入**一个**范式做透镜（SOLID、DRY、KISS、GoF、DI、TDD、DDD、12-factor），优先匹配你仓库已有的约定。 |
| **收敛 → 转执行** | 回述「真问题+方案+边界+成功标准」，确认，然后动手（大改交给规划类技能）。不是无限提问。 |
| **平台自适应提问** | Claude Code → `AskUserQuestion`；Codex/其它 → 内联一次一个问题。 |
| **plan 模式感知** | 在 plan 模式下，澄清发生在 `ExitPlanMode` **之前**；收敛后的回述就是你的 plan。 |

## 安装

### 方式 A — Claude Code 插件（一行命令）

```
/plugin marketplace add RZX00/socratic-skills
/plugin install socratic-coding@socratic-skills
```

### 方式 B — 一行脚本（Claude Code 和 Codex 都装）

会把 `SKILL.md` 同时装进 `~/.claude/skills/` 和 `~/.agents/skills/`。

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.sh | bash
```

**Windows（PowerShell）**
```powershell
irm https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.ps1 | iex
```

### 方式 C — 手动

把 `skills/socratic-coding/SKILL.md` 拷进 agent 的技能目录：
- Claude Code：`~/.claude/skills/socratic-coding/SKILL.md`
- Codex：`~/.agents/skills/socratic-coding/SKILL.md`

装完重启 agent。技能会在匹配请求时自动触发，也可显式调用（Claude Code 里 `/socratic-coding`）。

## 触发规则

🟢 **触发**：请求模糊/开放、有多种合理方案、架构决策、大范围/跨层改动、只说想要什么或给了一个可能不对的方案、出现歧义信号词，**或你处于 plan 模式**。

⚪ **跳过**：单一、明确、局部的改动（改 typo、重命名、加日志、按给定签名补函数）。

"别问直接写""快点"这类跳过思考的压力，会被当成**最该**引导的信号——但你显式说"别问了直接写"永远会被尊重。

## 卸载

删掉 `~/.claude/skills/socratic-coding` 和/或 `~/.agents/skills/socratic-coding` 文件夹即可。插件方式：`/plugin uninstall socratic-coding@socratic-skills`。

## 许可

[MIT](./LICENSE) © rzx00
