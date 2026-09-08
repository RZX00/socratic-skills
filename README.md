# Socratic Thinking

帮助人思考，形成自己的判断。适用于产品、研究、写作、运营、个人决策和编程。

A portable Agent Skill that helps people clarify open questions, examine assumptions, and form their own judgment across domains. It contributes evidence and perspective while leaving goals, values, and consequential choices with the user.

## 工作方式 / How it works

- 从你的问题、已有判断和不确定处开始。
- 按需澄清含义、检验假设、查看证据、探索不同视角与后果。
- 提问不预设答案，不追问到你同意为止；同时主动提供事实、例子和建议。
- 区分 AI 的推荐与你已经作出的决定，尊重已明确的选择。
- 想清楚即可收敛，不强制转成执行计划。

The assistant asks focused, non-leading questions, supplies evidence and examples, and distinguishes its recommendations from your decisions. Clear execution requests proceed without a mandatory interview or repeated confirmation.

## 安装 / Install

### Claude Code plugin

```text
/plugin marketplace add RZX00/socratic-skills
/plugin install socratic-thinking@socratic-skills
```

### Windows / PowerShell

```powershell
irm https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.ps1 | iex
```

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.sh | bash
```

脚本会将 Skill 及调用元数据安装到以下两个目录。可以先下载并查看脚本再运行。
The scripts install both locations. You can download and inspect them before running.

- Claude Code: `~/.claude/skills/socratic-thinking/`
- Codex: `~/.agents/skills/socratic-thinking/`

手动安装时，将整个 `skills/socratic-thinking/` 目录复制到上述位置。
For manual installation, copy the entire skill directory to the appropriate location.

安装后重启 Agent 或刷新 Skill 列表。Restart the agent or refresh its skill list.

## 使用 / Usage

匹配的探索性请求可触发它；自动调用取决于宿主与模型，并不保证每次发生。也可以显式调用：

- Codex: `$socratic-thinking`
- Claude Code: 在可用 Skill / 命令列表中选择 Socratic Thinking。

> 用 $socratic-thinking 陪我想清楚：这个产品是否应该改成订阅制？

> 这篇文章感觉不对，陪我捋一下，保留我的表达意图。

> Help me examine the assumptions behind this decision and see what evidence could change my mind.

明确的小改动、事实问答和已确认的执行请求不强制重新讨论。

## 从旧版迁移 / Upgrade

Version 2 renames the skill and plugin from `socratic-coding` to `socratic-thinking`. The repository remains `RZX00/socratic-skills`.

旧版用户先备份自行修改的内容，再移除原 `socratic-coding` 安装，安装新版。脚本保留旧目录，不会自动删除你的文件；同时启用两个版本可能带来重复或矛盾指令。

Back up custom edits, remove the old skill from the agent directories you used, and install the new version. Installers preserve old directories.

For a plugin installation, uninstall `socratic-coding@socratic-skills`, refresh the marketplace, and install `socratic-thinking@socratic-skills`.

## 卸载 / Uninstall

Remove the installed `socratic-thinking` directories, or uninstall `socratic-thinking@socratic-skills` through the plugin manager.

## License

[MIT](./LICENSE) © rzx00
