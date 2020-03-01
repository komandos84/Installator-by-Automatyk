; -- Components.iss --

[Types]
Name: "custom"; Description: "{cm:own_install}"; Flags: iscustom
Name: "null";   Description: "{cm:clear_all}";

[Components]
; Mods
Name: "M";      Description: "{cm:mods}";
Name: "M\StatsCounter";                 Description: "{cm:stats_counter}";                      Flags: exclusive fixed    
Name: "M\NewUpdateNotifier";            Description: "{cm:new_update_notifier}";                Flags: fixed exclusive
; XVM
Name: "M\Stat";                                     Description: "{cm:add_stats_module}";
Name: "M\Stat\XVM";                                 Description: "{cm:xvm_version} v8.3.1.22";                 Flags: exclusive
Name: "M\Stat\XVM\hangar";                          Description: "{cm:hangar_section}";
Name: "M\Stat\XVM\hangar\GoldFreeXPLockerEnable";   Description: "{cm:block_gold_freeXP}";
Name: "M\Stat\XVM\hangar\NoStatsEnable";            Description: "{cm:disable_stats_in_garage}";
Name: "M\Stat\XVM\Icons";                   Description: "{cm:tank_icons}";
Name: "M\Stat\XVM\saveLastServerEnable";    Description: "{cm:saveLastServerEnable}";
Name: "M\Stat\XVM\autologinEnable";         Description: "{cm:autologinEnable}";
Name: "M\Stat\XVM\wotlabs";                 Description: "{cm:wotlabs_colors}";                     Flags: fixed exclusive

Name: "M\Stat\NoXVM";                       Description: "{cm:without_xvm}";                        Flags: exclusive
Name: "M\Stat\NoXVM\ClockInHangar";         Description: "{cm:clock_in_hangar}";                        
Name: "M\Stat\NoXVM\Icons";                 Description: "{cm:tank_icons}"
Name: "M\Stat\NoXVM\AutoEquip";             Description: "{cm:autoequip}";
Name: "M\Stat\NoXVM\Battle";                Description: "{cm:battle_observer} v1.26.5 v1.7.1.2";
Name: "M\Stat\NoXVM\WotlabPlayersRankings"; Description: "{cm:WotlabPlayersRankings} v1.4.0";


Name: "M\Safeshot";                     Description: "{cm:safeshot}";
Name: "M\MapRotation";                  Description: "{cm:map_rotation}";                       Flags: fixed exclusive
Name: "M\TankXPExt";                    Description: "{cm:exp_counter}";
Name: "M\CrewExt";                      Description: "{cm:crew_ext}";

Name: "M\CamoIcons";                    Description: "{cm:camo_icon}";

Name: "M\KKK";                          Description: "{cm:kkk}";

; Rozszerzone informacje
Name: "M\RI_Niko";                      Description: "{cm:niko}";                   Flags: fixed exclusive 
Name: "M\CamoSelector";                 Description: "{cm:camo_selector}";

; RaJCeL
Name: "M\RaJCeL";                                                   Description: "{cm:rajcel}";
Name: "M\RaJCeL\inBattleStatistics";                                Description: "{cm:rajcel_wn8}";
Name: "M\RaJCeL\inBattleStatistics\rajcelHighCaliberEnable";        Description: "{cm:rajcel_highCaliber}";
Name: "M\RaJCeL\FriendNotifier_RaJCeL";                             Description: "{cm:rajcel_notifier}";
Name: "M\RaJCeL\ShellInfo";                                         Description: "{cm:rajcel_shell_info}";
Name: "M\RaJCeL\onBattleResultsStatistics";                         Description: "{cm:rajcel_Stats}";
Name: "M\RaJCeL\singleListParams";                                  Description: "{cm:rajcel_singleListParams}";
Name: "M\RaJCeL\changeSilhouetteColors";                            Description: "{cm:rajcel_changeSilhouetteColors}";

; Oldskools
Name: "M\Oldskools";                    Description: "{cm:oldskool_marker}";

