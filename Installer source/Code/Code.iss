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
        //0:	begin ShowPicHint('mods.bmp'); end;
        //1:	begin ShowPicHint('StatsCounter.bmp'); end;
        //2:	begin ShowPicHint('NewUpdateNotifier.bmp'); end;
        //3:	begin ShowPicHint('some_mods.bmp'); end;
        //4:	begin ShowPicHint('XVM.bmp'); end;
        //5:    hangar
        6:	begin ShowPicHint('locked.bmp'); end;
        7:	begin ShowPicHint('nostats.bmp'); end;
        8:	begin ShowPicHint('contour.bmp'); end;
        //9:	begin ShowPicHint('saveLastServerEnable.bmp'); end;
        //10:	begin ShowPicHint('autologinEnable.bmp'); end;
        //11:	begin ShowPicHint('colors.bmp'); end;
        //12:	begin ShowPicHint('withoutxvm.bmp'); end;
        13:	begin ShowPicHint('ClockInHangar.bmp'); end;
        14:	begin ShowPicHint('no_xvm_icons.bmp'); end;
        //15:	begin ShowPicHint('withoutxvm.bmp'); end;
        16:	begin ShowPicHint('BattleObserver.bmp'); end;
        17:	begin ShowPicHint('WotlabPlayersRankings.bmp'); end;
        //18:	begin ShowPicHint('safeshot.bmp'); end;
        19:	begin ShowPicHint('mapRotation.bmp'); end;
        20:	begin ShowPicHint('TankExt.bmp'); end;
        21:	begin ShowPicHint('CrewExt.bmp'); end;
        22:	begin ShowPicHint('skins.bmp'); end;
        23:	begin ShowPicHint('KKK.bmp'); end;
        24: begin ShowPicHint('RI.bmp'); end;
        25:	begin ShowPicHint('camouflage.bmp'); end;
        // 26 RaJCeL
        27:	begin ShowPicHint('WN8_RaJCeL.bmp'); end;
        28:	begin ShowPicHint('rajcelHighCaliber.bmp'); end;
        29:	begin ShowPicHint('friendsNotifier_RaJCeL.bmp'); end;
        30:	begin ShowPicHint('shellInfo.bmp'); end;
        31:	begin ShowPicHint('Stats_RaJCeL.bmp'); end;
        32:	begin ShowPicHint('singleListParams.bmp'); end;
        33:	begin ShowPicHint('changeSilhouetteColors.bmp'); end;
        //34:	begin ShowPicHint('FriendsMarkerOldSkools.bmp'); end;
        35: begin ShowPicHint('paintball.bmp'); end;
        36: begin ShowPicHint('MarksOnGunExtended.bmp'); end;
        //37
        //38
        39: begin ShowPicHint('core.bmp'); end;
        40: begin ShowPicHint('vanilla.bmp'); end;
        41:	begin ShowPicHint('base.bmp'); end;
        //42
        43:	begin ShowPicHint('bgv1.bmp'); end;
        44:	begin ShowPicHint('bgv2.bmp'); end;
        45:	begin ShowPicHint('bgv3.bmp'); end;
        46:	begin ShowPicHint('bgv4.bmp'); end;
        47:	begin ShowPicHint('bgv5.bmp'); end;
        48:	begin ShowPicHint('graph.bmp'); end;
        //49
        //50
        51:	begin ShowPicHint('param_panels.bmp'); end;
        52:	begin ShowPicHint('yk_param_panel.bmp'); end;
        53:	begin ShowPicHint('yk_account_stat.bmp'); end;
        54:	begin ShowPicHint('yk_stat_by_tank.bmp'); end;
        55:	begin ShowPicHint('yk_vehicle_stat.bmp'); end;
        //56
        57:	begin ShowPicHint('beta.bmp'); end;
        //58
        59:	begin ShowPicHint('Tomonik_stats.bmp'); end;
        //60: begin ShowPicHint('crosshairs.bmp'); end;
        61:	begin ShowPicHint('jimbo.bmp'); end;
        62:	begin ShowPicHint('Harpoon.bmp'); end;
        63:	begin ShowPicHint('Deegie.bmp'); end;
        64:	begin ShowPicHint('Achilles.bmp'); end;
        65:	begin ShowPicHint('Mjolnir.bmp'); end;
        66: begin ShowPicHint('KellermanBlue.bmp'); end;
        67: begin ShowPicHint('Staple.bmp'); end;
        68: begin ShowPicHint('WhiteMini2.bmp'); end;
        69: begin ShowPicHint('Combo.bmp'); end;
        70: begin ShowPicHint('ShellTravelTimeSPG.bmp'); end;
        //71: begin ShowPicHint('DamagePanel.bmp'); end;
        72: begin ShowPicHint('Inner.bmp'); end;
        73: begin ShowPicHint('Outer.bmp'); end;
        74: begin ShowPicHint('Turtle_a.bmp'); end;
        75: begin ShowPicHint('Turtle_b.bmp'); end;
        76: begin ShowPicHint('consumablesPanel.bmp'); end;
        77: begin ShowPicHint('HangMan.bmp'); end;
        //78: begin ShowPicHint('achivments.bmp'); end;
        //79: sounds
        //80: begin StartPlayAudio(ExpandConstant('bomba_ekipa.mp3')); end;
        81: begin StartPlayAudio(ExpandConstant('julian.mp3')); end;
        82: begin StartPlayAudio(ExpandConstant('kobitki.mp3')); end;
        83: begin StartPlayAudio(ExpandConstant('pingwiny.mp3')); end;
        84: begin StartPlayAudio(ExpandConstant('pancerni.mp3')); end;
        85: begin StartPlayAudio(ExpandConstant('old_crew.mp3')); end;
        86: begin StartPlayAudio(ExpandConstant('Vito.mp3')); end;
        87: begin StartPlayAudio(ExpandConstant('Wiedzmin.mp3')); end;
        //88 EN
        89: begin StartPlayAudio(ExpandConstant('team_fortress.mp3')); end;
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

    if IsComponentSelected(Component) then
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
var
    FileName : String;
