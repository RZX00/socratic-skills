# socratic-thinking installer (Windows / PowerShell)
# Usage:  irm https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.ps1 | iex
#Requires -Version 5
$ErrorActionPreference = 'Stop'

$RawUrl = 'https://raw.githubusercontent.com/RZX00/socratic-skills/main/skills/socratic-thinking/SKILL.md'
$Targets = @(
    (Join-Path $HOME '.claude\skills\socratic-thinking'),  # Claude Code
    (Join-Path $HOME '.agents\skills\socratic-thinking'),  # Codex / Agent skills
    (Join-Path $HOME '.codex\skills\socratic-thinking')    # Codex desktop skills
)

Write-Host 'Installing the socratic-thinking skill...' -ForegroundColor Cyan
$content = (Invoke-WebRequest -Uri $RawUrl -UseBasicParsing).Content
$metadataUrl = $RawUrl.Replace('/SKILL.md', '/agents/openai.yaml')
$metadata = (Invoke-WebRequest -Uri $metadataUrl -UseBasicParsing).Content

foreach ($dir in $Targets) {
    # Clean up deprecated socratic-coding in the same parent directory
    $oldDir = Join-Path (Split-Path $dir -Parent) 'socratic-coding'
    if (Test-Path -LiteralPath $oldDir) {
        Remove-Item -LiteralPath $oldDir -Recurse -Force
        Write-Host "  removed deprecated -> $oldDir" -ForegroundColor Yellow
    }
    New-Item -ItemType Directory -Force -Path (Join-Path $dir 'agents') | Out-Null
    Set-Content -Path (Join-Path $dir 'SKILL.md') -Value $content -Encoding UTF8
    Set-Content -Path (Join-Path $dir 'agents/openai.yaml') -Value $metadata -Encoding UTF8
    Write-Host "  installed -> $dir" -ForegroundColor Green
}

Write-Host 'Done. Restart Claude Code / Codex, then invoke socratic-thinking or ask to think through an open question.' -ForegroundColor Cyan

Write-Host 'Upgrading? Back up custom edits and remove the old socratic-coding skill separately.'
