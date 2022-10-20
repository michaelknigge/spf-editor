void afp(void)
{
   char *Text;
   char *Byte1;
   char *Byte2;
   char *Byte3;


   if(SpfService("query", "line_length") < 6)
   {
      Msg("Current record is no AFP record.");
      return;
   }
   
   // Byte X'5A' is the first byte if the file has fixed record length.
   if(strcmp(SpfService("query", "hex_code", 1), "5A") == 0)
   {
      Byte1 = SpfService("query", "hex_code", 4);
      Byte2 = SpfService("query", "hex_code", 5);
      Byte3 = SpfService("query", "hex_code", 6);
   }
   else
   {
      // If the file is in AFP format, the record begins with the
      // Structured Field Identifier...
      if(strcmp(SpfService("query", "hex_code", 1), "D3") == 0)
      {
         Byte1 = SpfService("query", "hex_code", 1);
         Byte2 = SpfService("query", "hex_code", 2);
         Byte3 = SpfService("query", "hex_code", 3);
      }
      else
      {
         if(strcmp(SpfService("query", "hex_code", 5), "5A") == 0)
         {
            if(SpfService("query", "line_length") < 10)
            {
               Msg("Current record is no AFP record.");
               return;
            }
            
            Byte1 = SpfService("query", "hex_code", 8);
            Byte2 = SpfService("query", "hex_code", 9);
            Byte3 = SpfService("query", "hex_code", 10);
         }
         else
         {
            Msg("Current record is no AFP record.");
            return;
         }
      }
   }
   
   Text = strcompose(Byte1, Byte2, Byte3);

   if(strncmp(Text, "D3A8C9", 6) == 0)
      Msg("BAG: Begin Active Environment Group");

   if(strncmp(Text, "D3A8EB", 6) == 0)
      Msg("BBC: Begin Bar Code Object");

   if(strncmp(Text, "D3A877", 6) == 0)
      Msg("BCA: Begin Color Attribute Table");

   if(strncmp(Text, "D3A88A", 6) == 0)
      Msg("BCF: Begin Coded Font");

   if(strncmp(Text, "D3A887", 6) == 0)
      Msg("BCP: Begin Code Page");

   if(strncmp(Text, "D3EEEB", 6) == 0)
      Msg("BDA: Bar Code Data");

   if(strncmp(Text, "D3A6EB", 6) == 0)
      Msg("BDD: Bar Code Data Descriptor");

   if(strncmp(Text, "D3A8C4", 6) == 0)
      Msg("BDG: Begin Document Environment Group");

   if(strncmp(Text, "D3A8A7", 6) == 0)
      Msg("BDI: Begin Document Index");

   if(strncmp(Text, "D3A8CA", 6) == 0)
      Msg("BDM: Begin Data Map");

   if(strncmp(Text, "D3A8A8", 6) == 0)
      Msg("BDT: Begin Document");

   if(strncmp(Text, "D3A8E3", 6) == 0)
      Msg("BDX: Begin Data Map Transmission Subcase");

   if(strncmp(Text, "D3A8C5", 6) == 0)
      Msg("BFG: Begin Form Environment Group");

   if(strncmp(Text, "D3A8CD", 6) == 0)
      Msg("BFM: Begin Form Map");

   if(strncmp(Text, "D3A889", 6) == 0)
      Msg("BFN: Begin Font");

   if(strncmp(Text, "D3A8BB", 6) == 0)
      Msg("BGR: Begin Graphics Object");

   if(strncmp(Text, "D3A87B", 6) == 0)
      Msg("BIMM: Begin Image Object IM");

   if(strncmp(Text, "D3A8FB", 6) == 0)
      Msg("BIMO: Begin Image Object IO");

   if(strncmp(Text, "D3A8CC", 6) == 0)
      Msg("BMM: Begin Medium Map");

   if(strncmp(Text, "D3A8DF", 6) == 0)
      Msg("BMO: Begin Medium Overlay");

   if(strncmp(Text, "D3A8AD", 6) == 0)
      Msg("BNG: Begin Named Page Group");

   if(strncmp(Text, "D3A892", 6) == 0)
      Msg("BOC: Begin Object Container");

   if(strncmp(Text, "D3A8C7", 6) == 0)
      Msg("BOG: Begin Object Environment Group");

   if(strncmp(Text, "D3A8AF", 6) == 0)
      Msg("BPG: Begin Page");

   if(strncmp(Text, "D3A8CB", 6) == 0)
      Msg("BPM: Begin Page Map");

   if(strncmp(Text, "D3A85F", 6) == 0)
      Msg("BPS: Begin Page Segment");

   if(strncmp(Text, "D3A89B", 6) == 0)
      Msg("BPT: Begin Presentation Text Block");

   if(strncmp(Text, "D3A8CE", 6) == 0)
      Msg("BRS: Begin Resource");

   if(strncmp(Text, "D3A8C6", 6) == 0)
      Msg("BRG: Begin Resource Group");

   if(strncmp(Text, "D3A8D9", 6) == 0)
      Msg("BSG: Begin Resource Environment Group");

   if(strncmp(Text, "D3B077", 6) == 0)
      Msg("CAT: Color Attribute Table");

   if(strncmp(Text, "D3A7CA", 6) == 0)
      Msg("CCP: Conditional Processing Control");

   if(strncmp(Text, "D3A692", 6) == 0)
      Msg("CDD: Container Data Descriptor");

   if(strncmp(Text, "D3A79B", 6) == 0)
      Msg("CTC: Composed Text Control");

   if(strncmp(Text, "D3A78A", 6) == 0)
      Msg("CFC: Coded Font Control");

   if(strncmp(Text, "D38C8A", 6) == 0)
      Msg("CFI: Coded Font Index");

   if(strncmp(Text, "D3A787", 6) == 0)
      Msg("CPC: Code Page Control");

   if(strncmp(Text, "D3A687", 6) == 0)
      Msg("CPD: Code Page Descriptor");

   if(strncmp(Text, "D38C87", 6) == 0)
      Msg("CPI: Code Page Index");

   if(strncmp(Text, "D3A6E3", 6) == 0)
      Msg("DXD: Data Map Transm Subcase Descriptor");

   if(strncmp(Text, "D3A9C9", 6) == 0)
      Msg("EAG: End Active Environment Group");

   if(strncmp(Text, "D3A9EB", 6) == 0)
      Msg("EBC: End Bar Code Object");

   if(strncmp(Text, "D3A977", 6) == 0)
      Msg("ECA: End Color Attribute Table");

   if(strncmp(Text, "D3A98A", 6) == 0)
      Msg("ECF: End Coded Font");

   if(strncmp(Text, "D3A987", 6) == 0)
      Msg("ECP: End Code Page");

   if(strncmp(Text, "D3A9C4", 6) == 0)
      Msg("EDG: End Document Environment Group");

   if(strncmp(Text, "D3A9A7", 6) == 0)
      Msg("EDI: End Document Index");

   if(strncmp(Text, "D3A9CA", 6) == 0)
      Msg("EDM: End Data Map");

   if(strncmp(Text, "D3A9A8", 6) == 0)
      Msg("EDT: End Document");

   if(strncmp(Text, "D3A9E3", 6) == 0)
      Msg("EDX: End Data Map Transmission Subcase");

   if(strncmp(Text, "D3A9C5", 6) == 0)
      Msg("EFG: End Form Environment Group");

   if(strncmp(Text, "D3A9CD", 6) == 0)
      Msg("EFM: End Form Map");

   if(strncmp(Text, "D3A9BB", 6) == 0)
      Msg("EGR: End Graphics Object");

   if(strncmp(Text, "D3A97B", 6) == 0)
      Msg("EIMM: End Image Object IM");

   if(strncmp(Text, "D3A9FB", 6) == 0)
      Msg("EIMO: End Image Object IO");

   if(strncmp(Text, "D3A9CC", 6) == 0)
      Msg("EMM: End Medium Map");

   if(strncmp(Text, "D3A9DF", 6) == 0)
      Msg("EMO: End Medium Overlay");

   if(strncmp(Text, "D3A9AD", 6) == 0)
      Msg("ENG: End Named Page Group");

   if(strncmp(Text, "D3A992", 6) == 0)
      Msg("EOC: End Object Container");

   if(strncmp(Text, "D3A9C7", 6) == 0)
      Msg("EOG: End Object Environment Group");

   if(strncmp(Text, "D3A9AF", 6) == 0)
      Msg("EPG: End Page");

   if(strncmp(Text, "D3A9CB", 6) == 0)
      Msg("EPM: End Page Map");

   if(strncmp(Text, "D3A95F", 6) == 0)
      Msg("EPS: End Page Segment");

   if(strncmp(Text, "D3A99B", 6) == 0)
      Msg("EPT: End Presentation Text Object");

   if(strncmp(Text, "D3A9CE", 6) == 0)
      Msg("ERS: End Resource");

   if(strncmp(Text, "D3A9C6", 6) == 0)
      Msg("ERG: End Resource Group");

   if(strncmp(Text, "D3A9D9", 6) == 0)
      Msg("ESG: End Resource Environment Group");

   if(strncmp(Text, "D3A989", 6) == 0)
      Msg("ENF: End Font");

   if(strncmp(Text, "D3A789", 6) == 0)
      Msg("FNC: Font Control");

   if(strncmp(Text, "D3A689", 6) == 0)
      Msg("FND: Font Descriptor");

   if(strncmp(Text, "D3EE89", 6) == 0)
      Msg("FNG: Font Patterns");

   if(strncmp(Text, "D38C89", 6) == 0)
      Msg("FNI: Font Index");

   if(strncmp(Text, "D3A289", 6) == 0)
      Msg("FNM: Font Patterns Map");

   if(strncmp(Text, "D3AE89", 6) == 0)
      Msg("FNO: Font Orientation");

   if(strncmp(Text, "D3AC89", 6) == 0)
      Msg("FNP: Font Position");

   if(strncmp(Text, "D3AAEC", 6) == 0)
      Msg("FDS: Fixed Data Size");

   if(strncmp(Text, "D3EEEC", 6) == 0)
      Msg("FDX: Fixed Data Text");

   if(strncmp(Text, "D3A6C5", 6) == 0)
      Msg("FGD: Form Environment Group Descriptor");

   if(strncmp(Text, "D3AB89", 6) == 0)
      Msg("FNN: Form Name Map");

   if(strncmp(Text, "D3EEBB", 6) == 0)
      Msg("GAD: Graphics Data");

   if(strncmp(Text, "D3A6BB", 6) == 0)
      Msg("GDD: Graphics Data Descriptor");

   if(strncmp(Text, "D3B2A7", 6) == 0)
      Msg("IEL: Index Element");

   if(strncmp(Text, "D3AC7B", 6) == 0)
      Msg("IOP: Image Cell Position");

   if(strncmp(Text, "D3A6FB", 6) == 0)
      Msg("IDD: Image Data Descriptor IO");

   if(strncmp(Text, "D3ABCA", 6) == 0)
      Msg("IDM: Invoke Data Map");

   if(strncmp(Text, "D3A67B", 6) == 0)
      Msg("IID: Image Input Descriptor IM");

   if(strncmp(Text, "D3ABCC", 6) == 0)
      Msg("IMM: Invoke Medium Map");

   if(strncmp(Text, "D3AFC3", 6) == 0)
      Msg("IOB: Include Object");

   if(strncmp(Text, "D3A77B", 6) == 0)
      Msg("IOC: Image Output Control IM");

   if(strncmp(Text, "D3EEFB", 6) == 0)
      Msg("IPD: Image Picture Data IO");

   if(strncmp(Text, "D3AFAF", 6) == 0)
      Msg("IPG: Image Page");

   if(strncmp(Text, "D3AFD8", 6) == 0)
      Msg("IPO: Include Page Overlay");

   if(strncmp(Text, "D3AF5F", 6) == 0)
      Msg("IPS: Include Page Segment");

   if(strncmp(Text, "D3EE7B", 6) == 0)
      Msg("IRD: Image Raster Data IM");

   if(strncmp(Text, "D3B490", 6) == 0)
      Msg("LLE: Link Logical Element");

   if(strncmp(Text, "D3AAE7", 6) == 0)
      Msg("LNC: Line Descriptor Count");

   if(strncmp(Text, "D3A6E7", 6) == 0)
      Msg("LND: Line Descriptor");

   if(strncmp(Text, "D3ABEB", 6) == 0)
      Msg("MBC: Map Bar Code");

   if(strncmp(Text, "D3AB77", 6) == 0)
      Msg("MCA: Map Color Attribute Table");

   if(strncmp(Text, "D3A288", 6) == 0)
      Msg("MCC: Medium Copy Count");

   if(strncmp(Text, "D3AB92", 6) == 0)
      Msg("MCD: Map Container Data");

   if(strncmp(Text, "D3B18A", 6) == 0)
      Msg("MCF1: Map Coded Font (Format 1)");

   if(strncmp(Text, "D3AB8A", 6) == 0)
      Msg("MCF2: Map Coded Font (Format 2)");

   if(strncmp(Text, "D3A688", 6) == 0)
      Msg("MDD: Medium Descriptor");

   if(strncmp(Text, "D3ABC3", 6) == 0)
      Msg("MDR: Map Data Resource");

   if(strncmp(Text, "D3A088", 6) == 0)
      Msg("MFC: Medium Finishing Control");

   if(strncmp(Text, "D3ABBB", 6) == 0)
      Msg("MGO: Map Graphic Object");

   if(strncmp(Text, "D3ABFB", 6) == 0)
      Msg("MIO: Map IO Image Object");

   if(strncmp(Text, "D3A788", 6) == 0)
      Msg("MMC: Medium Modification Control");

   if(strncmp(Text, "D3B1DF", 6) == 0)
      Msg("MMO: Map Medium Overlay");

   if(strncmp(Text, "D3AB88", 6) == 0)
      Msg("MMT: Map Media Type");

   if(strncmp(Text, "D3ABAF", 6) == 0)
      Msg("MPG: Map Page");

   if(strncmp(Text, "D3ABD8", 6) == 0)
      Msg("MPO: Map Page Overlay");

   if(strncmp(Text, "D3B15F", 6) == 0)
      Msg("MPS: Map Page Segment");

   if(strncmp(Text, "D3ABEA", 6) == 0)
      Msg("MSU: Map Suppression");

   if(strncmp(Text, "D3EEEE", 6) == 0)
      Msg("NOP: No Operation");

   if(strncmp(Text, "D3A66B", 6) == 0)
      Msg("OBD: Object Area Descriptor");

   if(strncmp(Text, "D3AC6B", 6) == 0)
      Msg("OBP: Object Area Position");

   if(strncmp(Text, "D3EE92", 6) == 0)
      Msg("OCD: Object Container Data");

   if(strncmp(Text, "D3A7A8", 6) == 0)
      Msg("PEC: Preprocess Environment Control");

   if(strncmp(Text, "D3B288", 6) == 0)
      Msg("PFC: Presentation Fidelity Control");

   if(strncmp(Text, "D3A6AF", 6) == 0)
      Msg("PGD: Page Descriptor");

   if(strncmp(Text, "D3ACAF", 6) == 0)
      Msg("PGP1: Page Position");

   if(strncmp(Text, "D3B1AF", 6) == 0)
      Msg("PGP2: Page Position (Format 2)");

   if(strncmp(Text, "D3A7AF", 6) == 0)
      Msg("PMC: Page Modification Control");

   if(strncmp(Text, "D3ADC3", 6) == 0)
      Msg("PPO: Preprocess Presentation Object");

   if(strncmp(Text, "D3A69B", 6) == 0)
      Msg("PTD1: Presentation Text Descriptor (Format 1)");

   if(strncmp(Text, "D3B19B", 6) == 0)
      Msg("PTD2: Presentation Text Descriptor (Format 2)");

   if(strncmp(Text, "D3EE9B", 6) == 0)
      Msg("PTX: Presentation Text Data");

   if(strncmp(Text, "D3A68D", 6) == 0)
      Msg("RCD: Record Descriptior");

   if(strncmp(Text, "D3A090", 6) == 0)
      Msg("TLE: Tag Logical Element");

   if(strncmp(Text, "D3A78E", 6) == 0)
      Msg("XMD: XML Descriptor");

   return;
}
