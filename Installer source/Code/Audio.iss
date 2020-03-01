[Files]
Source: "Files\bass.dll";           DestDir: "{tmp}"; Flags: dontcopy

; Source: "Audio\bomba_ekipa.mp3";    DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\julian.mp3";         DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\kobitki.mp3";        DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\pingwiny.mp3";       DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\pancerni.mp3";       DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\old_crew.mp3";       DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\team_fortress.mp3";  DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\Vito.mp3";           DestDir: "{tmp}"; Flags: dontcopy
Source: "Audio\wiedzmin.mp3";       DestDir: "{tmp}"; Flags: dontcopy


[Code]

function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean;
external 'BASS_Init@files:BASS.dll stdcall';

function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD;
external 'BASS_StreamCreateFile@files:BASS.dll stdcall';

function BASS_Start(): Boolean;
external 'BASS_Start@files:BASS.dll stdcall';

function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean;
external 'BASS_ChannelPlay@files:BASS.dll stdcall';

function BASS_Stop(): Boolean;
external 'BASS_Stop@files:BASS.dll stdcall';

function BASS_Free(): Boolean;
external 'BASS_Free@files:BASS.dll stdcall';