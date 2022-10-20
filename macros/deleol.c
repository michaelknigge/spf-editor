void deleol(void)
{
   int   Col;
   int   Len;
   char *Text;

   Text = SpfService("query", "line_data");
   Col  = SpfService("query", "col_number");
   Len  = SpfService("query", "line_length");

   if(Text && Col >= 1 && Col <= Len)
      SPFservice("set", "line_data", StrGetSubstr(Text, 1, Col);
}
