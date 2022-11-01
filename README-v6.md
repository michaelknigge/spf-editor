# SPF/SE 6.0
Version 6.0 is a solid release that I use daily. Here are some instructions and a built installer that makes it easier to use Version 6.0.

## Serial number.
To make the SPF/SE 6.0 release a full working release, you need a serial number.
As we've got the permission to distribute SPF/SE for free, we can also make a valid serial number available.
You can use the serial number **60101185**.

## Installer
The original version comes with an interactive text mode installer which makes it hard to install this release unattended.
For this reason I've built a professional installer.

The releases here are all built by the free CI service [AppVeyor](https://www.appveyor.com/) and can be downloaded from the [Releases](https://github.com/michaelknigge/spf-editor/releases).
The provided installer is created with [InnoSetup](http://www.jrsoftware.org/isinfo.php).

### Silent installation
The installer supports silent (unattended) installations. See [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.
A desktop icon can be created by enabling the task *desktopicon* and the included font [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) can be installed by enabling the task *fonts*.
A silent installation for all users that also creates a desktop icon and installs the fonts can be invoked with

```
SPFSE-6.0.1311.21-SETUP.exe /VERYSILENT /ALLUSERS /TASKS="desktopicon,fonts"
```

If you want to install SPF/SE 6.0 just for the current user and not for all users, replace */ALLUSERS* with */CURRENTUSER*.
There are more parameters avaiable (i. e. for creating a log file).

As mentioned, please see the [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.

### Provided SPF/SE 6.0 installers
Currently there are two installers for SPF/SE 6.0 available. An installer for SPF/SE 365 is also available.

The first installer is [SPF/SE 6.0 Build 1272 installer](../../releases/tag/v6.0.1272.21). It is not the latest release of the SPF/SE 6.0 series but it is the release that I use without any problems since january 2010.

The second installer is [SPF/SE 6.0 Build 1311 installer](../../releases/tag/v6.0.1311.21). Note that since SPF/SE 6.0 Build 1283 the location of the default settings changed, as well as the file name. The file containing the default settings is now *spfse.prf* and is located in the directory *%SPF60RW%\System\AllUsers*.

### Installation for all users
The default installation directory is **C:\Program Files (x86)\SPF SourceEdit 6.0** if you install SPF/SE 6.0 for all users.
Note that the permissions of the subdirectories **macros** and **dialogs** are set to *world-writable* so any user that uses SPF/SE 6.0 can add and edit new macros and dialogs.

Additionally the directory **C:\ProgramData\SPF SourceEdit 6.0** is created. If a user starts SPF/SE 6.0 for the first time, a subdirectory with the name of the user is created.
For this reason, the permissions of this directory is set to *world-writable* too. SPF/SE 6.0 stored some user specific data in this directory.
If you want to change the path to this directory, just create the directory where you want and set the environment variable *SPF60RW* to the corresponding path.

### Installation for the current user
The default installation directory is **C:\Users\YourUserNameHere\AppData\Local\SPF SourceEdit 6.0** if you install SPF/SE 6.0 just for the current user.

Additionally the directory **C:\Users\YourUserNameHere\AppData\Roaming\SPF SourceEdit 6.0** is created. If a user starts SPF/SE 6.0 for the first time, a subdirectory with the name of the user is created.
For this reason, the permissions of this directory is set to *world-writable* too. SPF/SE 6.0 stored some user specific data in this directory.
If you want to change the path to this directory, just create the directory where you want and set the environment variable *SPF60RW* to the corresponding path.

### Changes to the original release
See the directories [dialogs-v6](dialogs-v6), [macros](macros) and [profiles-v6](profiles-v6) for files that are changed or added.

The options are set so that SPF/SE 6.0 looks and feels (more or less) like the editor of ISPF under z/OS.
This includes that the action *3270ENTER* is assigned to the right CNTL key and the ENTER key on the numeric pad.
The action *CarriageReturn* is assigned to the ENTER key.

And some options are set so that unprintable characters are not shown (because with some fonts SPF/SE 6.0 doesn't display them correctly).
Furthermore some helpful macros have been added and various file profiles (especially for file types that are common if you work with z/OS or BS2000).

### Editing binary files
When you edit files that are not pure text or program source (i. e. AFP print files), some character codes may not be displayable.
If a non-displayable character paints at less than the full width of the current monospace font, the displayed line in Edit will be width distorted.
That is, the characters will not align to the expected monospace column positions and the line may appear shorter than normal.

To eliminate this effect, alternate display character are assigned for all non-displayable character codes.
Assigned is the space character. To change this settings review *Options*, item *Editor*, item *Display Codes*.
The relevant configuration file is [OptionsDisplayCodes.txt](profiles-v6/OptionsDisplayCodes.txt).
Note that this setting is independent from the active font.

### Fonts
Sadly, SPF/SE 6.0 is quite picky when it comes to fonts.
With many fonts the displayed lines in Edit will be width distorted (i. e. the modern looking font [JetBrains Mono](https://www.jetbrains.com/de-de/lp/mono/) will not work properly).
But you can give SPF/SE 6.0 a quite more modern look with the font [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) by Google.
The provided installer has an option to install this font.
