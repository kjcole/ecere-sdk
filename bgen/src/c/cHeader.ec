import "genC"

void cHeader(CGen g)
{
   if(!python)
   {
      cInHeaderFileComment(g);
      cInHeaderProcessSourceFile(g, null, ":src/c/c_header_open.src");
      cInHeaderIncludes(g);
      cInHeaderModuleName(g);

      if(g.lib.ecereCOM)
      {
         cInHeaderEcereComRuntimeFunctions(g);
         cInHeaderProcessSourceFile(g, "binding macros", ":src/c/c_header_ec_macros.src");
      }
      else if(g.lib.ecere)
         cInHeaderEcereRuntimeMacros(g);
      else if(g.lib.eda)
         cInHeaderEDARuntimeMacros(g);

      if(g.lib.ecereCOM)
         cInHeaderProcessSourceFile(g, "HARDCODED", ":src/c/c_header_ec_hardcoded.src");
   }
   else
   {
      if(g.lib.ecereCOM)
         cInHeaderProcessSourceFile(g, "HARDCODED", ":src/py/cffi_hardcode_ec_begin.src");
   }

   cInHeaderTypes(g);

   cInHeaderDynamicLinkFunctionImports(g);
   if(g.lib.ecereCOM)
      cInHeaderThisModule(g);
   cInHeaderLibraryInitPrototype(g);
   if(!python)
      cInHeaderProcessSourceFile(g, null, ":src/c/c_header_close.src");
   else
   {
      if(g.lib.ecereCOM)
         cInHeaderProcessSourceFile(g, "HARDCODED", ":src/py/cffi_hardcode_ec_end.src");
   }
}

static void cInHeaderTypes(CGen g)
{
   AVLTree<UIntPtr> nodes { };
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      for(a : n.output)
         g.astAdd(a, false);
      if(n.orderedBackwardsOutputs.count)
      {
         if(!python)
            g.astAdd(ASTRawString { string = CopyString("// start -- moved backwards outputs") }, true);
         for(optr : n.orderedBackwardsOutputs)
         {
            BOutput o = (BOutput)optr;
            for(node : o.output)
            {
               if(!nodes.Find((UIntPtr)node)) // damn it! why is this needed? :S
               {
                  nodes.Add((UIntPtr)node);
                  g.astAdd(node, false);
               }
            }
         }
         if(!python)
            g.astAdd(ASTRawString { string = CopyString("// end -- moved backwards outputs") }, true);
      }
      for(optr : n.orderedOutputs)
      {
         BOutput o = (BOutput)optr;
         if(o.kind == vmanual || o.kind == vdefine || o.kind == vfunction ||
               o.kind == vclass || o.kind == vtemplaton || o.kind == vmethod || o.kind == vproperty)
         {
            for(node : o.output)
            {
               if(!nodes.Find((UIntPtr)node)) // damn it! why is this needed? :S
               {
                  nodes.Add((UIntPtr)node);
                  g.astAdd(node, false);
               }
            }
         }
         else check();
      }
   }
   delete nodes;
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      for(vv : n.contents)
      {
         BVariant v = vv;
         if(v.kind == vclass && v.c.outClassPointer)
            g.astAdd(v.c.outClassPointer.output.firstIterator.data, false);
      }
   }
}

