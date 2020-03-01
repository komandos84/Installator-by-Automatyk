[Code]

const
    SHCONTCH_NOPROGRESSBOX = 4;
    SHCONTCH_RESPONDYESTOALL = 16;

procedure UnZip(ZipPath, TargetPath: string);
var
    Shell: Variant;
    ZipFile: Variant;
    TargetFolder: Variant;
begin
    Shell := CreateOleObject('Shell.Application');
    ZipFile := Shell.NameSpace(ZipPath);

    if VarIsClear(ZipFile) then
        RaiseException(Format('ZIP file "%s" does not exist or cannot be opened', [ZipPath]));

    TargetFolder := Shell.NameSpace(TargetPath);
    if VarIsClear(TargetFolder) then
        RaiseException(Format('Target path "%s" does not exist', [TargetPath]));

    TargetFolder.CopyHere(ZipFile.Items, SHCONTCH_NOPROGRESSBOX or SHCONTCH_RESPONDYESTOALL);
end;