# GitHub 双仓库同步结构搭建指南

本指南将帮助你建立 `Private (Source)` -> `Public (Mirror)` 的自动化同步结构。

## 1. 在 GitHub 上创建仓库
请登录 GitHub 并创建两个 **空仓库** (不要添加 README 或 .gitignore)：

1.  **Fidus-Private** (设置为 **Private**): 作为核心开发库，包含所有私密数据和代码。
2.  **Fidus-Public** (设置为 **Public**): 作为对外展示的镜像库，只读。

## 2. 生成 Personal Access Token (PAT)
为了让 GitHub Action 能自动推送到 Public 仓库，你需要一个 Token。

1.  访问: [GitHub Settings -> Developer settings -> Personal access tokens -> Tokens (classic)](https://github.com/settings/tokens)
2.  点击 **Generate new token (classic)**.
3.  **Note**: `Fidus Mirror Sync`
4.  **Scopes**: 勾选 `repo` (Full control of private repositories) 和 `workflow`.
5.  **生成并复制 Token** (以 `ghp_` 开头)。

## 3. 配置 Private 仓库的 Secret
1.  进入 **Fidus-Private** 仓库页面。
2.  点击 **Settings** -> **Secrets and variables** -> **Actions**.
3.  点击 **New repository secret**.
4.  **Name**: `PUBLIC_REPO_PAT`
5.  **Secret**: 粘贴刚才复制的 Token。
6.  点击 **Add secret**.

## 4. 修改工作流配置文件
打开本地文件 `.github/workflows/mirror.yml`，修改以下内容：
*   将 `YOUR_USERNAME` 替换为你的 GitHub 用户名。
*   确认 `PUBLIC_REPO_URL` 指向你的 `Fidus-Public` 仓库。

## 5. 推送本地代码
在终端运行提供的初始化脚本，或手动执行：

```powershell
# 添加 Private 仓库作为远程源 (Origin)
git remote add origin https://github.com/<YOUR_USERNAME>/Fidus-Private.git

# 提交并推送
git add .
git commit -m "Initial commit: Fidus project structure and documentation"
git branch -M main
git push -u origin main
```

一旦推送到 `Fidus-Private`，GitHub Actions 会自动触发，将代码同步到 `Fidus-Public`。
