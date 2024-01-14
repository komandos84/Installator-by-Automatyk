; -- Components.iss --

[Types]
Name: "custom"; Description: "{cm:own_install}"; Flags: iscustom
Name: "null";   Description: "{cm:clear_all}";

[Components]
Name: "S";                       Description: "{cm:crew_sounds_pl}";
Name: "S\Bomba";                 Description: "Kapitan Bomba & Blok ekipa";      Flags: exclusive    fixed
Name: "S\Julian";                Description: "Król Julian";                     Flags: exclusive
Name: "S\Kobitki";               Description: "¯eñska za³oga";                   Flags: exclusive
Name: "S\Pingwiny";              Description: "Pingwiny & Przyjaciele";          Flags: exclusive
Name: "S\Pancerni";              Description: "Czterej pancerni i pies";         Flags: exclusive
Name: "S\OldCrewSounds";         Description: "Stare dŸwiêki za³ogi - 0.6.7+";   Flags: exclusive
Name: "S\Vito";                  Description: "DŸwiêki by vito74m";              Flags: exclusive
Name: "S\Wiedzmin";              Description: "WiedŸmin";                        Flags: exclusive
;Name: "S";                       Description: "{cm:crew_sounds_en}";             Flags: exclusive
Name: "S\TeamFortress";          Description: "Heavy - Team Fortress";           Flags: exclusive

[Files]

Source: "{app}\__ModsCache\BombaBlokEkipa.zip";         DestDir: "{app}\__ModsCache"; Components: S\Bomba; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\BombaBlokEkipa.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/BombaBlokEkipa.zip', '{#MyAppName}', 'Get', 10206732, 0 );

Source: "{app}\__ModsCache\KrolJulian.zip";             DestDir: "{app}\__ModsCache"; Components: S\Julian; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\KrolJulian.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/KrolJulian.zip', '{#MyAppName}', 'Get', 3680218, 0 );

Source: "{app}\__ModsCache\Kobitki.zip";                DestDir: "{app}\__ModsCache"; Components: S\Kobitki; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Kobitki.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/Kobitki.zip', '{#MyAppName}', 'Get', 1451750, 0 );

Source: "{app}\__ModsCache\PingwinyPrzyjaciele.zip";    DestDir: "{app}\__ModsCache"; Components: S\Pingwiny; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\PingwinyPrzyjaciele.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/PingwinyPrzyjaciele.zip', '{#MyAppName}', 'Get', 3775411, 0 );

Source: "{app}\__ModsCache\Pancerni.zip";               DestDir: "{app}\__ModsCache"; Components: S\Pancerni; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Pancerni.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/Pancerni.zip', '{#MyAppName}', 'Get', 5101660, 0 );

Source: "{app}\__ModsCache\OldCrew_0.6.7.zip";          DestDir: "{app}\__ModsCache"; Components: S\OldCrewSounds; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\OldCrew_0.6.7.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/OldCrew_0.6.7.zip', '{#MyAppName}', 'Get', 4028743, 0 );

Source: "{app}\__ModsCache\CrewSoundsByVito.zip";       DestDir: "{app}\__ModsCache"; Components: S\Vito; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\CrewSoundsByVito.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/CrewSoundsByVito.zip', '{#MyAppName}', 'Get', 16731146, 0 );

Source: "{app}\__ModsCache\Wiedzmin.zip";       DestDir: "{app}\__ModsCache"; Components: S\Wiedzmin; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Wiedzmin.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/Wiedzmin.zip', '{#MyAppName}', 'Get',  3402405, 0 );

Source: "{app}\__ModsCache\TeamFortress.zip";           DestDir: "{app}\__ModsCache"; Components: S\TeamFortress; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\TeamFortress.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/TeamFortress.zip', '{#MyAppName}', 'Get', 2149585, 0 );

; StatsCounter
;Source: "{app}\__ModsCache\StatsCounter.zip";         DestDir: "{app}\__ModsCache"; Components: M\StatsCounter; \
;     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\StatsCounter.zip'), \
;    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/StatsCounter/StatsCounter.zip', '{#MyAppName}', 'Get', 5154, 0 );