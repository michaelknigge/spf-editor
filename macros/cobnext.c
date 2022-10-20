void cobnext(void)
{
   spfservice("cmd", "FIND QUIET p'@' 8 NEXT");
   spfservice("cmd", "RESET FIND");
   spfservice("cmd", "RECOLOR");
}
