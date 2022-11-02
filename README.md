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

# Request or offer to SPF/SE users
If you have other releases of SPF/SE and would like to see them here, please contact me an I'll add them here.

Wouldn't it be great if (the latest release of) SPF/SE 8.0 would also be available here?

# SPF/SE 365
SPF/SE 365 is the latest version released by Tim Tetivia. See this [README-v365](README-v365.md) for further information about the available SPF/SE 365 releases and the provided custom installer.

# SPF/SE 8.0
Unfortunately I never owned a SPF/SE 8.0 release. If you have one, please send it to me and I will make it available here. I'd like to have one here.

# SPF/SE 7.0
Unfortunately I never owned a SPF/SE 7.0 release, but a SPF/SE 7.0 user sent me one - thank you! Currently there is no custom installer available (but this may change).
To make the SPF/SE 7.0 release a full working release, you need a serial number.
As we've got the permission to distribute SPF/SE for free, we can also make a valid serial number available.
You can use the serial number **70101185**.

# SPF/SE 6.0
Version 6.0 is a solid release that I use daily. See this [README-v6](README-v6.md) for further information about the available SPF/SE 6.0 releases and the provided custom installer.

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
You can find them in the directories [profiles-v6](profiles-v6) and [profiles-v356](profiles-v365). Here are some of the noteworthy file profiles:

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