; PaintBall
Name: "M\PaintBall";                    Description: "{cm:paint_ball}";

;MarksOnGunExtended
Name: "M\MarksOnGun";                   Description: "{cm:marks_gun}";

; Statystyki sesji PL
Name: "M\SS";                           Description: "{cm:session_stats}";

; Staty by YasenKrasen
Name: "M\SS\YK";                                        Description: "{cm:yk_stats} 1.7.0.2";   Flags: exclusive
Name: "M\SS\YK\Core";                                   Description: "{cm:yk_core}";            Flags: exclusive
Name: "M\SS\YK\Vanilla";                                Description: "{cm:yk_vanilla}";         Flags: exclusive
Name: "M\SS\YK\Base";                                   Description: "{cm:yk_base}";            Flags: exclusive
Name: "M\SS\YK\BG";                                     Description: "{cm:yk_background}";
Name: "M\SS\YK\BG\V1";                                  Description: "V1";                      Flags: exclusive
Name: "M\SS\YK\BG\V2";                                  Description: "V2";                      Flags: exclusive
Name: "M\SS\YK\BG\V3";                                  Description: "V3";                      Flags: exclusive
Name: "M\SS\YK\BG\V4";                                  Description: "V4";                      Flags: exclusive
Name: "M\SS\YK\BG\V5";                                  Description: "V5";                      Flags: exclusive
Name: "M\SS\YK\Graph";                                  Description: "{cm:yk_graphical}";

Name: "M\SS\YK\dailyAutoResetEnable";                               Description: "{cm:yk_daily_auto_reset}";
Name: "M\SS\YK\ParamPanel";                                         Description: "{cm:yk_param}";
Name: "M\SS\YK\ParamPanel\useParametersPanelEnable";                Description: "{cm:yk_param_panel}";
Name: "M\SS\YK\ParamPanel\panelParametersEnable";                   Description: "{cm:yk_vehicle_param}";
Name: "M\SS\YK\ParamPanel\panelStatisticsEnable";                   Description: "{cm:yk_account_stat}";
Name: "M\SS\YK\ParamPanel\panelByTankEnable";                       Description: "{cm:yk_stat_by_tank}";
Name: "M\SS\YK\ParamPanel\panelCurrentVehicleEnable";               Description: "{cm:yk_Vehicle_stat}";
Name: "M\SS\YK\ParamPanel\researchWD";                              Description: "{cm:yk_researchWD}";
Name: "M\SS\YK\ParamPanel\researchWD\researchWatchdogEnable";       Description: "{cm:yk_watchdog}";
Name: "M\SS\YK\ParamPanel\researchWD\useFreeXpEnable";              Description: "{cm:yk_watchdog_use_freeXP}";

; Staty by Tomonik
Name: "M\SS\Tomonik_stats";                 Description: "{cm:tomonik_stats} 1.6.1.0";   Flags: fixed exclusive


; crosshairs
Name: "M\Crosshairs";                       Description: "{cm:crosshairs}";
Name: "M\Crosshairs\J1mB0";                 Description: "J1mB0";                       Flags: exclusive
Name: "M\Crosshairs\Harpoon";               Description: "Harpoon";                     Flags: exclusive
Name: "M\Crosshairs\Deegie";                Description: "Deegie";                      Flags: exclusive
Name: "M\Crosshairs\Achilles";              Description: "Achilles";                    Flags: exclusive
Name: "M\Crosshairs\Mjolnir";               Description: "Mjolnir";                     Flags: exclusive
Name: "M\Crosshairs\KellermanBlue";         Description: "Kellerman Blue";              Flags: exclusive
Name: "M\Crosshairs\Staple";                Description: "Staple";                      Flags: exclusive
Name: "M\Crosshairs\WhiteMini2";            Description: "White Mini 2";                Flags: exclusive
Name: "M\Crosshairs\Combo";                 Description: "Combo";                       Flags: exclusive
Name: "M\Crosshairs\ShellTravelTimeSPG";    Description: "{cm:shell_travel_time_spg}";

