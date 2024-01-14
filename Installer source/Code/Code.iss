[Code]

#define DwinsHs_Use_Predefined_Downloading_WizardPage
#define DwinsHs_Auto_Continue
#include "dwinshs.iss"

#ifdef UNICODE
    #define A "W"
#else
    #define A "A"
#endif

var
    PicForm: TForm;
    WotList: TNewComboBox;
    Buffer: String;
    InfoPic: TBitmapImage;
    TempPath: String;
    OptionPage: TInputOptionWizardPage;

type
    COLORREF = DWORD;

const
    UNDEF_INDEX = -777;
    ALPHA_BLEND_LEVEL = 128; // max=Byte=255

    WS_EX_LAYERED = $80000;
    WS_EX_TRANSPARENT = $20;
    LWA_COLORKEY = 1;
    LWA_ALPHA = 2;
    GWL_EXSTYLE = (0);

    DEVELOP = False;


function GetCursorPos(var lpPoint: TPoint): BOOL; external 'GetCursorPos@user32.dll stdcall';
function SetLayeredWindowAttributes(Hwnd: THandle; crKey: COLORREF; bAlpha: Byte; dwFlags: DWORD): Boolean; external 'SetLayeredWindowAttributes@user32.dll stdcall';
function GetWindowLong(hWnd: HWND; nIndex: Integer): Longint; external 'GetWindowLong{#A}@user32.dll stdcall';
function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';
function SetFocus(hWnd: HWND): HWND; external 'SetFocus@user32.dll stdcall';

function MyDirName(S:String): String;
var
    InsPath: String;
    er: boolean;
