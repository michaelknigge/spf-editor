void cobprev(void)
{
   spfservice("cmd", "FIND QUIET p'@' 8 PREV");
   spfservice("cmd", "RESET FIND");
   spfservice("cmd", "RECOLOR");
}