; DamagePanel
Name: "M\DamagePanel";                  Description: "{cm:damage_panels}";
Name: "M\DamagePanel\Inner";            Description: "{cm:damage_panel} Inner";     Flags: exclusive
Name: "M\DamagePanel\Outer";            Description: "{cm:damage_panel} Outer";     Flags: exclusive
Name: "M\DamagePanel\Turtle_a";         Description: "Turtle v1";                   Flags: exclusive
Name: "M\DamagePanel\Turtle_b";         Description: "Turtle v2";                   Flags: exclusive

; consumables Panel
Name: "M\ConsumablesPanel";             Description: "{cm:cons_panel}";             Flags: fixed exclusive

; Hangar
Name: "M\HangMan";                      Description: "{cm:HangMan} v2.45";

; Achivments
Name: "M\Achivments";                   Description: "{cm:achiv_in_battle}";

; Sounds
Name: "S\PL";                           Description: "{cm:crew_sounds_pl}";
Name: "S\PL\Bomba";                     Description: "Kapitan Bomba & Blok ekipa";      Flags: exclusive    fixed
Name: "S\PL\Julian";                    Description: "Król Julian";                     Flags: exclusive
Name: "S\PL\Kobitki";                   Description: "¯eñska za³oga";                   Flags: exclusive
Name: "S\PL\Pingwiny";                  Description: "Pingwiny & Przyjaciele";          Flags: exclusive
Name: "S\PL\Pancerni";                  Description: "Czterej pancerni i pies";         Flags: exclusive
Name: "S\PL\OldCrewSounds";             Description: "Stare dŸwiêki za³ogi - 0.6.7+";   Flags: exclusive
Name: "S\PL\Vito";                      Description: "DŸwiêki by vito74m";              Flags: exclusive
Name: "S\PL\Wiedzmin";                  Description: "WiedŸmin";                        Flags: exclusive
Name: "S\PL\EN";                        Description: "{cm:crew_sounds_en}";             Flags: exclusive
Name: "S\PL\EN\TeamFortress";           Description: "Heavy - Team Fortress";           Flags: exclusive

[Files]

