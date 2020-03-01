[Messages]
BeveledLabel  = patch {#Patch} #{#MyInfoVer}

; Languages
[Languages]
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}";
Name: "{commondesktop}\{cm:remove_mods} {#MyAppDesc}"; Filename: "{app}\{#MyUninstDirName}\unins000.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:adds_options}"; Flags: unchecked
Name: "pythonlog"; Description: "{cm:pythonlog}"; GroupDescription: "{cm:adds_options}"; Flags: unchecked
Name: "mods_backup"; Description: "{cm:safe_copy_xvm}"; GroupDescription: "{cm:adds_options}"; Flags: unchecked

[Files]

Source: "Fonts\gunplay.ttf"; DestDir: {fonts}; FontInstall: "Gunplay"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\enigmatic_unicode_regular.ttf"; DestDir: {fonts}; FontInstall: "Enigmatic Unicode"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\10_ZurichCond.ttf"; DestDir: {fonts}; FontInstall: "ZurichCond"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\DamageLog.otf"; DestDir: {fonts}; FontInstall: "DamageLog"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\Harpoon.ttf"; DestDir: {fonts}; FontInstall: "Harpoon"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\EnigmaU_2.TTF"; DestDir: {fonts}; FontInstall: "Enigmatic Unicode"; Flags: onlyifdoesntexist uninsneveruninstall;


;Source: "Images\NewUpdateNotifier.bmp";      DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\locked.bmp";                 DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\nostats.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\CrewExt.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\jimbo.bmp";                  DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Harpoon.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Deegie.bmp";                 DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Achilles.bmp";               DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\ShellTravelTimeSPG.bmp";     DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\mapRotation.bmp";            DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\skins.bmp";                  DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\TankExt.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\BattleObserver.bmp";         DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\WotlabPlayersRankings.bmp";  DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\KKK.bmp";                    DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\contour.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\bgv1.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\bgv2.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\bgv3.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\bgv4.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\bgv5.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\graph.bmp";                  DestDir: "{tmp}"; Flags: dontcopy

Source: "Images\beta.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\param_panels.bmp";           DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\yk_param_panel.bmp";         DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\yk_account_stat.bmp";        DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\yk_stat_by_tank.bmp";        DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\yk_vehicle_stat.bmp";        DestDir: "{tmp}"; Flags: dontcopy

Source: "Images\Tomonik_stats.bmp";          DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\camouflage.bmp";             DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\RI.bmp";                     DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\core.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\vanilla.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\base.bmp";                   DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Mjolnir.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\KellermanBlue.bmp";          DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Staple.bmp";                 DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Combo.bmp";                  DestDir: "{tmp}"; Flags: dontcopy

; RaJCeL's
Source: "Images\WN8_RaJCeL.bmp";                DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\rajcelHighCaliber.bmp";         DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\friendsNotifier_RaJCeL.bmp";    DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\shellinfo.bmp";                 DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Stats_RaJCeL.bmp";              DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\changeSilhouetteColors.bmp";    DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\singleListParams.bmp";          DestDir: "{tmp}"; Flags: dontcopy
; RaJCeL's

; HangMan
Source: "Images\HangMan.bmp";              DestDir: "{tmp}"; Flags: dontcopy

; ClockInHangar
Source: "Images\ClockInHangar.bmp";        DestDir: "{tmp}"; Flags: dontcopy

Source: "Images\paintball.bmp";              DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\MarksOnGunExtended.bmp";     DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Inner.bmp";                  DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Outer.bmp";                  DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Turtle_a.bmp";               DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\Turtle_b.bmp";               DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\consumablesPanel.bmp";       DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\WhiteMini2.bmp";             DestDir: "{tmp}"; Flags: dontcopy
Source: "Images\no_xvm_icons.bmp";           DestDir: "{tmp}"; Flags: dontcopy

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#LuncherApp}}"; Flags: nowait postinstall skipifsilent unchecked
Filename: https://modxvm.com/en; Description: "{cm:xvm_activate}"; Flags: postinstall nowait shellexec unchecked