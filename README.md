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
Version 6.0 is a solid release that I use daily. Here are some instructions and a build installer that makes it easier to use Version 6.0.

## Serial number.
To make the SPF/SE 6.0 release a full working release, you need a serial number.
As we've got the permission to distribute SPF/SE for free, we can also make a valid serial number available.
You can use the serial number **60101185**.

## Installer
The original version comes with an interactive text mode installer which makes it hard to install this release unattended.
For this reason I've built a professional installer.
The releases here are all built by the free CI service [AppVeyor](https://www.appveyor.com/) and can be downloaded from the [Releases](https://github.com/michaelknigge/spf-editor/releases).
The provided installer is created with [InnoSetup](http://www.jrsoftware.org/isinfo.php).
The installer supports silent (unattended) installations. See [InnoSetup Setup Command Line Parameters](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline) for details.

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
See the directories [dialogs](dialogs), [macros](macros) and [profiles](profiles) for files that are changed or added.

The options are set so that SPF/SE 6.0 looks and feels (more or less) like the editor of ISPF under z/OS. This includes that ENTER is assigned to the right CNTL key and the ENTER key on the numeric pad.
And some options are set so that unprintable characters are not shown (because with some fonts SPF/SE 6.0 doesn't display them correctly).
Furthermore some helpful macros have been added and various file profiles (especially for file types that are common if you work with z/OS or BS2000).

# SPF/SE 365 product key
To make the SPF/SE 365 release a full working release, you need a product key. As we've got the permission to distribute SPF/SE for free, we can also make a valid product key available. You can use the product key **i8ds-qj8g-3h7o-7cvr-d39a-iang-hwje**.

Two releases of SPF/SE 365 are available in the [binaries](../main/binaries) directory. [SPF/SE 365 Build 3163](../../raw/main/binaries/SPFSE365-3163.msi) requires a product key, the latest version [SPF/SE 365 Build 3454](../../raw/main/binaries/SPFSE365-3454.msi) will work without a product key.

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

| Profile       | File type                                                                                                                                                                         |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AFP           | AFP files. Each AFP record begins with a X'5A' followed by the length of the record                                                                                               |
| FB80          | Fixed record length of 80 bytes. Very common under z/OS                                                                                                                           |
| VB            | Files with a variable record length. Each record begins with a RDW (record descriptor word). This RDW contains the record length in the first two bytes. Very common under z/OS.  |
| VBA           | Same as VB (VB with ASA control characters)                                                                                                                                       |
| VBM           | Same as VB (VB with IBM control characters)                                                                                                                                       |
| VS            | Files with a variable record length. Each record begins with a two-byte record length field (length of the record field is **not** included). Very common under BS2000.           |
| VSA           | Same as VS (VS with ASA control characters)                                                                                                                                       |
| VSM           | Same as VS (VS with IBM control characters)                                                                                                                                       |
| VX            | Files with a variable record length. Each record begins with a two-byte record length field (length of the record field **is** included).                                         |
| VXA           | Same as VX (VX with ASA control characters)                                                                                                                                       |
| VXM           | Same as VX (VX with IBM control characters)                                                                                                                                       |