begin
    Result:=ExpandConstant('{sd}Games\World_of_Tanks\');
    er := RegQueryStringValue(HKLM, 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppID}', 'InstallLocation', InsPath);

    if er and (InsPath <> '') then
    begin
        Result := InsPath;
    end;
end;

function Logs(const text_log: string): Boolean;
begin
    Result := True;

    if DEVELOP then
        Result := SaveStringToFile(ExpandConstant('{app}\\{#LogsFile}'), text_log + #13#10, True);
end;

procedure DelModsDir();
begin
    DelTree(ExpandConstant('{app}\res_mods'), False, True, True);
    DelTree(ExpandConstant('{app}\mods'), False, True, True);
    DelTree(ExpandConstant('{app}\__ModsCache'), False, True, True);

    ForceDirectories(ExpandConstant('{app}\res_mods\{#Patch}'));
    ForceDirectories(ExpandConstant('{app}\mods\{#Patch}'));
end;

procedure RemoveDir(const Dir: string);
begin
    DelTree(ExpandConstant(Dir), True, True, True);
end;

procedure DirectoryCopy(SourcePath, DestPath: string);
var
    FindRec: TFindRec;
    SourceFilePath: string;
    DestFilePath: string;
begin
    if FindFirst(SourcePath + '\*', FindRec) then
    begin
        try
            repeat
                if (FindRec.Name <> '.') and (FindRec.Name <> '..') then
                begin
                    SourceFilePath := SourcePath + '\' + FindRec.Name;
                    DestFilePath := DestPath + '\' + FindRec.Name;
                if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
                begin
                    if FileCopy(SourceFilePath, DestFilePath, False) then
                    begin
                        Log(Format('Copied %s to %s', [SourceFilePath, DestFilePath]));
                    end else
                        begin
                            Log(Format('Failed to copy %s to %s', [SourceFilePath, DestFilePath]));
                        end;
                    end else
                        begin
                            if DirExists(DestFilePath) or CreateDir(DestFilePath) then
                            begin
                                Log(Format('Created %s', [DestFilePath]));
                                DirectoryCopy(SourceFilePath, DestFilePath);
                            end else
                                begin
                                    Log(Format('Failed to create %s', [DestFilePath]));
                                end;
                            end;
                        end;
            until not FindNext(FindRec);
        finally
            FindClose(FindRec);
        end;
    end else
    begin
        Log(Format('Failed to list %s', [SourcePath]));
    end;
end;

function RestoreBackupMods(): Boolean;
var
    LastVersion: AnsiString;
begin
    Result := True;

    if not LoadStringFromFile(ExpandConstant('{app}\{#Backup}\{#LastVersionFile}'), LastVersion) then
    begin
        Result := False;
        exit;
    end else
        begin
            DirectoryCopy(ExpandConstant('{app}\{#Backup}\' + LastVersion + '\mods\'), ExpandConstant('{app}\mods\'));
            DirectoryCopy(ExpandConstant('{app}\{#Backup}\' + LastVersion + '\res_mods\'), ExpandConstant('{app}\res_mods\'));
        end;
end;

function SaveBackupMods(): Boolean;
var
    CombineActualDateTime: String;
begin
    Result := True;

    CombineActualDateTime := '{#Patch}_' + GetDateTimeString('ddmmyyyy_hhnnss', #0, #0);

    ForceDirectories(ExpandConstant('{app}\{#Backup}\' + CombineActualDateTime + '\mods\'));
    ForceDirectories(ExpandConstant('{app}\{#Backup}\' + CombineActualDateTime + '\res_mods\'));

    DirectoryCopy(ExpandConstant('{app}\mods\'), ExpandConstant('{app}\{#Backup}\' + CombineActualDateTime + '\mods\'));
    DirectoryCopy(ExpandConstant('{app}\res_mods\'), ExpandConstant('{app}\{#Backup}\' + CombineActualDateTime + '\res_mods\'));

    SaveStringToFile(ExpandConstant('{app}\{#Backup}\{#LastVersionFile}'), CombineActualDateTime, False);
end;

function BackButtonClick(CurPageID: Integer): Boolean;
begin
    Result := True;
    DwinsHs_BackButtonClick(CurPageID);

    case CurPageID of
        wpSelectComponents:
        begin
            PicForm.Hide;
        end;
    end;
end;

function NextButtonClick(curPageID: Integer): Boolean;
var
    Index: Integer;
begin
    Result := True;
    DwinsHs_NextButtonClick(CurPageID, Result);

    case curPageID of
        wpSelectDir:
            begin
                if not FileExists(ExpandConstant('{app}\{#MyAppExe}')) then
                begin
                    MsgBox(ExpandConstant('{cm:myappexe_no_found}'), mbError, MB_OK);
                    Result := False;
                end else
            end;

        wpSelectComponents:
            begin
                PicForm.Hide;
            end;

        wpSelectTasks:
            begin
            // pass
            end;

        wpReady:
            begin

            Index := WizardForm.TasksList.Items.IndexOf(ExpandConstant('{cm:safe_copy_xvm}'));
            if Index <> -1 then
            begin
                if WizardForm.TasksList.Checked[Index] then
                begin
                    if SaveBackupMods() then
                    begin
                        MsgBox(ExpandConstant('{cm:backup_done}'), mbInformation, MB_OK);
                    end else
                        Result := False;
                end;
            end;

            Index := WizardForm.TasksList.Items.IndexOf(ExpandConstant('{cm:pythonlog}'));
            if Index <> -1 then
            begin
                if WizardForm.TasksList.Checked[Index] then
                begin
                    SaveStringToFile(ExpandConstant('{app}\win32\python.log'), '', False);
                    SaveStringToFile(ExpandConstant('{app}\win64\python.log'), '', False);

                    if FileExists(ExpandConstant('{app}\python.log')) then
                        SaveStringToFile(ExpandConstant('{app}\python.log'), '', False);
                end;
            end;

            if MsgBox(ExpandConstant('{cm:clear_mods_dir}'), mbConfirmation, MB_YESNO) = idYes then
            begin
                DelModsDir();
            end;

            if not DirExists(ExpandConstant('{app}\__ModsCache')) then
                ForceDirectories(ExpandConstant('{app}\__ModsCache'));
        end;

        wpFinished:
            begin
                RemoveDir(ExpandConstant('{app}\__ModsCache'));
            end;
    end;
end;

procedure ForumOnClick(Sender: TObject);
var ResCode: Integer;
begin
    ShellExec('', '{#MyThreadURL}', '' , '', SW_SHOW, ewNoWait, ResCode)
end;

procedure ClanOnClick(Sender: TObject);
var ResCode: Integer;
begin
    ShellExec('', '{#MyClanURL}', '' , '', SW_SHOW, ewNoWait, ResCode)
end;

procedure DonateOnClick(Sender: TObject);
var ResCode: Integer;
begin
    ShellExec('', '{#MyDonateURL}', '' , '', SW_SHOW, ewNoWait, ResCode)
end;

// =======================================================
procedure ShiftDown(Control: TControl; DeltaY: Integer);
begin
    Control.Top := Control.Top + DeltaY;
end;

procedure ShiftRight(Control: TControl; DeltaX: Integer);
begin
    Control.Left := Control.Left + DeltaX;
end;

procedure ShiftDownAndRight(Control: TControl; DeltaX, DeltaY: Integer);
begin
    ShiftDown(Control, DeltaY);
    ShiftRight(Control, DeltaX);
end;

procedure GrowDown(Control: TControl; DeltaY: Integer);
begin
    Control.Height := Control.Height + DeltaY;
end;

procedure GrowRight(Control: TControl; DeltaX: Integer);
begin
    Control.Width := Control.Width + DeltaX;
end;

procedure GrowRightAndDown(Control: TControl; DeltaX, DeltaY: Integer);
begin
    GrowRight(Control, DeltaX);
    GrowDown(Control, DeltaY);
end;

procedure GrowRightAndShiftDown(Control: TControl; DeltaX, DeltaY: Integer);
begin
    GrowRight(Control, DeltaX);
    ShiftDown(Control, DeltaY);
end;

var
    forumButton : TNewButton;
    clanButton  : TNewButton;
//    donateButton: TNewButton;

procedure GrowWizard(DeltaX, DeltaY: Integer);
begin
    GrowRightAndDown(WizardForm, DeltaX, DeltaY);

    with WizardForm do
    begin
        GrowRightAndShiftDown(Bevel, DeltaX, DeltaY);
        ShiftDownAndRight(CancelButton, DeltaX, DeltaY);
        ShiftDownAndRight(NextButton, DeltaX, DeltaY);
        ShiftDownAndRight(BackButton, DeltaX, DeltaY);
        GrowRightAndDown(OuterNotebook, DeltaX, DeltaY);
        //GrowRight(BeveledLabel, DeltaX);

        { WelcomePage }
        GrowDown(WizardBitmapImage, DeltaY);
        GrowRight(WelcomeLabel2, DeltaX);
        GrowRight(WelcomeLabel1, DeltaX);

        { InnerPage }
        GrowRight(Bevel1, DeltaX);
        GrowRightAndDown(InnerNotebook, DeltaX, DeltaY);

        { LicensePage }
        ShiftDown(LicenseNotAcceptedRadio, DeltaY);
        ShiftDown(LicenseAcceptedRadio, DeltaY);

        ShiftDown(forumButton, DeltaY);
        ShiftDown(clanButton, DeltaY);
        //ShiftDown(donateButton, DeltaY);
        ShiftDown(BeveledLabel, DeltaY);

        GrowRightAndDown(LicenseMemo, DeltaX, DeltaY);
        GrowRight(LicenseLabel1, DeltaX);

        { InfoBeforePage }
        GrowRightAndDown(InfoBeforeMemo, DeltaX, DeltaY);

        { SelectDirPage }
        GrowRightAndShiftDown(DiskSpaceLabel, DeltaX, DeltaY);
        ShiftRight(DirBrowseButton, DeltaX);
        GrowRight(DirEdit, DeltaX);
        GrowRight(SelectDirBrowseLabel, DeltaX);
        GrowRight(SelectDirLabel, DeltaX);

        { SelectComponentsPage }
        GrowRightAndShiftDown(ComponentsDiskSpaceLabel, DeltaX, DeltaY);
        GrowRightAndDown(ComponentsList, DeltaX, DeltaY);
        GrowRight(TypesCombo, DeltaX);
        GrowRight(SelectComponentsLabel, DeltaX);

        { SelectTasksPage }
        GrowRightAndDown(TasksList, DeltaX, DeltaY);
        GrowRight(SelectTasksLabel, DeltaX);

        { ReadyPage }
        GrowRightAndDown(ReadyMemo, DeltaX, DeltaY);
        GrowRight(ReadyLabel, DeltaX);

        { InstallingPage }
        GrowRight(FilenameLabel, DeltaX);
        GrowRight(StatusLabel, DeltaX);
        GrowRight(ProgressGauge, DeltaX);

        { MainPanel }
        GrowRight(MainPanel, DeltaX);
        ShiftRight(WizardSmallBitmapImage, DeltaX);
        GrowRight(PageDescriptionLabel, DeltaX);
        GrowRight(PageNameLabel, DeltaX);

        { FinishedPage }
        GrowDown(WizardBitmapImage2, DeltaY);
        GrowRight(RunList, DeltaX);
        GrowRight(FinishedLabel, DeltaX);
        GrowRight(FinishedHeadingLabel, DeltaX);
    end;
end;

procedure RedesignWizardForm;
begin
    forumButton := TNewButton.Create(WizardForm);
    with forumButton do
    begin
        Parent := WizardForm;
        Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left - WizardForm.CancelButton.Width;
        Top := WizardForm.CancelButton.Top;
        Width := WizardForm.CancelButton.Width;
        Height := WizardForm.CancelButton.Height;
        Caption := ExpandConstant('{cm:forum}');
        OnClick := @ForumOnClick;
    end;

    clanButton := TNewButton.Create(WizardForm);
    with clanButton do
    begin
        Parent := WizardForm;
        Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left;
        Top := WizardForm.CancelButton.Top;
        Width := WizardForm.CancelButton.Width;
        Height := WizardForm.CancelButton.Height;
        Caption := ExpandConstant('{cm:clan}');
        OnClick := @ClanOnClick;
    end;

    OptionPage := CreateInputOptionPage(wpSelectDir,
        ExpandConstant('{cm:optionpage_caption}'), ExpandConstant('{cm:optionpage_descr}'),
        ExpandConstant('{cm:optionpage_subcaption}'),
        False, False);

    OptionPage.Add(ExpandConstant('{cm:show_pictures_preview}'));
    OptionPage.Add(ExpandConstant('{cm:play_crew_sounds}'));
    OptionPage.Values[0] := True;
    OptionPage.Values[1] := False;

    // Read values into variables
    //IsRegisteredUser := OptionPage.Values[0];

    {donateButton := TNewButton.Create(WizardForm);
    with donateButton do
    begin
        Parent := WizardForm;
        Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left + clanButton.Width;
        Top := WizardForm.CancelButton.Top;
        Width := WizardForm.CancelButton.Width;
        Height := WizardForm.CancelButton.Height;
        Caption := 'Donate';
        OnClick := @DonateOnClick;
    end;}

    with WizardForm do
    begin
        Caption := ExpandConstant('{#MyAppName} {#MyAppVersion} / [{#ActData}]');
    end;
end;

procedure ShowPicHint(const PicFilePath: String);
var
	ImageTempPath : String;
begin
    if OptionPage.Values[0] = True then
    begin
        ImageTempPath := TempPath + PicFilePath;

        if not FileExists(ImageTempPath) then
            ExtractTemporaryFile(PicFilePath);

        InfoPic.Bitmap.LoadFromFile(ImageTempPath);

        try
            with PicForm do
            begin
                Top := WizardForm.Top;
                Left := WizardForm.Left + WizardForm.ClientWidth + 10;
                Height := InfoPic.Height;
                Width := InfoPic.Width;
                Show;
            end;
        finally
        // WizardForm.SetFocus();
        end;
    end;
end;

procedure StartPlayAudio(const AudioFile: String);
var
    AudioStreamHandle: HWND;
    AudioTempPath: String;
begin
    if OptionPage.Values[1] = True then
    begin
        AudioTempPath := AddBackslash(ExpandConstant('{tmp}\')) + AudioFile;

        if not FileExists(AudioTempPath) then
            ExtractTemporaryFile(AudioFile);

        if BASS_Init(-1, 44100, 0, 0, 0) then
        begin
            AudioStreamHandle := BASS_StreamCreateFile(False, AudioTempPath, 0, 0, 0, 0, 1);
            BASS_Start();
            BASS_ChannelPlay(AudioStreamHandle, False);
        end;
    end;
end;

procedure StopPlayAudio;
begin
    BASS_Stop();
    BASS_Free();
end;

procedure InfoInit();
begin
	TempPath := AddBackslash(ExpandConstant('{tmp}'));
	PicForm := TForm.Create(WizardForm);

	with PicForm do
    begin
        BorderStyle := bsNone;
        FormStyle := fsStayOnTop;
        InfoPic := TBitmapImage.Create(PicForm)
        with InfoPic do
        begin
            Parent := PicForm;
            AutoSize := True;
        end;
    end;

	SetWindowLong(PicForm.Handle, GWL_EXSTYLE, GetWindowLong(PicForm.Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
    SetLayeredWindowAttributes(PicForm.Handle, 0, ALPHA_BLEND_LEVEL, LWA_ALPHA);
end;

procedure ComponentsListOnClickCheck(Sender: TObject);
begin
	PicForm.Hide;
    StopPlayAudio;

	case WizardForm.ComponentsList.ItemIndex of
        //0: PL
        //1: begin StartPlayAudio(ExpandConstant('bomba_ekipa.mp3')); end;
        2: begin StartPlayAudio(ExpandConstant('julian.mp3')); end;
        3: begin StartPlayAudio(ExpandConstant('kobitki.mp3')); end;
        4: begin StartPlayAudio(ExpandConstant('pingwiny.mp3')); end;
        5: begin StartPlayAudio(ExpandConstant('pancerni.mp3')); end;
        6: begin StartPlayAudio(ExpandConstant('old_crew.mp3')); end;
        7: begin StartPlayAudio(ExpandConstant('Vito.mp3')); end;
        8: begin StartPlayAudio(ExpandConstant('Wiedzmin.mp3')); end;
        //9: EN
        10: begin StartPlayAudio(ExpandConstant('team_fortress.mp3')); end;
	end;
end;

procedure WotList_Update();
var
    ClientsCount, Index, ListIndex: Integer;
    Str: String;
begin
    ListIndex := WotList.ItemIndex;
    ClientsCount := WOT_GetClientsCount();

    WotList.Items.Clear();

    if ClientsCount > 0 then
    begin
        for Index:=0 to ClientsCount-1 do
        begin
            WOT_GetClientVersionW(Buffer,1024,Index);
            Str:=Copy(Buffer,0,Pos(#0, Buffer));

            case WOT_GetClientBranch(Index) of
                1: Insert(' Release: ',Str,Pos(#0, Str));
                2: Insert(' Common Test: ',Str,Pos(#0, Str));
                3: Insert(' Super Test: ',Str,Pos(#0, Str));
                4: Insert(' Sandbox: ',Str,Pos(#0, Str));
            end;

            WOT_GetClientPathW(Buffer,1024,Index);
            Insert(Buffer,Str,Pos(#0, Str));

            WotList.Items.Add(Str);
        end;
    end;

    WotList.Items.Add(ExpandConstant('{cm:browse}'));
    WotList.ItemIndex := ListIndex;
end;

procedure WotList_AddClient(ClientPath: String);
var
    Index: Integer;
begin
    if Length(ClientPath) = 0 then
    begin
        WotList.ItemIndex:=-1;
        exit;
    end;

    Index := WOT_AddClientW(ClientPath);
    if Index>=0 then begin
        WotList_Update();
        WotList.ItemIndex:=Index;
    end else
        begin
            MsgBox( ExpandConstant('{cm:wotNotFound}'), mbError, MB_OK);
            WotList.ItemIndex:=-1;
        end;
end;

procedure WotList_OnChange(Sender: TObject);
begin
    if WoTList.Text = ExpandConstant('{cm:browse}')  then
    begin
        WizardForm.DirBrowseButton.OnClick(nil);
        WotList_AddClient(WizardForm.DirEdit.Text);
    end;

    WOT_GetClientPathW(Buffer,1024,WotList.ItemIndex);
    WizardForm.DirEdit.Text:=Buffer;
end;

procedure DownloadInstallatorFiles;
begin
    //ITD_ClearFiles;

    //ITD_AddFile('https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Audio/AudioSamples.zip', ExpandConstant('{tmp}\AudioSamples.zip'));
end;

procedure InitializeWizard();
begin
    DwinsHs_InitializeWizard(wpPreparing);

    InfoInit();
    WizardForm.ComponentsList.OnClickCheck:=@ComponentsListOnClickCheck;

    RedesignWizardForm;
    GrowWizard(ScaleX(70), ScaleY(270));

    WizardForm.Position := poScreenCenter;

    SetLength(Buffer, 1024);

    WizardForm.DirEdit.Visible := False;
    WizardForm.DirEdit.Text := '';
    WizardForm.DirBrowseButton.Visible := False;

    WotList := TNewComboBox.Create(WizardForm);
    WotList.Parent := WizardForm.DirEdit.Parent;
    WotList.Style := csDropDownList;
    WotList.OnChange := @WotList_OnChange;
    WotList.SetBounds(
        WizardForm.DirEdit.Left,
        WizardForm.DirEdit.Top,
        WizardForm.DirBrowseButton.Left + WizardForm.DirBrowseButton.Width - WizardForm.DirEdit.Left,
        WizardForm.DirEdit.Height
    );

    WotList_Update();

    DownloadInstallatorFiles;
end;

procedure CurPageChanged(CurPage: Integer);
begin
    StopPlayAudio;
    DwinsHs_CurPageChanged(CurPage, nil, nil);

    //if (CurPage = wpInfoBefore) then
    //begin
    //    //ForceDirectories(ExpandConstant('{tmp}\AudioSamples'));
    //    //UnZip(ExpandConstant('{tmp}\AudioSamples.zip'), ExpandConstant('{tmp}\AudioSamples\'));
    //end;

    if (CurPage = wpSelectDir) then
	begin
		if WotList.ItemIndex = -1 then
        begin
            WotList.ItemIndex := 0;
        end;

		WotList.OnChange(nil);
	end;

    if (CurPage = wpSelectComponents) then
    begin
        WizardForm.ComponentsList.Checked[1] := True;
        WizardForm.ComponentsList.ItemEnabled[1] := False;
    end;
end;

function ShouldSkipPage(CurPageId: Integer): Boolean;
begin
  Result := False;
  DwinsHs_ShouldSkipPage(CurPageId, Result);
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  DwinsHs_CancelButtonClick(CurPageID, Cancel, Confirm);
end;

function CopyAndUnZip(Component, ModName: String): Boolean;
begin
    Result := True;

    if WizardIsComponentSelected(Component) then
    begin
        UnZip(ExpandConstant('{app}\__ModsCache\' + ModName + '.zip'), ExpandConstant('{app}\__ModsCache'));

        if DirExists(ExpandConstant('{app}\__ModsCache\' + ModName + '\mods\_patch_')) then
            DirectoryCopy(ExpandConstant('{app}\__ModsCache\' + ModName + '\mods\_patch_'), ExpandConstant('{app}\mods\{#Patch}'));

        if DirExists(ExpandConstant('{app}\__ModsCache\' + ModName + '\mods\configs')) then
        begin
            ForceDirectories(ExpandConstant('{app}\mods\configs'));
            DirectoryCopy(ExpandConstant('{app}\__ModsCache\' + ModName + '\mods\configs'), ExpandConstant('{app}\mods\configs'));
        end;

        if DirExists(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\_patch_')) then
            DirectoryCopy(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\_patch_'), ExpandConstant('{app}\res_mods\{#Patch}'));

        if DirExists(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\configs')) then
        begin
            ForceDirectories(ExpandConstant('{app}\res_mods\configs'));
            DirectoryCopy(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\configs'), ExpandConstant('{app}\res_mods\configs'));
        end;

        if DirExists(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\mods')) then
        begin
            ForceDirectories(ExpandConstant('{app}\res_mods\mods'));
            DirectoryCopy(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\mods'), ExpandConstant('{app}\res_mods\mods'));
        end;

        if DirExists(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\system')) then
        begin
            ForceDirectories(ExpandConstant('{app}\res_mods\system'));
            DirectoryCopy(ExpandConstant('{app}\__ModsCache\' + ModName + '\res_mods\system'), ExpandConstant('{app}\res_mods\system'));
        end;
    end;
end;


procedure CurStepChanged(CurStep: TSetupStep);
begin
    if CurStep = ssPostInstall then
    begin
        CopyAndUnZip('PL\Bomba',          'BombaBlokEkipa');
        CopyAndUnZip('PL\Julian',         'KrolJulian');
        CopyAndUnZip('PL\Kobitki',        'Kobitki');
        CopyAndUnZip('PL\Pingwiny',       'PingwinyPrzyjaciele');
        CopyAndUnZip('PL\Pancerni',       'Pancerni');
        CopyAndUnZip('PL\OldCrewSounds',  'OldCrew_0.6.7');
        CopyAndUnZip('PL\Vito',           'CrewSoundsByVito');
        CopyAndUnZip('PL\Wiedzmin',       'Wiedzmin');
        CopyAndUnZip('EN\TeamFortress',   'TeamFortress');
    end;
end;


procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
    DelModsDir;

    case CurUninstallStep of
        usPostUninstall:
        begin
            if MsgBox(ExpandConstant('{cm:restore_previous_mods}'), mbConfirmation, MB_YESNO) = idYes then
            begin
                RestoreBackupMods();
                MsgBox(ExpandConstant('{cm:copy_restored}'), mbInformation, MB_OK);
            end;

            RemoveDir(ExpandConstant('{app}\{#Backup}'));
        end;
    end;
end;

procedure DeinitializeSetup;
begin
    StopPlayAudio;
end;