[Setup]

AppId={{#MyAppID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}

; App publisher
AppPublisherURL={#MyThreadURL}
AppSupportURL={#MyThreadURL}
AppUpdatesURL={#MyThreadURL}

; Directory name
DefaultDirName={code:MyDirName}
;{code:MyDirName}
DefaultGroupName={#MyAppName}

; Group name
DisableProgramGroupPage   = yes
UsePreviousAppDir         = yes
CreateAppDir              = yes
DisableDirPage            = no
AlwaysShowDirOnReadyPage  = yes
ShowComponentSizes        = yes
;PrivilegesRequired        = lowest
CreateUninstallRegKey     = yes
DirExistsWarning          = no
AppendDefaultDirName      = no

;LanguageDetectionMethod     = locale

; Icons
SetupIconFile=Files\setup.ico
WizardSmallImageFile=Files\img.bmp

; License
LicenseFile=Files\License.txt
InfoBeforeFile=Files\changelog.rtf

; Output setup
OutputDir=.\Output{#OutputExt}
OutputBaseFilename={#MySetupName} {#Patch}.{#BuildNumber} {#ActData}

; Compression level
Compression=lzma2/ultra
InternalCompressLevel=ultra
SolidCompression=true

; Uninstall parameters
UninstallFilesDir={app}\{#MyUninstDirName}

ExtraDiskSpaceRequired=204857600