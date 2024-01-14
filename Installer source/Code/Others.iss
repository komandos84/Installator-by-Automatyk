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

[Files]

;Source: "Fonts\enigmatic_unicode_regular.ttf"; DestDir: {fonts}; FontInstall: "Enigmatic Unicode"; Flags: onlyifdoesntexist uninsneveruninstall;
;Source: "Fonts\10_ZurichCond.ttf"; DestDir: {fonts}; FontInstall: "ZurichCond"; Flags: onlyifdoesntexist uninsneveruninstall;
;Source: "Fonts\DamageLog.otf"; DestDir: {fonts}; FontInstall: "DamageLog"; Flags: onlyifdoesntexist uninsneveruninstall;
;Source: "Fonts\Harpoon.ttf"; DestDir: {fonts}; FontInstall: "Harpoon"; Flags: onlyifdoesntexist uninsneveruninstall;
;Source: "Fonts\EnigmaU_2.TTF"; DestDir: {fonts}; FontInstall: "Enigmatic Unicode"; Flags: onlyifdoesntexist uninsneveruninstall;


;Source: "Images\NewUpdateNotifier.bmp";      DestDir: "{tmp}"; Flags: dontcopy


[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#LuncherApp}}"; Flags: nowait postinstall skipifsilent unchecked
;Filename: https://modxvm.com/en; Description: "{cm:xvm_activate}"; Flags: postinstall nowait shellexec unchecked