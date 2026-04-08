# Claude Skills Integration Templates

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> Drop-in Markdown snippets that enable **any Agent CLI** to discover and use [Claude Skills](https://github.com/anthropics/skills) — even if you primarily use a different CLI than Claude Code.

**🚀 Try Now**: Give your web-capable agent this URL and say "install Claude Skills integration" → https://github.com/calt13/claude-skills-integration-templates

## 🎯 What This Solves

Claude Skills are auto-discovered from three sources: `~/.claude/skills/`, `.claude/skills/` (project), and plugin Skills.[[1]](https://docs.claude.com/en/docs/claude-code/skills) But what if you're using **Codex CLI, Gemini CLI, Kimi CLI or other CLIs** alongside Claude Code?

This repo provides **AGENTS.md templates** that teach any agent how to:
- ✅ Discover Skills from Claude Code's directories (`~/.claude/plugins/marketplaces/`)
- ✅ Scan neutral directories (`~/.agent/skills/`, `./.agent/skills/`)
- ✅ Load Skills progressively to avoid context bloat

**Key insight**: Skills aren't Claude-specific — you can point any model at a skills folder and say "read pdf/SKILL.md" and it will work.[[7]](https://simonwillison.net/2025/Oct/16/claude-skills/)

## 🔄 Two Usage Scenarios

### Scenario A: Claude Code User + Other CLIs

**You already use Claude Code** and installed Skills via:
```bash
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
```

Skills install to `~/.claude/plugins/marketplaces/owner/repo/skills/`[[1]](https://docs.claude.com/en/docs/claude-code/plugin-marketplaces)

**Now you want Codex/Gemini/Kimi to use the same Skills** → Just give them this URL and let them handle the rest!

**🚀 Easiest Way** (for web-capable agents):
```
Simply tell your agent: "Install Claude Skills integration from https://github.com/calt13/claude-skills-integration-templates"
```

**📋 Manual Way** (if needed):
```bash
# Download template
mkdir -p .agent
curl -o .agent/CLAUDE_SKILLS_INTEGRATION.md \
  https://raw.githubusercontent.com/calt13/claude-skills-integration-templates/main/templates/generic/CLAUDE_SKILLS_INTEGRATION.md

# Append to AGENTS.md (or let your CLI auto-discover)
cat .agent/CLAUDE_SKILLS_INTEGRATION.md >> AGENTS.md

# Append to GEMINI.md (for gemini-cli)
cat .agent/CLAUDE_SKILLS_INTEGRATION.md >> GEMINI.md
```

**Benefits**:
- ✅ No duplicate installations
- ✅ Single source of truth (`~/.claude/plugins/marketplaces/`)
- ✅ Updates via `/plugin marketplace update` benefit all CLIs

---

### Scenario B: Non-Claude Code User Wanting Skills

**You don't use Claude Code**, but want to enjoy the Skills ecosystem.

**Solution**: Install Skills to neutral directories:

```bash
# Option 1: Clone Skills repo directly
git clone https://github.com/anthropics/skills ~/.agent/skills/anthropic-skills

# Option 2: Clone community Skills
git clone https://github.com/obra/superpowers ~/.agent/skills/superpowers
git clone https://github.com/travisvn/awesome-claude-skills ~/.agent/skills/awesome-skills

# Option 3: Project-local Skills
mkdir -p ./.agent/skills/my-custom-skill
```

Then use our template to teach your CLI about these locations.

**Benefits**:
- ✅ CLI-agnostic setup
- ✅ Easy version control
- ✅ Shareable with team via git

## 📦 Available Templates

| Agent CLI | Template | Best For |
|-----------|----------|----------|
| **Generic** (any CLI) | [`generic/CLAUDE_SKILLS_INTEGRATION.md`](templates/generic/) | Works with Codex CLI,Gemini CLI,Kimi CLI,custom agents |
| **Local-Only** (project scope) | [`generic/local-only/CLAUDE_SKILLS_INTEGRATION.md`](templates/generic/local-only/) | Security-focused, scans only project-local directories |

## 🚀 Quick Start

**🆕 Easiest Method**: Have a web-capable agent? Just give it [this URL](https://github.com/calt13/claude-skills-integration-templates) and say "install Claude Skills integration" → No manual steps needed!

### Method 0: Zero-Setup Installation (For Web-Capable Agents) ⭐

**The easiest way** - if your agent has internet access, simply give it this URL:

```
https://github.com/calt13/claude-skills-integration-templates
```

Then ask your agent:
> "Please install Claude Skills integration from this URL"

**What happens**: Your agent will automatically fetch the templates, understand the installation process, and complete the setup for you.

**✅ Best for**: Codex CLI, Kimi CLI, Gemini CLI, or any web-enabled agent
**⚡ Effort**: Zero manual steps required
**🎯 Success rate**: High (agents can adapt the installation to your specific environment)

**Try this first!** If your agent successfully discovers and uses skills, you're all set. If not, proceed to the manual methods below.

### Method 1: Auto-Discovery (if your CLI scans `.agent/`)

```bash
mkdir -p .agent
curl -o .agent/CLAUDE_SKILLS_INTEGRATION.md \
  https://raw.githubusercontent.com/calt13/claude-skills-integration-templates/main/templates/generic/CLAUDE_SKILLS_INTEGRATION.md
```
``` agent-cli
# Your CLI's /init will process this (effectiveness may vary by CLI)
/init
```

**Note**: The `/init` command behavior varies across different CLIs - some may effectively integrate the template while others might not process it as expected. If you find skills aren't being discovered after `/init`, we recommend using **Method 0**, **Method 2** or **Method 3** for more reliable results.

### Method 2: Manual Append

```bash
curl -o /tmp/skills-integration.md \
  https://raw.githubusercontent.com/calt13/claude-skills-integration-templates/main/templates/generic/CLAUDE_SKILLS_INTEGRATION.md
```
```bash
cat /tmp/skills-integration.md >> AGENTS.md
```

### Method 3: Copy-Paste

Just copy the content and paste into your `AGENTS.md`.

### Method 4: Local-Only Setup (Security-Focused)

For enhanced security or isolated environments, use the local-only template that only scans project directories:

```bash
# Download local-only template (scans only ./.agent/skills/ and ./.claude/skills/)
curl -o .agent/CLAUDE_SKILLS_INTEGRATION.md \
  https://raw.githubusercontent.com/calt13/claude-skills-integration-templates/main/templates/generic/local-only/CLAUDE_SKILLS_INTEGRATION.md
```

```bash
# Optional: Link global skills to project for controlled access
ln -s ~/.claude/plugins/marketplaces/anthropics-skills ./.agent/skills/anthropic-skills
```

**Benefits**:
- ✅ No global directory scanning (enhanced security)
- ✅ Project isolation prevents unintended skill access
- ✅ Compatible with symbolic linking for controlled skill sharing
- ✅ Ideal for CI/CD environments and shared development containers

## 🤖 For Web-Capable Agents

If your agent can access web content, installation is even easier:

### One-Step Installation

**Simply tell your agent:**
> "Please install Claude Skills integration from https://github.com/calt13/claude-skills-integration-templates"

**What your agent will do:**
1. Fetch this repository
2. Read the installation instructions
3. Download the appropriate template
4. Integrate it into your configuration
5. Test skill discovery

**Example conversations:**
- "Can you install Claude Skills for me?"
- "I want to use Claude Skills with this project"
- "Help me set up skill discovery"

**Supported agents:** Codex CLI, Kimi CLI, Gemini CLI, Claude Code, and any agent with web access capabilities.

**Why this works**: Agents with web access can read this README, understand the installation process, and adapt it to your specific environment automatically.

## 📚 Skills Directory Structure

After setup, your agent will scan:

```
~/.claude/
├── plugins/
│   └── marketplaces/
│       ├── anthropics-skills/        ← From Claude Code plugins
│       │   └── document-skills/
│       │       └── pdf/
│       │           └── SKILL.md
│       └── obra-superpowers/
│           └── skills/
│               └── brainstorm/
│                   └── SKILL.md
│
└── skills/                            ← Personal Skills (manual)
    └── my-skill/
        └── SKILL.md

~/.agent/
└── skills/                             ← Neutral, CLI-agnostic
    └── community-skills/
        └── latex/
            └── SKILL.md

./.agent/
└── skills/                              ← Project-local
    └── project-skill/
        └── SKILL.md
```

Skills are stored as directories containing a SKILL.md file. Personal Skills go in `~/.claude/skills/`, Project Skills in `.claude/skills/`.[[1]](https://docs.claude.com/en/docs/claude-code/skills)

## 🎨 Template Features

Each template teaches agents to:

1. **Scan Standard Directories**

   ``` bash
   ./.agent/skills/ 
   ./.claude/skills/
   ~/.agent/.skills/                             
   ~/.claude/plugins/marketplaces/*/skills/  
   ~/.claude/skills/                      

   ```
2. **Progressive Loading** Metadata provides just enough info for Agent to know when each skill should be used without loading all of it into context.[[3]](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)
   - **Level 1**: Scan YAML frontmatter (`name`, `description`)
   - **Level 2**: Load full `SKILL.md` when triggered
   - **Level 3**: Execute scripts/load resources on demand

3. **Manual Trigger**
   
    - "Do you have any skills?"
    - "Can you find available Claude Skills?"
    - "List installed skills"

## 📖 How Claude Code Skills Work

To use plugins from a marketplace, run `/plugin marketplace add user-or-org/repo-name`[[2]](https://www.anthropic.com/news/claude-code-plugins)

Example workflow:
```bash
# Add official Skills marketplace
/plugin marketplace add anthropics/skills

# Install specific Skills
/plugin install document-skills@anthropic-agent-skills

# Skills install to:
# ~/.claude/plugins/marketplaces/anthropics-skills/document-skills/
```

You can register any GitHub repo as a marketplace[[2]](https://github.com/anthropics/skills) 
```

## 🛠️ Customization

### Local-Only Security Configuration

The [`local-only template`](templates/generic/local-only/) provides enhanced security by restricting skill discovery to project directories only:

```bash
# Create project-local skills directory
mkdir -p ./.agent/skills

# Link specific global skills (optional, for controlled access)
ln -s ~/.claude/plugins/marketplaces/anthropics-skills/document-skills ./.agent/skills/pdf-tools

# Use local-only template
curl -o .agent/CLAUDE_SKILLS_INTEGRATION.md \
  https://raw.githubusercontent.com/calt13/claude-skills-integration-templates/main/templates/generic/local-only/CLAUDE_SKILLS_INTEGRATION.md
```

**Security Benefits**:
- No scanning of user home directory (`~/.claude/`)
- Prevents accidental access to personal skills
- Ideal for shared development environments
- Compatible with containerized workflows

**Use Cases**:
- CI/CD pipelines requiring project isolation
- Team environments with strict security policies
- Development containers with limited filesystem access
- Projects requiring explicit skill whitelisting

### Add Custom Scan Paths

Edit the template:

``` markdown

      * `./.agent/skills/` (Project-local skills)
      * `~/.agent/skills/` (User-global skills)
      * `./.claude/skills/` (Project-local, Claude Code compatible)
      * `~/.claude/skills/` (User-global, Claude Code compatible)
      * `~/.claude/plugins/marketplaces/` (User-global, Claude Code compatible)
      * `~/my-company/shared-skills/` (Company Skills) 

```

## Troubleshooting & FAQ (For Users)

This section helps you understand the agent's behavior and troubleshoot skill discovery.

### Q: The agent doesn't seem to be using my skills. How can I check if it even found them?

**A:** The agent scans for skills "on-demand" (lazily) when it first needs them, or when you explicitly ask.

The single best way to test your skill setup is to **ask the agent directly**:

```

What skills do you have?

```

The agent is instructed to respond by listing all skills it found, grouped by "Project Skills" and "User Skills."

* **If you see your skill in this list:** Congratulations, it's installed correctly.
* **If your skill is not on this list:** See the next question.

### Q: I asked, but my new skill isn't on the list. What's wrong?

**A:** This is almost always an issue with the skill's location or its metadata file. The agent **only** scans the following specific directories:

* `./.agent/skills/` (Project-local)
* `~/.agent/skills/` (User-global)
* `./.claude/skills/` (Project-local, Claude compatible)
* `~/.claude/skills/` (User-global, Claude compatible)
* `~/.claude/plugins/marketplaces/` (User-global, Claude compatible)

**Troubleshooting Checklist:**
1.  **Check Location**: Is your skill's directory (e.g., `my-skill/`) placed *directly* inside one of the locations listed above?
2.  **Check `SKILL.md` File**: Does your skill directory contain a valid `SKILL.md` file (e.g., `./.agent/skills/my-skill/SKILL.md`)?
3.  **Check YAML Frontmatter**: Does the `SKILL.md` file start with a valid YAML block (between `---` lines) containing at least a `name` and `description`? The agent *only* reads this block during discovery.

### Q: I'm using the local-only template but skills aren't being found. What's different?

**A:** The local-only template only scans project directories (`./.agent/skills/` and `./.claude/skills/`). If you're using symbolic links:

1.  **Check symlink validity**: Ensure the linked directory exists and contains a valid `SKILL.md`
2.  **Check permissions**: Verify the agent can read through the symbolic link
3.  **Use absolute paths**: Consider using absolute paths in symlinks for reliability

**Example setup:**
```bash
# Create project skills directory
mkdir -p ./.agent/skills

# Link specific skills (avoid linking entire marketplaces)
ln -s ~/.claude/plugins/marketplaces/anthropics-skills/document-skills ./.agent/skills/pdf-tools

# Verify the link works
ls -la ./.agent/skills/pdf-tools/SKILL.md
```

**Note**: The local-only template is designed for security isolation. If you need global skill access, use the standard generic template instead.

### Q: How do I know the agent is *actually* using the skill for a task?

**A:** We have instructed the agent (in its `AGENTS.md` prompt) to be transparent.

When it successfully matches your task to a skill, it **should** state which skill it is using *before* it runs.

* **Example:** If you ask it to process a PDF, you should see a response like: "Okay, I will use the `pdf-tools` skill for that."
* **What if it doesn't?** If the agent just completes the task without mentioning a skill, it means it failed to match your request to any of its known skills and fell back to its general knowledge. You can try:
    1.  Re-phrasing your request to be more specific.
    2.  Checking your skill's `description` in its `SKILL.md` to ensure it clearly matches the kind of task you're asking for.

## 🤝 Contributing

We welcome contributions to improve and extend these skill integration prompt templates.

The most common way to contribute is by **adding or refining a template** for a specific agent CLI.

If you wish to add a template for a new CLI:

1.  Create a new template file, for example: `templates/your-agent-spec-name/ANOTHER_SKILLS_INTEGRATION.md`.
2.  In this file, write the prompt snippet. It can be based on the `generic` template but optimized with CLI-specific conventions (e.g., using special tool-call syntax instead of `Bash()`).
3.  Test your prompt snippet by appending it to a real agent's prompt file and verifying it works.
4.  Submit a Pull Request.

For more advanced contributions, such as improving the core prompt logic or contributing to the next-generation architecture, please see our detailed **[CONTRIBUTING.md](CONTRIBUTING.md)** file.

## 📄 License

MIT License - see [LICENSE](LICENSE)

## 🔗 Related Projects

- **[anthropics/skills](https://github.com/anthropics/skills)** - Public repository for Skills[[2]](https://github.com/anthropics/skills)
- **[obra/superpowers](https://github.com/obra/superpowers)** - Core skills library[[5]](https://github.com/obra/superpowers)
- **[awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)** - Curated list[[6]](https://github.com/travisvn/awesome-claude-skills)
- **[Claude Code Plugins Marketplace](https://claudecodemarketplace.com/)** - Browse plugins

## 🙏 Acknowledgments

- Anthropic's [Agent Skills documentation](https://docs.claude.com/en/docs/claude-code/skills)[[7]](https://simonwillison.net/2025/Oct/16/claude-skills/)
- Community developers building Skills ecosystem

## 📮 Support

- **Issues**: [GitHub Issues](https://github.com/calt13/claude-skills-integration-templates/issues)
- **Discussions**: [GitHub Discussions](https://github.com/calt13/claude-skills-integration-templates/discussions)

---

**Made with ❤️ for the multi-CLI agent community**

*Share Skills across all your development tools — no duplication needed!*

---

## iAiFy Fork Notes

> This section is maintained by the iAiFy enterprise and documents what the AiFeatures fork actually supports. If this contradicts upstream text above, this section wins for iAiFy operators.

**Status:** Active fork (maintained).
**Enterprise:** iAiFy (Stockholm).
**Upstream sync:** Managed via [Ai-road-4-You/fork-sync](https://github.com/Ai-road-4-You) — upstream changes are reviewed before merge; divergence is intentional where documented.
**Support scope:** Only the build/run paths documented below are supported internally. Other upstream surfaces are best-effort.

### Supported commands

Run only the commands verified in this repo's current manifest (see `package.json` / `pyproject.toml` / `Cargo.toml` for the authoritative list).

### CI/CD

This repo uses (or is migrating to) the shared enterprise CI/CD:

- Reusable workflows: [Ai-road-4-You/enterprise-ci-cd@v1](https://github.com/Ai-road-4-You/enterprise-ci-cd)
- Governance: [Ai-road-4-You/governance](https://github.com/Ai-road-4-You/governance)
- Documentation standard: [`docs/documentation-standard.md`](https://github.com/Ai-road-4-You/governance/blob/main/docs/documentation-standard.md)

### Contributing

Internal contributors follow the iAiFy governance rules: conventional commits, PR review required, no force-push to `main`. See [Ai-road-4-You/governance](https://github.com/Ai-road-4-You/governance).

### License

See `LICENSE` in this repo. iAiFy-originated changes are MIT unless the upstream license requires otherwise.
