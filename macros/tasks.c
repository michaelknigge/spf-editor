void tasks(void)
{
   if(spfservice("query", "task_count") > 1)
   {
      if(spfservice("query", "task_count") > 2)
         spfservice("cmd", "TASKLIST");
      else
         spfservice("cmd", "SWAP");
   }
}
