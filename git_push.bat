@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ====================================
echo        Git 自动推送脚本
echo ====================================

:: 检查是否在 Git 仓库中
git status >nul 2>&1
if errorlevel 1 (
    echo 错误：当前目录不是 Git 仓库！
    pause
    exit /b 1
)

:: 显示当前状态
echo 当前 Git 状态：
git status

:: 输入提交信息
set /p commit_msg=请输入提交信息: 

:: 如果用户没有输入，使用默认信息
if "!commit_msg!"=="" (
    set commit_msg=自动提交 - %date% %time%
)

:: 执行 Git 操作
echo.
echo 正在添加文件到暂存区...
git add .

echo 正在提交更改...
git commit -m "!commit_msg!"

:: 检查是否设置了上游分支
echo 正在检查远程分支配置...
git rev-parse --abbrev-ref @{u} >nul 2>&1

if errorlevel 1 (
    echo 未设置上游分支，使用完整推送命令...
    git push -u origin master
) else (
    echo 已设置上游分支，使用简化推送命令...
    git push
)

echo.
echo ====================================
echo 操作完成！
echo ====================================

pause