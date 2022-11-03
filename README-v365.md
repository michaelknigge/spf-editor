# SPF/SE 365
SPF/SE 365 is the latest version of SPF/SE available. I've never been a big fan of the SPF/SE 365 because of several reasons.
Some of them are really trifles but they annoyed me. Furthermore the migration of settings vom SPF/SE 6.0 is not ideal, various settings are not migrated properly.
For this reason I also provide an installer for SPF/SE 365.

## Product key
To make the SPF/SE 365 release a full working release, you need a product key. As we've got the permission to distribute SPF/SE for free, we can also make a valid product key available. You can use the product key **i8ds-qj8g-3h7o-7cvr-d39a-iang-hwje**.

Two releases of SPF/SE 365 are available in the [binaries](../main/binaries) directory. [SPF/SE 365 Build 3163](../../raw/main/binaries/SPFSE365-3163.msi) requires a product key, the latest version [SPF/SE 365 Build 3454](../../raw/main/binaries/SPFSE365-3454.msi) will work without a product key.

## Installer
The original version comes as an MSI package that was very limited in its usage.
It was only possible to install with administrative rights and you've not been able to disable the creation of desktop icons.
For this reason I've built a professional installer.

The releases here are all built by the free CI service [AppVeyor](https://www.appveyor.com/) and can be downloaded from the [Releases](https://github.com/michaelknigge/spf-editor/releases).
The provided installer is created with [InnoSetup](http://www.jrsoftware.org/isinfo.php).

### Silent installation
The installer supports silent (unattended) installations. See [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.
A desktop icon can be created by enabling the task *desktopicon* and the included font [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) can be installed by enabling the task *fonts*.
A silent installation for all users that also creates a desktop icon and installs the fonts can be invoked with

```
SPFSE-365.3454.25-SETUP.exe /VERYSILENT /ALLUSERS /TASKS="desktopicon,fonts"
```

If you want to install SPF/SE 365 just for the current user and not for all users, replace */ALLUSERS* with */CURRENTUSER*.
There are more parameters avaiable (i. e. for creating a log file).

As mentioned, please see the [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.

### Provided SPF/SE 356 installers
Currently there is just one installer for SPF/SE 365 available.

The [SPF/SE 365 Build 3454 installer](../../releases/tag/v365.3454.25) installs the last version of SPF/SE 365 ever released. 

### Installation for all users
The default installation directory is **C:\Program Files (x86)\SPF SourceEdit 365** if you install SPF/SE 365 for all users.
Note that the permissions of the subdirectories **Macros** and **Dialogs** are set to *world-writable* so any user that uses SPF/SE 365 can add and edit new macros and dialogs.

Additionally the directory **C:\ProgramData\SPF SourceEdit 365** is created. Settings changed by the user are stored in this dirctory.
For this reason, the permissions of this directory is set to *world-writable* too.
If you want to change the path to this directory, just create the directory where you want and set the environment variable *SPFGE365RW* to the corresponding path.

### Installation for the current user
The default installation directory is **C:\Users\YourUserNameHere\AppData\Local\SPF SourceEdit 365** if you install SPF/SE 365 just for the current user.

Additionally the directory **C:\Users\YourUserNameHere\AppData\Roaming\SPF SourceEdit 365** is created. Settings changed by the user are stored in this dirctory.
For this reason, the permissions of this directory is set to *world-writable* too.
If you want to change the path to this directory, just create the directory where you want and set the environment variable *SPFGE365RW* to the corresponding path.

### Changes to the original release
See the directories [dialogs-v365](dialogs-v365), [macros](macros) and [profiles-v365](profiles-v365) for files that are changed or added.

The options are set so that SPF/SE 365 looks and feels (more or less) like the editor of ISPF under z/OS.

And some options are set so that unprintable characters are not shown (because with some fonts SPF/SE 6.0 doesn't display them correctly).
Furthermore some helpful macros have been added and various file profiles (especially for file types that are common if you work with z/OS or BS2000).

### Editing binary files
When you edit files that are not pure text or program source (i. e. AFP print files), some character codes may not be displayable.
If a non-displayable character paints at less than the full width of the current monospace font, the displayed line in Edit will be width distorted.
That is, the characters will not align to the expected monospace column positions and the line may appear shorter than normal.

To eliminate this effect, alternate display character are assigned for all non-displayable character codes.
Assigned is the space character.

**In contrast to SPF/SE 6.0, those assignments must be configured on a per-font basis.**

That means, if you change to a new font, you have to configure these settings again.
The provided installer installs these assignments for the common fonts that are available on Windows 10 and Windows 11.

### Fonts
Sadly, SPF/SE 365 (as well as SPF/SE 6.0) is still quite picky when it comes to fonts.
With many fonts the displayed lines in Edit will be width distorted (i. e. the modern looking font [JetBrains Mono](https://www.jetbrains.com/de-de/lp/mono/) will not work properly).
But you can give SPF/SE 365 a quite more modern look with the font [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) by Google.
The provided installer has an option to install this font.
