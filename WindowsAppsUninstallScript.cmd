@echo off
title WindowsAppsUninstall
if not defined terminal mode 75, 15
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo:            ___________________________________________________ 
    echo:
    echo:               错误01:该脚本需要管理员权限.
    echo:               要使用管理员权限运行，在该脚本右键点击“以管理员身份运行”。
    echo:            ___________________________________________________ 
    pause
    exit /b
)
setlocal EnableDelayedExpansion
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentMajorVersionNumber 2^>nul') do set "hexVer=%%a"
if not defined hexVer (
    echo:            ___________________________________________________ 
    echo:
    echo:               错误02:不支持当前系统版本.
    echo:               本项目仅支持 Windows 10/11 以及对应的服务器版本。
    echo:            ___________________________________________________ 
    pause
    exit /b
)
where powershell.exe >nul 2>&1
if %errorlevel% neq 0 (
    echo:            ___________________________________________________ 
    echo:
    echo:               错误03:无法在系统中找到 powershell.exe
    echo:            ___________________________________________________ 
    pause
    exit /b
)
:_SureUninstall
if not defined terminal mode 80, 38
echo:            ___________________________________________________ 
echo:
echo:             		WindowsAppsUninstall
echo:               		B站:JeasonJi
echo:            ___________________________________________________ 
echo:
echo:               		确认要卸载WindowsApps吗？
echo:                       将会卸载以下应用:
echo:            ___________________________________________________
echo:                     打印3D                   Xbox TCUI
echo:                    相机                     XboxApp
echo:                      获取帮助              XboxGameOverlay
echo:                    Windows反馈中心          XboxGamingOverlay
echo:                     入门提示                Xbox语音转文本叠加层
echo:                    Office Hub              Xbox身份提供者
echo:                    MS画图                  GamingApp
echo:                    3D建模                  微软纸牌游戏合集
echo:                    3D查看器                OneNote
echo:                     画图                    Skype应用
echo:                    便签                    闹钟
echo:                     钱包                    邮件和日历
echo:                    地图                    Microsoft Edge稳定版
echo:                     消息                    Todo待办事项
echo:                    天气                    资讯
echo:                     人脉                    Clipchamp视频编辑器
echo:                    你的手机                Cortana
echo:                     OneConnect             录音机
echo:                    混合现实门户            ....(用户编辑的卸载)
echo:                     计算器
echo:            ___________________________________________________
echo:            
echo:               可以通过右键该脚本，点击"编辑"以编辑卸载应用
echo:            ___________________________________________________
echo:               	    通过键盘选择一个选项 [Y(是),N(否)]
choice /C:YN /N
set _erl=%errorlevel%
if %_erl%==2 exit /b
if %_erl%==1 goto _Uninstall
goto _SureUninstall
:_Uninstall
if not defined terminal mode 80, 38
cls
::================================================================================
::                          Notice
::
::你可以编辑下方脚本来卸载你要卸载的Package,Powershell会查找并卸载，如果Package填错将无法卸载
::
::格式:'call :UninstallApp "Package Name（技术名，给系统看的）" "Package中文名（显示名，给人看的）" "当前是第几个应用（数字，用于显示进度）"
::
::下方的AllPackage变量是显示总应用数，可以修改，填错对卸载没有影响，但显示的进度会有所影响
::
::================================================================================
set "AllPackage=38"
call :UninstallApp "Microsoft.Print3D" "打印3D" "1"
call :UninstallApp "Microsoft.WindowsCamera" "相机" "2"
call :UninstallApp "Microsoft.GetHelp" "获取帮助" "3"
call :UninstallApp "Microsoft.WindowsFeedbackHub" "Windows反馈中心" "4"
call :UninstallApp "Microsoft.Getstarted" "入门提示" "5"
call :UninstallApp "Microsoft.MicrosoftOfficeHub" "Office Hub" "6"
call :UninstallApp "Microsoft.Microsoft3DViewer" "3D查看器" "7"
call :UninstallApp "Microsoft.MSPaint" "MS画图" "8"
call :UninstallApp "Microsoft.Paint" "画图" "9"
call :UninstallApp "Microsoft.MicrosoftStickyNotes" "便签" "10"
call :UninstallApp "Microsoft.Wallet" "钱包" "11"
call :UninstallApp "Microsoft.WindowsMaps" "地图" "12"
call :UninstallApp "Microsoft.Messaging" "消息" "13"
call :UninstallApp "Microsoft.BingWeather" "天气" "14"
call :UninstallApp "Microsoft.People" "人脉" "15"
call :UninstallApp "Microsoft.YourPhone" "你的手机" "16"
call :UninstallApp "Microsoft.OneConnect" "OneConnect" "17"
call :UninstallApp "Microsoft.MixedReality.Portal" "混合现实门户" "18"
call :UninstallApp "Microsoft.Xbox.TCUI" "Xbox TCUI" "19"
call :UninstallApp "Microsoft.XboxApp" "XboxApp" "20"
call :UninstallApp "Microsoft.XboxGameOverlay" "XboxGameOverlay" "21"
call :UninstallApp "Microsoft.XboxGamingOverlay" "XboxGamingOverlay" "22"
call :UninstallApp "Microsoft.XboxSpeechToTextOverlay" "Xbox语音转文本叠加层" "23"
call :UninstallApp "Microsoft.XboxIdentityProvider" "Xbox身份提供者" "24"
call :UninstallApp "Microsoft.GamingApp" "GamingApp" "25"
call :UninstallApp "Microsoft.3DBuilder" "3D建模" "26"
call :UninstallApp "Microsoft.MicrosoftSolitaireCollection" "微软纸牌游戏合集" "27"
call :UninstallApp "Microsoft.Office.OneNote" "OneNote" "28"
call :UninstallApp "Microsoft.SkypeApp" "Skype应用" "29"
call :UninstallApp "Microsoft.WindowsAlarms" "闹钟" "30"
call :UninstallApp "Microsoft.windowscommunicationsapps" "邮件和日历" "31"
call :UninstallApp "Microsoft.MicrosoftEdge.Stable" "Microsoft Edge稳定版" "32"
call :UninstallApp "Microsoft.Todos" "Todo待办事项" "33"
call :UninstallApp "Microsoft.BingNews" "资讯" "34"
call :UninstallApp "Clipchamp.Clipchamp" "Clipchamp视频编辑器" "35"
call :UninstallApp "Microsoft.549981C3F5F10" "Cortana" "36"
call :UninstallApp "Microsoft.WindowsCalculator" "计算器" "37"
call :UninstallApp "Microsoft.WindowsSoundRecorder" "录音机" "38"
::================================================================================
title 全部卸载完成
echo:卸载完成,将在10秒内退出
timeout /t 10
exit /b
::====================================================================
:UninstallApp
set "PackageName=%~1"
set "DisplayName=%~2"
set "Progress=%~3"
title [%Progress%/%AllPackage%]
echo:===== 正在处理 %DisplayName% [正在卸载:%Progress%/总数量:%AllPackage%] =====
powershell -Command "if (Get-AppxPackage -Name '%PackageName%') { exit 0 } else { exit 1 }" >nul 2>&1
set "FindError1=%errorlevel%"
echo:首次查找错误代码: %FindError1%
if %FindError1% neq 0 (
    echo %DisplayName% 未安装，或者PackageName错误
    echo:
    goto :eof
)
echo 找到 %DisplayName%，正在卸载...
powershell -Command "Get-AppxPackage -Name '%PackageName%' | Remove-AppxPackage" >nul 2>&1
set "UninstallError=%errorlevel%"
echo 卸载命令错误代码: %UninstallError%
powershell -Command "if (Get-AppxPackage -Name '%PackageName%') { exit 0 } else { exit 1 }" >nul 2>&1
set "FindError2=%errorlevel%"
echo 二次查找错误代码: %FindError2%
if %FindError2% equ 0 (
    echo 需重新卸载 %DisplayName%
    echo:
) else (
    echo 成功
    echo:
)
goto :eof