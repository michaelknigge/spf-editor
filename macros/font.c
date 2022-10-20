// Shows a dialog which allows the user to select a font. Used
// to quickly change the font and to specify a size larger than 14
// (the options dialog of SPF/SE allows the user to specify a size
// of max 14). Even more, this macro allows the user to change the
// font while editing (normaly not allowed).
void main(void)
{
   // Installation of the "Source Code Pro" font is required. This font looks
   // much better than Lucida Console, Courier or Fixedsys.
   SPFservice("vput", "SETFONT.List.1", "Source Code Pro Medium,10,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.2", "Source Code Pro Medium,12,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.3", "Source Code Pro Medium,14,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.4", "Source Code Pro Medium,16,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.5", "Source Code Pro Medium,18,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.6", "Lucida Console,12,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.7", "Lucida Console,14,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.8", "Lucida Console,16,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.9", "Lucida Console,18,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.10", "Courier,10,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.11", "Courier,12,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.12", "Courier,15,Normal,DEFAULT");
   SPFservice("vput", "SETFONT.List.13", "Courier,15,Bold,DEFAULT");
   SPFservice("vput", "SETFONT.List.14", "Fixedsys,11,Normal,DEFAULT");

   // Put the size of the list at position 0
   SPFservice("vput", "SETFONT.List.0", "14");

   if(strcmp(SPFservice("dialog", "setfont"), "OK") == 0)
   {
      SPFservice("cmd", strcompose("FONTSET EDIT,", SPFservice("vget", "SETFONT.List.Reply.1"));
      SPFservice("cmd", strcompose("FONTSET DIALOG,", SPFservice("vget", "SETFONT.List.Reply.1"));
      SPFservice("cmd", strcompose("FONTSET PRINT,", SPFservice("vget", "SETFONT.List.Reply.1"));
   }
}
