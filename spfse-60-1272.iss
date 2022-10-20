[Setup]
AppName=SPF SourceEdit 6.0
AppVerName=SPF SourceEdit 6.0 Build 1272
AppPublisher=Command Technology Corporation
AppPublisherURL=https://github.com/michaelknigge/spf-editor
AppCopyright=Copyright (C) Command Technology Corporation
DefaultDirName={pf}\SPF SourceEdit 6.0
DefaultGroupName=SPF SourceEdit 6.0
OutputDir=.
ChangesEnvironment=yes
PrivilegesRequired=admin
OutputBaseFilename=SPFSE-6.0-1272-SETUP

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"

[Dirs]
Name: "{commonappdata}\SPF SourceEdit 6.0"; Permissions: everyone-modify;
Name: "{app}\macros";                       Permissions: everyone-modify;
Name: "{app}\dialogs";                      Permissions: everyone-modify;

[Files]
Source: "orig-bin\*";       DestDir: "{app}\bin";          Flags: replacesameversion restartreplace
Source: "orig-dialogs\*";   DestDir: "{app}\dialogs";      Flags: replacesameversion restartreplace
Source: "orig-help\*";      DestDir: "{app}\help";         Flags: replacesameversion restartreplace
Source: "orig-macros\*";    DestDir: "{app}\macros";       Flags: replacesameversion restartreplace
Source: "orig-profiles\*";  DestDir: "{app}\profiles";     Flags: replacesameversion restartreplace

Source: "dialogs\*";        DestDir: "{app}\dialogs";      Flags: replacesameversion restartreplace
Source: "macros\*";         DestDir: "{app}\macros";       Flags: replacesameversion restartreplace
Source: "profiles\*";       DestDir: "{app}\profiles";     Flags: replacesameversion restartreplace
Source: "profiles\*";       DestDir: "{app}\defaults";     Flags: replacesameversion restartreplace

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "SPFGE60";   ValueData: "{app}"; Flags: uninsdeletevalue
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "SPFGE60RW"; ValueData: "{commonappdata}\SPF SourceEdit 6.0"; Flags: uninsdeletevalue

[Icons]
Name: "{group}\SPF SourceEdit 6.0"; Filename: "{app}\bin\GraphicEdition60.exe";
Name: "{group}\Uninstall";          Filename: "{uninstallexe}"