static void cInHeaderProcessSourceFile(CGen g, const char * comment, const char * pathToFile)
{
   ASTRawString raw { }; DynamicString z { };
   if(comment && !python)
      bigCommentSection(z, comment);
   sourceFileProcessToDynamicString(z, pathToFile, g.sourceProcessorVars, python);
   z.size--;
   if(z[z.count-1] == '\n');
      z[z.count-1] = 0;
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderFileComment(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   if(g.lib.ecereCOM)
      bigCommentLibrary(z, "Core eC Library");
   else
      bigCommentLibrary(z, (s = PrintString(g.lib.moduleName, " Module"))), delete s;
   raw.string = CopyString(z.array); delete z;
   s = g.lib.ecereCOM ? CopyString("//// Core eC Library") : PrintString("//// ", g.lib.moduleName, " Module");
   g.astAdd(raw, true);
}

static void cInHeaderIncludes(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   bigCommentSection(z, "includes");
   if(g.lib.ecereCOM)
   {
      z.printxln("#include <stdio.h>");
      z.printxln("#include <stdint.h>");
      z.printxln("#include <stdarg.h>");
      z.printxln("#include <string.h>");
   }
   else
   {
      for(libDep : g.libDeps)
         z.printxln("#include \"", libDep.bindingName, ".h\"");
   }
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderModuleName(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   z.printxln("");
   if(!g.lib.ecere && !g.lib.ecereCOM)
   {
      z.printxln("#if !defined(", g.lib.defineName, "_MODULE_NAME)");
      z.printxln("#define ", g.lib.defineName, "_MODULE_NAME \"", g.lib.ecereCOM ? "ecere" : g.lib.loadModuleName, "\"");
      z.printxln("#endif");
   }
   if(g.lib.ecereCOM)
   {
      z.printxln("");
      z.printxln("#if !defined(BINDINGS_SHARED)");
      z.printxln("#define LIB_EXPORT");
      z.printxln("#define LIB_IMPORT");
      z.printxln("#elif defined(__WIN32__)");
      z.printxln("#define LIB_EXPORT __attribute__((dllexport)) __attribute__ ((visibility(\"default\")))");
      z.printxln("#define LIB_IMPORT __attribute__((dllimport))");
      z.printxln("#else");
      z.printxln("#define LIB_EXPORT __attribute__ ((visibility(\"default\")))");
      z.printxln("#define LIB_IMPORT");
      z.printxln("#endif");
   }
   z.printxln("");
   z.printxln("#undef THIS_LIB_IMPORT");
   z.printxln("#ifdef ", g.lib.defineName, "_EXPORT");
   z.printxln("#define THIS_LIB_IMPORT LIB_EXPORT");
   z.printxln("#elif defined(BINDINGS_SHARED)");
   z.printxln("#define THIS_LIB_IMPORT LIB_IMPORT");
   z.printxln("#else");
   z.printxln("#define THIS_LIB_IMPORT");
   z.printxln("#endif");

   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderEcereComRuntimeFunctions(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   bigCommentSection(z, "functions");
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(f.isDllExport/* && !skipFunctionTree.Find(fname)*/)
         {
            if(f.easy)
               z.printxln("#define ", f.easy, spaces(cw, strlen(f.easy)), " ", f.gname);
            else
            {
               char * s = getFunctionNameThing(f);
               z.printxln("#define ", s, spaces(cw, strlen(s)), " ", f.gname);
            }
         }
      }
   }
   ns.cleanup();
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

char * getFunctionNameThing(BFunction f)
{
   char * s = null;
   strcpySubstring(f.fname, "eSystem", "eC");
   {
      //if(module is ecere/ecereCOM)
      s = strstr(f.fname, "_");
      if(s && *(++s))
         *s = (char)tolower(*s);
      //endif
      s = f.fname;
      if(*f.fname == 'e'/* && module is ecere/ecereCOM*/)
      {
         if(
               strstr(f.fname, "eInstance_") == f.fname ||
               strstr(f.fname, "eClass_") == f.fname ||
               strstr(f.fname, "eModule_") == f.fname ||
               strstr(f.fname, "eEnum_") == f.fname ||
               strstr(f.fname, "eMember_") == f.fname ||
               strstr(f.fname, "eProperty_") == f.fname
         )
            s++;
         else if(strstr(f.fname, "eC_") == f.fname)
            ;
         else check();
      }
      else/* if(module is ecere/ecereCOM)*/
         *s = (char)tolower(*s);
   }
   return s;
}

static void cInHeaderEcereRuntimeMacros(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   z.printxln("#define ", g.lib.defineName, "_APP_INTRO(c) \\");
   z.printxln("      APP_INTRO(true) \\");
   z.printxln("      ", g.lib.moduleName, "_init(app); \\");
   z.printxln("      loadTranslatedStrings(null, MODULE_NAME); \\");
   z.printxln("      Instance_evolve(&app, class_ ## c);");
   z.printxln("");
   z.printxln("#define ", g.lib.defineName, "_APP_OUTRO \\");
   z.printxln("      unloadTranslatedStrings(MODULE_NAME); \\");
   z.printxln("      APP_OUTRO");
   z.printxln("");
   z.printxln("#define GUIAPP_INTRO ", g.lib.defineName, "_APP_INTRO(GuiApplication)");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderEDARuntimeMacros(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   z.printxln("#define EDA_APP_INTRO(c) \\");
   z.printxln("      APP_INTRO(true) \\");
   z.printxln("      ecere_init(app); \\");
   z.printxln("      EDA_init(app); \\");
   z.printxln("      loadTranslatedStrings(null, MODULE_NAME); \\");
   z.printxln("      Instance_evolve(&app, class_ ## c);");
   z.printxln("");
   z.printxln("#define EDA_GUIAPP_INTRO EDA_APP_INTRO(GuiApplication)");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderLibraryInitPrototype(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   if(g.lib.ecereCOM)
      z.printxln("extern ", !python ? "THIS_LIB_IMPORT " : "", g_.sym.application, " ", g.lib.bindingName, "_init(", g_.sym.module, " fromModule, bool loadEcere, bool guiApp, int argc, char * argv[]);");
   else
      z.printxln("extern ", !python ? "THIS_LIB_IMPORT " : "", g_.sym.module, " ", g.lib.bindingName, "_init(", g_.sym.module, " fromModule);");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderDynamicLinkFunctionImports(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   bool prefixed = false;
   IterNamespace ns { module = g.mod };
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!prefixed && f.isDllExport)
         {
            z.printxln("");
            bigCommentSection(z, "dll function imports");
            z.printxln("");
            prefixed = true;
         }
         if(f.isDllExport)
         {
            TypeInfo qti;
            const char * fname = !python ? f.gname : f.easy ? f.easy : getFunctionNameThing(f);
            ASTNode node = astFunction(fname, (qti = { type = fn.dataType, fn = fn }), { _extern = true, _dllimport = true }, null); delete qti;
            ec2PrintToDynamicString(z, node, true);
         }
      }
   }
   ns.cleanup();
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInHeaderThisModule(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   z.printxln("extern ", g_.sym.module, " __thisModule;");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}
