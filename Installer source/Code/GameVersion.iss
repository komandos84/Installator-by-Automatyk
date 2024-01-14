#define BuildNumber Int(ReadIni(SourcePath + "\\buildinfo.ini", "Info", "Build", "0"))
#expr BuildNumber = BuildNumber + 1
#expr WriteIni(Sourcepath + "\\buildinfo.ini", "Info", "Build", BuildNumber)

#expr CopyFile(Sourcepath + "\\Files\\changelog.rtf", Sourcepath + "\\Output\\changelog.rtf")

#define Patch           "1.23.1.0"
#define AlphaBeta       ""
#define MyAppVersion    "1.23.1.0 #" + Str(BuildNumber) + AlphaBeta

#define MyInfoVer       "1"
#define ActData         GetDateTimeString('dd.mm.yyyy', '', '')
#define OutputExt       ""

#expr WriteIni(Sourcepath + "\\buildinfo.ini", "Info", "ActualVersion", MyInfoVer)
#expr WriteIni(Sourcepath + "\\buildinfo.ini", "Info", "DateBuild", ActData)
#expr WriteIni(Sourcepath + "\\buildinfo.ini", "Info", "TimeBuild", GetDateTimeString('tt', '', ''))