Source: "{app}\__ModsCache\BombaBlokEkipa.zip";         DestDir: "{app}\__ModsCache"; Components: S\PL\Bomba; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\BombaBlokEkipa.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/BombaBlokEkipa.zip', '{#MyAppName}', 'Get', 10206732, 0 );

Source: "{app}\__ModsCache\KrolJulian.zip";             DestDir: "{app}\__ModsCache"; Components: S\PL\Julian; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\KrolJulian.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/KrolJulian.zip', '{#MyAppName}', 'Get', 3680218, 0 );

Source: "{app}\__ModsCache\Kobitki.zip";                DestDir: "{app}\__ModsCache"; Components: S\PL\Kobitki; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Kobitki.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/Kobitki.zip', '{#MyAppName}', 'Get', 1451750, 0 );

Source: "{app}\__ModsCache\PingwinyPrzyjaciele.zip";    DestDir: "{app}\__ModsCache"; Components: S\PL\Pingwiny; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\PingwinyPrzyjaciele.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/PingwinyPrzyjaciele.zip', '{#MyAppName}', 'Get', 3775411, 0 );

Source: "{app}\__ModsCache\Pancerni.zip";               DestDir: "{app}\__ModsCache"; Components: S\PL\Pancerni; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Pancerni.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/Pancerni.zip', '{#MyAppName}', 'Get', 5101660, 0 );

Source: "{app}\__ModsCache\OldCrew_0.6.7.zip";          DestDir: "{app}\__ModsCache"; Components: S\PL\OldCrewSounds; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\OldCrew_0.6.7.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/OldCrew_0.6.7.zip', '{#MyAppName}', 'Get', 4028743, 0 );

Source: "{app}\__ModsCache\CrewSoundsByVito.zip";       DestDir: "{app}\__ModsCache"; Components: S\PL\Vito; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\CrewSoundsByVito.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/CrewSoundsByVito.zip', '{#MyAppName}', 'Get', 16731146, 0 );

Source: "{app}\__ModsCache\Wiedzmin.zip";       DestDir: "{app}\__ModsCache"; Components: S\PL\Wiedzmin; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Wiedzmin.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/Wiedzmin.zip', '{#MyAppName}', 'Get',  3402405, 0 );

Source: "{app}\__ModsCache\TeamFortress.zip";           DestDir: "{app}\__ModsCache"; Components: S\PL\EN\TeamFortress; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\TeamFortress.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Sounds/TeamFortress.zip', '{#MyAppName}', 'Get', 2149585, 0 );

; StatsCounter
Source: "{app}\__ModsCache\StatsCounter.zip";         DestDir: "{app}\__ModsCache"; Components: M\StatsCounter; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\StatsCounter.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/StatsCounter/StatsCounter.zip', '{#MyAppName}', 'Get', 5154, 0 );

; NewUpdateNotifier
Source: "{app}\__ModsCache\NewUpdateNotifier.zip";         DestDir: "{app}\__ModsCache"; Components: M\NewUpdateNotifier; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\NewUpdateNotifier.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/NewUpdateNotifier/NewUpdateNotifier.zip', '{#MyAppName}', 'Get', 7264, 0 );

; CamoIcons
Source: "{app}\__ModsCache\CamoIcons.zip";         DestDir: "{app}\__ModsCache"; Components: M\CamoIcons; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\CamoIcons.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/CamoIcons/CamoIcons.zip', '{#MyAppName}', 'Get', 31616877, 0 );

; xvm config
Source: "{app}\__ModsCache\xvm_config.zip";               DestDir: "{app}\__ModsCache"; Components: M\Stat\XVM; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\xvm_config.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/xvm/xvm_config/xvm_config.zip', '{#MyAppName}', 'Get', 8754229, 0 );

Source: "{app}\__ModsCache\xvm_icons.zip";     DestDir: "{app}\__ModsCache"; Components: M\Stat\XVM\Icons; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\xvm_icons.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/xvm/xvm_icons/xvm_icons.zip', '{#MyAppName}', 'Get', 24816961, 0 );

; Tanks icons without xvm
Source: "{app}\__ModsCache\no_xvm_icons.zip";      DestDir: "{app}\__ModsCache"; Components: M\Stat\NoXVM\Icons; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\no_xvm_icons.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/no_xvm_icons/no_xvm_icons.zip', '{#MyAppName}', 'Get', 28825533, 0 );

; Achivments
Source: "{app}\__ModsCache\Achivments.zip";        DestDir: "{app}\__ModsCache"; Components: M\Achivments; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Achivments.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Achivments/Achivments.zip', '{#MyAppName}', 'Get', 1879275, 0 );

Source: "{app}\__ModsCache\AutoEquip.zip";         DestDir: "{app}\__ModsCache"; Components: M\Stat\NoXVM\AutoEquip; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\AutoEquip.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/AutoEquip/AutoEquip.zip', '{#MyAppName}', 'Get', 19718, 0 );

Source: "{app}\__ModsCache\Battle_Observer.zip";    DestDir: "{app}\__ModsCache"; Components: M\Stat\NoXVM\Battle; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Battle_Observer.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Battle_Observer/Battle_Observer.zip', '{#MyAppName}', 'Get', 629398, 0 );

Source: "{app}\__ModsCache\WotlabPlayersRankings.zip";    DestDir: "{app}\__ModsCache"; Components: M\Stat\NoXVM\WotlabPlayersRankings; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\WotlabPlayersRankings.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Battle_Observer/WotlabPlayersRankings.zip', '{#MyAppName}', 'Get', 629398, 0 );

Source: "{app}\__ModsCache\CamoSelector.zip";      DestDir: "{app}\__ModsCache"; Components: M\CamoSelector; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\CamoSelector.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/CamoSelector/CamoSelector.zip', '{#MyAppName}', 'Get', 43186, 0 );

; consumables Panel
Source: "{app}\__ModsCache\ConsumablesPanel.zip";  DestDir: "{app}\__ModsCache"; Components: M\ConsumablesPanel; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\ConsumablesPanel.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/ConsumablesPanel/ConsumablesPanel.zip', '{#MyAppName}', 'Get', 308703, 0 );

Source: "{app}\__ModsCache\Crew_Extended.zip";      DestDir: "{app}\__ModsCache"; Components: M\CrewExt; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Crew_Extended.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crew_Extended/Crew_Extended.zip', '{#MyAppName}', 'Get', 177560, 0 );

; DamagePanel
Source: "{app}\__ModsCache\Inner.zip";                  DestDir: "{app}\__ModsCache"; Components: M\DamagePanel\Inner; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Inner.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/DamagePanel/Inner/Inner.zip', '{#MyAppName}', 'Get', 496877, 0 );

Source: "{app}\__ModsCache\Outer.zip";                  DestDir: "{app}\__ModsCache"; Components: M\DamagePanel\Outer; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Outer.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/DamagePanel/Outer/Outer.zip', '{#MyAppName}', 'Get', 489371, 0 );

Source: "{app}\__ModsCache\Turtle_a.zip";                  DestDir: "{app}\__ModsCache"; Components: M\DamagePanel\Turtle_a; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Turtle_a.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/DamagePanel/Turtle_a/Turtle_a.zip', '{#MyAppName}', 'Get', 454939, 0 );

Source: "{app}\__ModsCache\Turtle_b.zip";                  DestDir: "{app}\__ModsCache"; Components: M\DamagePanel\Turtle_b; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Turtle_b.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/DamagePanel/Turtle_b/Turtle_b.zip', '{#MyAppName}', 'Get', 474048, 0 );

; Oldskools
Source: "{app}\__ModsCache\FriendsMarkerOldSkools.zip";          DestDir: "{app}\__ModsCache"; Components: M\Oldskools; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\FriendsMarkerOldSkools.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/FriendsMarkerOldSkools/FriendsMarkerOldSkools.zip', '{#MyAppName}', 'Get', 35023, 0 );

Source: "{app}\__ModsCache\KKK.zip";                    DestDir: "{app}\__ModsCache"; Components: M\KKK; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\KKK.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/KKK/KKK.zip', '{#MyAppName}', 'Get', 424342, 0 );

Source: "{app}\__ModsCache\MapRotation.zip";        DestDir: "{app}\__ModsCache"; Components: M\MapRotation; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\MapRotation.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/MapRotation/MapRotation.zip', '{#MyAppName}', 'Get', 37949, 0 );

; MarksOnGunExtended
Source: "{app}\__ModsCache\MarksOnGun.zip";              DestDir: "{app}\__ModsCache"; Components: M\MarksOnGun; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\MarksOnGun.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/MarksOnGun/MarksOnGun.zip', '{#MyAppName}', 'Get', 323161, 0 );

; Paint Ball
Source: "{app}\__ModsCache\PaintBall.zip";              DestDir: "{app}\__ModsCache"; Components: M\PaintBall; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\PaintBall.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/PaintBall/PaintBall.zip', '{#MyAppName}', 'Get', 200742, 0 );

Source: "{app}\__ModsCache\RI_Niko.zip";                DestDir: "{app}\__ModsCache"; Components: M\RI_Niko; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\RI_Niko.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RI_Niko/RI_Niko.zip', '{#MyAppName}', 'Get', 80140, 0 );

Source: "{app}\__ModsCache\Safeshot.zip";               DestDir: "{app}\__ModsCache"; Components: M\Safeshot; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Safeshot.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Safeshot/Safeshot.zip', '{#MyAppName}', 'Get', 221646, 0 );

Source: "{app}\__ModsCache\Tank_XP_Extended.zip";            DestDir: "{app}\__ModsCache"; Components: M\TankXPExt; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Tank_XP_Extended.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Tank_XP_Extended/Tank_XP_Extended.zip', '{#MyAppName}', 'Get', 247758, 0 );

; RaJCeL
Source: "{app}\__ModsCache\inBattleStatistics.zip";                DestDir: "{app}\__ModsCache"; Components: M\RaJCeL\inBattleStatistics; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\inBattleStatistics.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RaJCeL/inBattleStatistics/inBattleStatistics.zip', '{#MyAppName}', 'Get', 219416, 0 );

Source: "{app}\__ModsCache\FriendNotifier_RaJCeL.zip";     DestDir: "{app}\__ModsCache"; Components: M\RaJCeL\FriendNotifier_RaJCeL; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\FriendNotifier_RaJCeL.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RaJCeL/FriendNotifier_RaJCeL/FriendNotifier_RaJCeL.zip', '{#MyAppName}', 'Get', 60679, 0 );

Source: "{app}\__ModsCache\ShellInfo_RaJCeL.zip";          DestDir: "{app}\__ModsCache"; Components: M\RaJCeL\ShellInfo; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\ShellInfo_RaJCeL.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RaJCeL/ShellInfo_RaJCeL/ShellInfo_RaJCeL.zip', '{#MyAppName}', 'Get', 18746, 0 );

Source: "{app}\__ModsCache\onBattleResultsStatistics.zip";          DestDir: "{app}\__ModsCache"; Components: M\RaJCeL\onBattleResultsStatistics; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\onBattleResultsStatistics.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RaJCeL/onBattleResultsStatistics/onBattleResultsStatistics.zip', '{#MyAppName}', 'Get',  49490, 0 );

Source: "{app}\__ModsCache\singleListParams.zip";          DestDir: "{app}\__ModsCache"; Components: M\RaJCeL\singleListParams; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\singleListParams.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RaJCeL/singleListParams/singleListParams.zip', '{#MyAppName}', 'Get',  34540, 0 );

Source: "{app}\__ModsCache\changeSilhouetteColors.zip";          DestDir: "{app}\__ModsCache"; Components: M\RaJCeL\changeSilhouetteColors; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\changeSilhouetteColors.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/RaJCeL/changeSilhouetteColors/changeSilhouetteColors.zip', '{#MyAppName}', 'Get',  30636, 0 );

; RaJCeL

Source: "{app}\__ModsCache\xvm_config_wotlabs.zip";     DestDir: "{app}\__ModsCache"; Components: M\Stat\XVM\wotlabs; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\xvm_config_wotlabs.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/xvm/xvm_config_wotlabs/xvm_config_wotlabs.zip', '{#MyAppName}', 'Get', 21844, 0 );

; Crosshairs
Source: "{app}\__ModsCache\Achilles.zip";               DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\Achilles; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Achilles.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/Achilles.zip', '{#MyAppName}', 'Get', 614424, 0 );

Source: "{app}\__ModsCache\Deegie.zip";                 DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\Deegie; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Deegie.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/Deegie.zip', '{#MyAppName}', 'Get', 1070916, 0 );

Source: "{app}\__ModsCache\Harpoon.zip";                DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\Harpoon; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Harpoon.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/Harpoon.zip', '{#MyAppName}', 'Get', 805926, 0 );

Source: "{app}\__ModsCache\J1mB0.zip";                  DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\J1mB0; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\J1mB0.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/J1mB0.zip', '{#MyAppName}', 'Get', 1147782, 0 );

Source: "{app}\__ModsCache\KellermanBlue.zip";          DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\KellermanBlue; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\KellermanBlue.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/KellermanBlue.zip', '{#MyAppName}', 'Get', 936223, 0 );

Source: "{app}\__ModsCache\Mjolnir.zip";                DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\Mjolnir; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Mjolnir.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/Mjolnir.zip', '{#MyAppName}', 'Get', 849709, 0 );

Source: "{app}\__ModsCache\Staple.zip";                 DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\Staple; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Staple.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/Staple.zip', '{#MyAppName}', 'Get', 653413, 0 );

Source: "{app}\__ModsCache\WhiteMini2.zip";             DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\WhiteMini2; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\WhiteMini2.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/WhiteMini2.zip', '{#MyAppName}', 'Get', 669871, 0 );

Source: "{app}\__ModsCache\Combo.zip";             DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\Combo; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Combo.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Crosshairs/Combo.zip', '{#MyAppName}', 'Get', 709770, 0 );

Source: "{app}\__ModsCache\ShellTravelTimeSPG.zip";             DestDir: "{app}\__ModsCache"; Components: M\Crosshairs\ShellTravelTimeSPG; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\ShellTravelTimeSPG.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/ShellTravelTimeSPG/ShellTravelTimeSPG.zip', '{#MyAppName}', 'Get', 254185, 0 );

; Yasen Krasen
Source: "{app}\__ModsCache\YK_Base.zip";                   DestDir: "{app}\__ModsCache"; Components: M\SS\YK\Base; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_Base.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_Base.zip', '{#MyAppName}', 'Get', 1017352, 0 );

Source: "{app}\__ModsCache\YK_Core.zip";                   DestDir: "{app}\__ModsCache"; Components: M\SS\YK\Core; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_Core.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_Core.zip', '{#MyAppName}', 'Get', 1017352, 0 );

Source: "{app}\__ModsCache\YK_Vanilla.zip";                DestDir: "{app}\__ModsCache"; Components: M\SS\YK\Vanilla; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_Vanilla.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_Vanilla.zip', '{#MyAppName}', 'Get', 1381717, 0 );

Source: "{app}\__ModsCache\YK_Graphical.zip";              DestDir: "{app}\__ModsCache"; Components: M\SS\YK\Graph; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_Graphical.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_Graphical.zip', '{#MyAppName}', 'Get', 360123, 0 );

Source: "{app}\__ModsCache\YK_V1.zip";  DestDir: "{app}\__ModsCache"; Components: M\SS\YK\BG\V1; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_V1.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_V1.zip', '{#MyAppName}', 'Get', 419202, 0 );

Source: "{app}\__ModsCache\YK_V2.zip";  DestDir: "{app}\__ModsCache"; Components: M\SS\YK\BG\V2; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_V2.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_V2.zip', '{#MyAppName}', 'Get', 535768, 0 );

Source: "{app}\__ModsCache\YK_V3.zip";  DestDir: "{app}\__ModsCache"; Components: M\SS\YK\BG\V3; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_V3.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_V3.zip', '{#MyAppName}', 'Get', 404135, 0 );

Source: "{app}\__ModsCache\YK_V4.zip";  DestDir: "{app}\__ModsCache"; Components: M\SS\YK\BG\V4; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_V4.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_V4.zip', '{#MyAppName}', 'Get', 1396449, 0 );

Source: "{app}\__ModsCache\YK_V5.zip";  DestDir: "{app}\__ModsCache"; Components: M\SS\YK\BG\V5; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\YK_V5.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/YasenKrasen/YK_V5.zip', '{#MyAppName}', 'Get', 1908675, 0 );

; Tomonik
Source: "{app}\__ModsCache\Tomonik_stats.zip";  DestDir: "{app}\__ModsCache"; Components: M\SS\Tomonik_stats; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\Tomonik_stats.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/Tomonik_stats/Tomonik_stats.zip', '{#MyAppName}', 'Get', 592169, 0 );

; HangMan
Source: "{app}\__ModsCache\HangMan.zip";  DestDir: "{app}\__ModsCache"; Components: M\HangMan; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\HangMan.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/HangMan/HangMan.zip', '{#MyAppName}', 'Get', 322165, 0 );

; ClockInHangar
Source: "{app}\__ModsCache\ClockInHangar.zip";  DestDir: "{app}\__ModsCache"; Components: M\Stat\NoXVM\ClockInHangar; \
     Flags: external; Check: DwinsHs_Check(ExpandConstant('{app}\__ModsCache\ClockInHangar.zip'), \
    'https://github.com/komandos84/Installator-by-Automatyk/raw/master/Installer%20source/Mods/ClockInHangar/ClockInHangar.zip', '{#MyAppName}', 'Get', 458179, 0 );