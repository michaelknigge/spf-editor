void findall(void)
{
   int   Start;
   int   End;
   int   Col;
   int   Len;
   char *Word;
   char *Text;

   Text = SpfService("query", "line_data");
   Col  = SpfService("query", "col_number");
   Len  = SpfService("query", "line_length");

   if(Text && Col >= 1 && Col <= Len)
   {
      while(Col > 1 && StrGetSubstr(Text, Col, 1) != " ")
         Col--;

      if(StrGetSubstr(Text, Col, 1) == " ")
         Col++;

      Start = Col;
      End   = StrFindSubstr(Text, " ", Start);

      if(End <= Start)
      {
         if(Start > 1)
            Start--;

         End = Len;
      }

      Len  = End - Start + 1;
      Word = StrGetSubstr(Text, Start, Len);
    
      StrStripLeading(Word, " ");
      StrStripTrailing(Word, " ");
    
      if(Start == 7)
         StrStripTrailing(Word, ".");

      SpfService("cmd", StrCompose("FIND '", Word, "' ALL"));
   }
}
