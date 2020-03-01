[Files]

Source: "Files\findwot.dll"; Flags: dontcopy

[Code]
procedure WGC_GetInstallPathW(Buffer: String; BufferSize: Integer);
external 'WGC_GetInstallPathW@files:findwot.dll cdecl';

function WGC_IsInstalled(): Boolean;
external 'WGC_IsInstalled@files:findwot.dll cdecl';

function WOT_AddClientW(ClientPath: String): Integer;
external 'WOT_AddClientW@files:findwot.dll cdecl';

procedure WOT_GetPreferredClientPathW(Buffer: String; BufferSize: Integer);
external 'WOT_GetPreferredClientPathW@files:findwot.dll cdecl';

function WOT_GetClientsCount(): Integer;
external 'WOT_GetClientsCount@files:findwot.dll cdecl';

function WOT_GetClientBranch(ClientIndex: Integer): Integer;
external 'WOT_GetClientBranch@files:findwot.dll cdecl';

function WOT_GetClientType(ClientIndex: Integer): Integer;
external 'WOT_GetClientType@files:findwot.dll cdecl';

procedure WOT_GetClientLocaleW(Buffer: String; BufferSize: Integer; ClientIndex: Integer);
external 'WOT_GetClientLocaleW@files:findwot.dll cdecl';

procedure WOT_GetClientPathW(Buffer: String; BufferSize: Integer; ClientIndex: Integer);
external 'WOT_GetClientPathW@files:findwot.dll cdecl';

procedure WOT_GetClientVersionW(Buffer: String; BufferSize: Integer; ClientIndex: Integer);
external 'WOT_GetClientVersionW@files:findwot.dll cdecl';

procedure WOT_GetClientExeVersionW(Buffer: String; BufferSize: Integer; ClientIndex: Integer);
external 'WOT_GetClientExeVersionW@files:findwot.dll cdecl';