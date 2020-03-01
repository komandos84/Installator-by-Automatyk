[Code]

const
    MaxConfigMods = 20;

type
    TModsOptions = record
        OptionName      : string;
        DefaultOption   : string;
        NewOption       : string;
    end;


var
    ModOptions : array [1..MaxConfigMods] of TModsOptions;


procedure InitModOptionsTable;
begin
    with ModOptions[1] do
    begin
        OptionName      := 'dailyAutoResetEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[2] do
    begin
        OptionName      := 'useParametersPanelEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[3] do
    begin
        OptionName      := 'panelParametersEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[4] do
    begin
        OptionName      := 'panelStatisticsEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[5] do
    begin
        OptionName      := 'panelByTankEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[6] do
    begin
        OptionName      := 'panelCurrentVehicleEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[7] do
    begin
        OptionName      := 'researchWatchdogEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[8] do
    begin
        OptionName      := 'useFreeXpEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[9] do
    begin
        OptionName      := 'rajcelHighCaliberEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[10] do
    begin
        OptionName      := 'GoldFreeXPLockerEnable';
        DefaultOption   := 'false';
        NewOption       := 'true';
    end;

    with ModOptions[11] do
    begin
        OptionName      := 'NoStatsEnable';
        DefaultOption   := 'true';
        NewOption       := 'false';
    end;

    with ModOptions[12] do
    begin
        OptionName      := 'saveLastServerEnable';
        DefaultOption   := 'false';
        NewOption       := 'true';
    end;

    with ModOptions[13] do
    begin
        OptionName      := 'autologinEnable';
        DefaultOption   := 'false';
        NewOption       := 'true';
    end;
end;


function ReplaceConfig(const FileName, Component, SearchString, ReplaceString, DefaultString : String): Boolean;
var
    MyFile : TStrings;
    MyText : String;
    Replace : String;
begin
    MyFile := TStringList.Create;

    try
        Result := True

        try
            MyFile.LoadFromFile(FileName);
            MyText := MyFile.Text;

            Replace := ReplaceString;
            if not IsComponentSelected(Component) then
                Replace := DefaultString;
            
            if StringChangeEx(MyText, SearchString, Replace, True) > 0 then
            begin
                MyFile.Text := MyText;
                MyFile.SaveToFile(FileName);
            end;
        except
            Result := False;
        end;
    finally
        MyFile.Free;
    end;
end;


function StrSplit(Text: String; Separator: String): String;
var
    p: Integer;
begin
    repeat
        p := Pos(Separator,Text);
        
        if p > 0 then
            Text := Copy(Text, p + Length(Separator), Length(Text));

    until p = 0;

    Result := Text;
end;


procedure SetModOptions(const FileName, Component : string);
var
    i : Integer;
    ModName : String;
begin
    ModName := StrSplit(Component, '\');

    for i := 1 to Length(ModOptions) do
    begin
        if ModOptions[i].OptionName = ModName then
            ReplaceConfig(FileName, Component, ModOptions[i].OptionName, ModOptions[i].NewOption, ModOptions[i].DefaultOption);
    end;
end;