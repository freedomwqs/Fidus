# Fidus GitHub Setup Script

Write-Host "=========================================="
Write-Host "   Fidus GitHub Initialization Assistant"
Write-Host "=========================================="
Write-Host ""

# 1. Check Git Config
$gitEmail = git config --global user.email
if (-not $gitEmail) {
    $email = Read-Host "Please enter your Git Email (e.g., you@example.com)"
    git config --global user.email $email
}

$gitName = git config --global user.name
if (-not $gitName) {
    $name = Read-Host "Please enter your Git Name (e.g., Your Name)"
    git config --global user.name $name
}

# 2. Get GitHub Username
$username = "freedomwqs"
Write-Host "Using GitHub Username: $username"

# 3. Configure Remote
$privateRepoUrl = "https://github.com/$username/PDPA.git"
Write-Host "Configuring remote 'origin' to: $privateRepoUrl"

# Remove existing origin if any
git remote remove origin 2>$null

git remote add origin $privateRepoUrl

# 4. Commit and Push
Write-Host "Staging and Committing files..."
git add .
git commit -m "Initial commit: Fidus project structure, docs, and sync workflow" 2>$null
# Ignore commit error if nothing to commit

Write-Host ""
Write-Host "⚠️  IMPORTANT: Before pushing, ensure you have:"
Write-Host "1. Created 'PDPA' (Private) and 'Fidus' (Public) repos on GitHub."
Write-Host "2. Updated '.github/workflows/mirror.yml' with 'freedomwqs/Fidus.git'."
Write-Host "3. Added 'PUBLIC_REPO_PAT' secret to 'PDPA' settings."
Write-Host ""

Write-Host "🚀 Pushing to Private Repo (PDPA)..."
git branch -M main
git push -u origin main
Write-Host "✅ Done! Check the Actions tab in GitHub for sync status to Public Repo (Fidus)."

