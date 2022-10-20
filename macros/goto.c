void goto(void)
{
   int   Start;
   int   End;
   int   Col;
   int   Len;
   char *Word;
   char *Text;
   char *Suffix;

   Text   = SpfService("query", "line_data");
   Col    = SpfService("query", "col_number");
   Len    = SpfService("query", "line_length");
   Suffix = "' ALL";

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

      if(StrFindSubstr(Text, "PERFORM ", 1) > 0)
         Suffix = "' 8 ALL";
      
      if(StrFindSubstr(Text, "GOTO ", 1) > 0)
         Suffix = "' 8 ALL";
      
      if(StrFindSubstr(Text, "PROCEDURE ", 1) > 0)
         Suffix = "' 8 ALL";
      
      SpfService("cmd", StrCompose("FIND '", Word, Suffix));
   }
}