begin
    if CurStep = ssPostInstall then
    begin
        CopyAndUnZip('S\PL\Bomba',                      'BombaBlokEkipa');
        CopyAndUnZip('S\PL\Julian',                     'KrolJulian');
        CopyAndUnZip('S\PL\Kobitki',                    'Kobitki');
        CopyAndUnZip('S\PL\Pingwiny',                   'PingwinyPrzyjaciele');
        CopyAndUnZip('S\PL\Pancerni',                   'Pancerni');
        CopyAndUnZip('S\PL\OldCrewSounds',              'OldCrew_0.6.7');
        CopyAndUnZip('S\PL\Vito',                       'CrewSoundsByVito');
        CopyAndUnZip('S\PL\Wiedzmin',                   'Wiedzmin');
        CopyAndUnZip('S\PL\EN\TeamFortress',            'TeamFortress');

        CopyAndUnZip('M\StatsCounter',                      'StatsCounter');
        CopyAndUnZip('M\NewUpdateNotifier',                 'NewUpdateNotifier');
        CopyAndUnZip('M\Stat\NoXVM\Icons',                  'no_xvm_icons');
        CopyAndUnZip('M\CamoIcons',                         'CamoIcons');
        CopyAndUnZip('M\Stat\XVM',                          'xvm_config');
        CopyAndUnZip('M\Stat\XVM\Icons',                    'xvm_icons');
        CopyAndUnZip('M\Achivments',                        'Achivments');
        CopyAndUnZip('M\Stat\NoXVM\ClockInHangar',          'ClockInHangar');
        CopyAndUnZip('M\Stat\NoXVM\AutoEquip',              'AutoEquip');
        CopyAndUnZip('M\Stat\NoXVM\Battle',                 'Battle_Observer');
        CopyAndUnZip('M\Stat\NoXVM\WotlabPlayersRankings',  'WotlabPlayersRankings');
        CopyAndUnZip('M\CamoSelector',                      'CamoSelector');
        CopyAndUnZip('M\ConsumablesPanel',                  'ConsumablesPanel');
        CopyAndUnZip('M\CrewExt',                           'Crew_Extended');
        CopyAndUnZip('M\DamagePanel\Inner',                 'Inner');
        CopyAndUnZip('M\DamagePanel\Outer',                 'Outer');
        CopyAndUnZip('M\DamagePanel\Turtle_a',              'Turtle_a');
        CopyAndUnZip('M\DamagePanel\Turtle_b',              'Turtle_b');
        CopyAndUnZip('M\Oldskools',                         'FriendsMarkerOldSkools');
        CopyAndUnZip('M\KKK',                               'KKK');
        CopyAndUnZip('M\MapRotation',                       'MapRotation');
        CopyAndUnZip('M\MarksOnGun',                        'MarksOnGun');
        CopyAndUnZip('M\PaintBall',                         'PaintBall');
        CopyAndUnZip('M\RI_Niko',                           'RI_Niko');
        CopyAndUnZip('M\Safeshot',                          'Safeshot');
        CopyAndUnZip('M\TankXPExt',                         'Tank_XP_Extended');

        // RajCeL's
        CopyAndUnZip('M\RaJCeL\inBattleStatistics',         'inBattleStatistics');
        CopyAndUnZip('M\RaJCeL\FriendNotifier_RaJCeL',      'FriendNotifier_RaJCeL');
        CopyAndUnZip('M\RaJCeL\ShellInfo',                  'ShellInfo_RaJCeL');
        CopyAndUnZip('M\RaJCeL\onBattleResultsStatistics',  'onBattleResultsStatistics');
        CopyAndUnZip('M\RaJCeL\singleListParams',           'singleListParams');
        CopyAndUnZip('M\RaJCeL\changeSilhouetteColors',     'changeSilhouetteColors');
        // RajCeL's

        CopyAndUnZip('M\Stat\XVM\GoldFreeXPLocker',         'xvm_config_locked');
        CopyAndUnZip('M\Stat\XVM\NoStats',                  'xvm_config_nostats');
        CopyAndUnZip('M\Stat\XVM\wotlabs',                  'xvm_config_wotlabs');

        // Crosshairs
        CopyAndUnZip('M\Crosshairs\Achilles',           'Achilles');
        CopyAndUnZip('M\Crosshairs\Deegie',             'Deegie');
        CopyAndUnZip('M\Crosshairs\Harpoon',            'Harpoon');
        CopyAndUnZip('M\Crosshairs\J1mB0',              'J1mB0');
        CopyAndUnZip('M\Crosshairs\KellermanBlue',      'KellermanBlue');
        CopyAndUnZip('M\Crosshairs\Mjolnir',            'Mjolnir');
        CopyAndUnZip('M\Crosshairs\Staple',             'Staple');
        CopyAndUnZip('M\Crosshairs\WhiteMini2',         'WhiteMini2');
        CopyAndUnZip('M\Crosshairs\Combo',              'Combo');

        CopyAndUnZip('M\Crosshairs\ShellTravelTimeSPG', 'ShellTravelTimeSPG');
        // YasenKrasen
        CopyAndUnZip('M\SS\YK\Base',                    'YK_Base');
        CopyAndUnZip('M\SS\YK\Core',                    'YK_Core');
        CopyAndUnZip('M\SS\YK\Vanilla',                 'YK_Vanilla');
        CopyAndUnZip('M\SS\YK\Graph',                   'YK_Graphical');
        CopyAndUnZip('M\SS\YK\BG\V1',                   'YK_V1');
        CopyAndUnZip('M\SS\YK\BG\V2',                   'YK_V2');
        CopyAndUnZip('M\SS\YK\BG\V3',                   'YK_V3');
        CopyAndUnZip('M\SS\YK\BG\V4',                   'YK_V4');
        CopyAndUnZip('M\SS\YK\BG\V5',                   'YK_V5');

        // HangMan
        CopyAndUnZip('M\HangMan',                       'HangMan');

        // Tomonik Stats
        CopyAndUnZip('M\SS\Tomonik_stats',              'Tomonik_stats');

        // Replacing options
        InitModOptionsTable;

        FileName := ExpandConstant('{app}\mods\configs\yk-stats\config.json');
        SetModOptions(FileName, 'M\SS\YK\dailyAutoResetEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\useParametersPanelEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\panelParametersEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\panelStatisticsEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\panelByTankEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\panelCurrentVehicleEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\researchWD\researchWatchdogEnable');
        SetModOptions(FileName, 'M\SS\YK\ParamPanel\researchWD\useFreeXpEnable');

        
        FileName := ExpandConstant('{app}\mods\configs\rajcel\inBattleStatistics\highCaliber.json');
        SetModOptions(FileName, 'M\RaJCeL\inBattleStatistics\rajcelHighCaliberEnable');

        FileName := ExpandConstant('{app}\res_mods\configs\xvm\Automatyk\hangar.xc');
        SetModOptions(FileName, 'M\Stat\XVM\hangar\GoldFreeXPLockerEnable');

        FileName := ExpandConstant('{app}\res_mods\configs\xvm\Automatyk\widgetsTemplates.xc');
        SetModOptions(FileName, 'M\Stat\XVM\hangar\NoStatsEnable');

        FileName := ExpandConstant('{app}\res_mods\configs\xvm\Automatyk\login.xc');
        SetModOptions(FileName, 'M\Stat\XVM\saveLastServerEnable');
        SetModOptions(FileName, 'M\Stat\XVM\autologinEnable');
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