# SPF-Editor (formerly known as SPF/SE)

Powerful editor and file manager that emulates the IBM mainframe ISPF editor. The editor was developed by Tim Tetivia, who unfortunately died in 2022 as a result of a corona infection. [SPF/SE 365 Build 3454](../main/binaries/SPFSE365-3454.msi) was the last version Tim released ([direct download link](../../raw/main/binaries/SPFSE365-3454.msi)).

![Screenshot](../../raw/main/screenshot-small.png "Screenshot")

# Permission to distribute

Tim protected his development environment with technical tools. Unfortunately, nobody knew how to access the data (i. e. passwords) to his environment and so unfortunately nobody, not even members of his family, had access to the source code of the editor. With some research and help from other SPF users (namely Peter aka Verizon), it was possible to contact Tim's wife Bonnie. She gave us permission to distribute the editor for free. It should be in Tim's interest that his editor continues to be used.

> Yes, you can distribute Tim's SPF products for free. I'm not sure how you would do it. I'm sure he would like others to continue using the product.
> 
> As mentioned below I have no access to any software, macros, etc for the SPF products so am no help with installation or troubleshooting any problems.
> 
> Any questions please feel free to contact me.
> 
>Bonnie

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
A desktop icon can be created by enabling the task *desktopicon* and the included font [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) by enabling the task *fonts*.
A silent installation for all users that also creates a desktop icon and installs the fonts can be invoked with

```
SPFSE-6.0.1311.20-SETUP.exe /VERYSILENT /ALLUSERS /TASKS="desktopicon,fonts"
```

If you want to install SPF/SE 6.0 just for the current user and not for all users, replace */ALLUSERS* with */CURRENTUSER*.
There are more parameters avaiable (i. e. for creating a log file).
As mentioned, please see the [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.

### Provided SPF/SE 6.0 installers
Currently there are two installers for SPF/SE 6.0 available. An installer for SPF/SE 365 is also available.

The first installer is [SPF/SE 6.0 Build 1272 installer](../../releases/tag/v6.0.1272.20). It is not the latest release of the SPF/SE 6.0 series but it is the release that I use without any problems since january 2010.

The second installer is [SPF/SE 6.0 Build 1311 installer](../../releases/tag/v6.0.1311.20). Note that since SPF/SE 6.0 Build 1283 the location of the default settings changed, as well as the file name. The file containing the default settings is now *spfse.prf* and is located in the directory *%SPF60RW%\System\AllUsers*.

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
A desktop icon can be created by enabling the task *desktopicon* and the included font [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) by enabling the task *fonts*.
A silent installation for all users that also creates a desktop icon and installs the fonts can be invoked with

```
SPFSE-365.3454.20-SETUP.exe /VERYSILENT /ALLUSERS /TASKS="desktopicon,fonts"
```

If you want to install SPF/SE 365 just for the current user and not for all users, replace */ALLUSERS* with */CURRENTUSER*.
There are more parameters avaiable (i. e. for creating a log file).
As mentioned, please see the [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.

### Provided SPF/SE 356 installers
Currently there is just one installers for SPF/SE 365 available.

The installer [SPF/SE 365 Build 3454 installer](../../releases/tag/v365.3454.20) installs the last version of SPF/SE 365 released. 

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
This includes that the action *3270ENTER* is assigned to ENTER key on the numeric pad and *CarriageReturn* is assigned to the ENTER key.

Sadly with SPF/SE 365 it is not possible to assign two keys to one action (like in SPF/SE 6.0, where I've assigned the right CNTL key **and** ENTER key on the numeric pad to the action *3270ENTER*).

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

# Macros
Several macros are added to the vanilla SPF/SE installation if you use one of the custom installers.
Here are some of them explained. You can see all of them in the directory [macros](macros).

| Macro         | Purpose                                                                |
| ------------- | ---------------------------------------------------------------------- |
| AFP           | Shows the name of the AFP structured field under the cursor.           |
| ASC           | Issues the command "CHARSET ASCII"                                     |
| BLACK         | Sets the current color theme to a theme with a black background        |
| COBNEXT       | Jumps to the next paragraph in a COBOL source file                     |
| COBPREV       | Jumps to the previous paragraph in a COBOL source file                 |
| DELEOL        | Deletes to the end of the line starting at the current cursor position |
| FINDALL       | Gets the word under the cursor and issues a FIND ALL for this word     |
| GOTO          | Jumps to the COBOL procedure of paragraph under the cursor             |
| EBC           | Issues the command "CHARSET EBCDIC"                                    |
| FL            | Jumps to the LINKAGE SECION in a COBOL source file                     |
| FONT          | Shows a dialog that allows you to change the font while editing        |
| FP            | Jumps to the PROCEDURE DIVISION in a COBOL source file                 |
| FW            | Jumps to the WORKING-STORAGE SECTION in a COBOL source file            |
| TASKS         | Issues "TASKLIST" if more than two files are open or SWAP if not       |
| WHITE         | Sets the current color theme to a theme with a white background        |

# Key bindings
Some macros are only useful if assigned to a key. See what is assigned by default:

| Key           | Action                                  |
| ------------- | --------------------------------------- |
| CTRL-A        | Invokes the macro *AFP*                 |
| CTRL-B        | Invokes the macro *COBPREV*             |
| CTRL-C        | Invokes the command *COPY*              |
| CTRL-E        | Invokes the macro *DELEOL*              |
| CTRL-F        | Invokes the macro *FINDALL*             |
| CTRL-G        | Invokes the macro *GOTO*                |
| CTRL-L        | Invokes the command *RPCMD*             |
| CTRL-N        | Invokes the macro *COBNEXT*             |
| CTRL-O        | Invokes the command *LISTFILE*          |
| CTRL-P        | Invokes the macro *HARDCOPY*            |
| CTRL-S        | Invokes the command *SAVE*              |
| CTRL-V        | Invokes the command *PASTE*             |
| CTRL-W        | Invokes the macro *WordCopy*            |
| CTRL-X        | Invokes the command *CUT*               |
| CTRL-Y        | Invokes the command *LOCATE SPECIAL*    |
| CTRL-Z        | Invokes the command *UNDO*              |

# File profiles
The fun begins with file profiles. The provided InnoSetup installer installs some useful profiles (at least useful if you work a lot with files from z/OS or BS2000 Mainframes).
You can find them in the directory [profiles](profiles). Here are some of the noteworthy file profiles:

| Profile       | File type                                                                                                                                                                                       |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AFP           | AFP files. Each AFP record begins with a X'5A' followed by the length of the record                                                                                                             |
| FB80          | Fixed record length of 80 bytes. Very common under z/OS                                                                                                                                         |
| VB            | Files with a variable record length. Each record begins with a RDW (record descriptor word). This RDW contains the record length in the first two bytes. Very common under IBM z/OS (RCFM=VB).  |
| VBA           | Same as VB (VB with ASA control characters)                                                                                                                                                     |
| VBM           | Same as VB (VB with IBM control characters)                                                                                                                                                     |
| VS            | Files with a variable record length. Each record begins with a two-byte record length field (length of the record field **is** included). Very common under Siemens BS2000.                     |
| VSA           | Same as VS (VS with ASA control characters)                                                                                                                                                     |
| VSM           | Same as VS (VS with IBM control characters)                                                                                                                                                     |
| VX            | Files with a variable record length. Each record begins with a two-byte record length field (length of the record field **is not** included).                                                   |
| VXA           | Same as VX (VX with ASA control characters)                                                                                                                                                     |
| VXM           | Same as VX (VX with IBM control characters)                                                                                                                                                     |
