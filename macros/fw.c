void fw(void)
{
   SpfService("cmd", "FIND 'WORKING-STORAGE SECTION' 8 FIRST QUIET");

   if(SpfService("query", "find_string_count", NULL) == 0)
      return;

   SpfService("cmd", "DOWN");
   SpfService("cmd", "RESET FIND");
   SpfService("cmd", "RECOLOR");
   SpfService("cmd", "CURSOR");
}
