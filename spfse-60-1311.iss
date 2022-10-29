#define AppName         "SPF SourceEdit 6.0"
#define AppBuildNumber  "1311"
#define AdminSubkey     "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#define UserSubkey      "Environment"


[Setup]
AppName={#AppName}
AppVerName={#AppName} Build {#AppBuildNumber}
AppPublisher=Command Technology Corporation
AppPublisherURL=https://github.com/michaelknigge/spf-editor
AppCopyright=Copyright (C) Command Technology Corporation
DefaultGroupName={#AppName}
DefaultDirName={code:GetDefaultDirName}
OutputDir=.
ChangesEnvironment=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog commandline
OutputBaseFilename=SPFSE-6.0.{#AppBuildNumber}.{#AppveyorBuildNumber}-SETUP

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Dirs]
Name: "{autoappdata}\{#AppName}";          Permissions: everyone-modify;
Name: "{autoappdata}\{#AppName}\AllUsers"; Permissions: everyone-modify;
Name: "{app}\macros";                      Permissions: everyone-modify;
Name: "{app}\dialogs";                     Permissions: everyone-modify;

[Files]
Source: "orig-bin\*";       DestDir: "{app}\bin";          Flags: replacesameversion restartreplace
Source: "orig-dialogs\*";   DestDir: "{app}\dialogs";      Flags: replacesameversion restartreplace
Source: "orig-help\*";      DestDir: "{app}\help";         Flags: replacesameversion restartreplace
Source: "orig-macros\*";    DestDir: "{app}\macros";       Flags: replacesameversion restartreplace
Source: "orig-profiles\*";  DestDir: "{app}\profiles";     Flags: replacesameversion restartreplace

Source: "dialogs-v6\*";     DestDir: "{app}\dialogs";      Flags: replacesameversion restartreplace
Source: "macros\*";         DestDir: "{app}\macros";       Flags: replacesameversion restartreplace

; The file "default.prf" is excluded. Starting with Build 1283 the location
; of the file containing default settings changed as well as the name of
; the file (changed from "default.prf" to "spfse.prf").
Source: "profiles-v6\*";    DestDir: "{autoappdata}\{#AppName}\System\AllUsers"; Flags: replacesameversion restartreplace; Excludes: "default.prf"

[Registry]
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE60";   ValueData: "{app}";                    Flags: uninsdeletevalue
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE60RW"; ValueData: "{autoappdata}\{#AppName}"; Flags: uninsdeletevalue

Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE60";   ValueData: "{app}";                    Flags: uninsdeletevalue
Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE60RW"; ValueData: "{autoappdata}\{#AppName}"; Flags: uninsdeletevalue

[Icons]
Name: "{group}\SPF SourceEdit 6.0"; Filename: "{app}\bin\GraphicEdition60.exe";
Name: "{group}\Uninstall";          Filename: "{uninstallexe}"

[Code]
function GetDefaultDirName(Param: String): String;
begin
  if IsAdminInstallMode then
    Result := ExpandConstant('{pf}') + '\{#AppName}'
  else
    Result := GetEnv('LOCALAPPDATA') + '\{#AppName}'
end;
