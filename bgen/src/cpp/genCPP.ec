import "bgen"
import "cppHardcoded"

class CPPGen : CGen
{
   char * cppFileName;
   char * cppFilePath;
   char * hppFileName;
   char * hppFilePath;

   lang = CPlusPlus;

   bool init()
   {
      bool result = false;
      if(Gen::init() && readyDir())
      {
         prepPaths(true);

         if(FileExists(cppFileName))
            DeleteFile(cppFileName);
         if(FileExists(hppFileName))
            DeleteFile(hppFileName);

         if(!FileExists(cppFileName) && !FileExists(hppFileName))
         {
            reset();

            moduleInit();
            result = true;
         }
      }
      return result;
   }

   void process()
   {
      prepareNamespaces();
      processNamespaces();
      bmod.applyDependencies();
      for(n : bmod.orderedNamespaces)
         n.positionOutput(this);
      bmod.sort();
      bmod.moveBackwardsDependencies();
      for(n : bmod.orderedNamespaces)
         n.sort();
   }

   void processNamespaces()
   {
      IterNamespace ns { module = mod, processFullName = true };
      while(ns.next())
      {
         BNamespace n = (NameSpacePtr)ns.ns;
         if(!bmod.root_nspace)
         {
            bmod.root_nspace = (NameSpacePtr)ns.ns;
         }
         //processDefines(n);
         //if(lib.ecereCOM && ns.ns->parent == null && ns.ns->name == null)
         //   manualTypes(n);
         processClasses(n);
         //processOptionalClasses(n);
         //processFunctions(n);
      }
      processTemplatons();
      ns.cleanup();
   }

   void processClasses(BNamespace n)
   {
      BClass c; IterClass itc { n.ns };
      while((c = itc.next(all)))
      {
         bool skip = c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.cl.type == systemClass;
         if(!skip && !c.cl.templateClass)
            processCppClass(this, c);
      }
   }

   void generate()
   {
      File f;
      f = FileOpen(hppFilePath, write);
      if(f)
      {
         generateHPP(this, f);
         delete f;
      }
      f = FileOpen(cppFilePath, write);
      if(f)
      {
         generateCPP(this, f);
         delete f;
      }
      {
         char * cppFilePathTmp = cppFilePath;
         char * hppFilePathTmp = hppFilePath;
         cppFilePath = null;
         hppFilePath = null;
         prepPaths(false);
         if(FileExists(cppFilePath))
            DeleteFile(cppFilePath);
         if(FileExists(hppFilePath))
            DeleteFile(hppFilePath);
         MoveFile(cppFilePathTmp, cppFilePath);
         MoveFile(hppFilePathTmp, hppFilePath);
         delete cppFilePathTmp;
         delete hppFilePathTmp;
      }
   }

   void printOutputFiles()
   {
      if(!quiet)
      {
         PrintLn(lib.verbose > 1 ? "    " : "", cppFileName);
         PrintLn(lib.verbose > 1 ? "    " : "", hppFileName);
      }
   }

   void prepPaths(bool tmp)
   {
      int len;
      char * name = new char[MAX_LOCATION];
      char * path = new char[MAX_LOCATION];
      strcpy(path, dir.dir);
      len = strlen(path);
      strcpy(name, lib.bindingName);
      ChangeExtension(name, "cpp", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete cppFileName; cppFileName = CopyString(name);
      delete cppFilePath; cppFilePath = CopyString(path);
      ChangeExtension(name, "hpp", name);
      path[len] = 0;
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete hppFileName; hppFileName = CopyString(name);
      delete hppFilePath; hppFilePath = CopyString(path);
      delete name;
      delete path;
   }

   void reset()
   {
      ec1terminate();
   }

   ~CPPGen()
   {
      delete cppFileName;
      delete hppFileName;
   }
}

static void generateHPP(CPPGen g, File f)
{
   cppHeaderStart(g, f);
   if(g.lib.ecereCOM)
      cppHardcodedCore(f);
   outputContents(f, g);
   cppHeaderEnd(g, f);
}

static void generateCPP(CPPGen g, File f)
{
   Class firstClass = null;
   f.PrintLn("#include \"", g.lib.name, ".hpp\"");
   f.PrintLn("");
   {
      IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while(itacl.next(all))
      {
         Class cl = itacl.cl;
         if(cl.type == normalClass && !cl.templateClass)
         {
            firstClass = cl;
            f.PrintLn("TCPPClass<", cl.name, "> ", cl.name, "::_class;");
         }
      }
   }
   f.PrintLn("void ", g.lib.name, "_cpp_init(Module & module)");
   f.PrintLn("{");
   f.PrintLn("   if(!", firstClass.name, "::_class.impl)");
   f.PrintLn("   {");
   {
      IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while(itacl.next(all))
      {
         Class cl = itacl.cl;
         if(cl.type == normalClass && !cl.templateClass)
         {
            f.PrintLn("REGISTER_CPP_CLASS(", cl.name, ", module);");
         }
      }
   }
   f.PrintLn("   }");
   f.PrintLn("}");
   f.PrintLn("");
   if(g.lib.ecere) // hardcoded
   {
      f.PrintLn("// Instance methods depending on libecere");
      f.PrintLn("void Instance::class_registration(CPPClass & _class) { Instance_class_registration(Instance); }");
      f.PrintLn("void FontResource::class_registration(CPPClass & _class) { Instance_class_registration(FontResource); }");
   }
}

static void processCppClass(CPPGen g, BClass c)
{
   int l, nameLen = 0;
   BVariant v = c;
   BNamespace n = c.nspace;
   BClass cBase = c.cl.base;
   BOutput o { vclass, c = c, ds = { } };
   BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
   const char * sn = c.symbolName, * cn = c.name, * bn = cBase ? cBase.name : "";
   char * un = CopyAllCapsString(c.name);

   c.outTypedef = o;
   n.contents.Add(v);

   /*switch(c.cl.type)
   {
      case normalClass:  processNormalClass(g, c, v, n, o); break;
      case structClass:
      case bitClass:
      case unitClass:
      case enumClass:
      case noHeadClass:
      case systemClass:
   }*/

   while((m = itm.next(publicVirtual))) { m.init(itm.md, c.isInstance ? cBase : c); if((l = strlen(m.mname)) > nameLen) nameLen = l;}

   if(c.isInstance)
   {
      o.ds.println("");
      while((m = itm.next(publicVirtual)))
      {
         const char * cn = c.name, * bn = cBase.name, * mn = m.mname;
         o.ds.printxln("#define M_VTBLID(", cn, ", ", mn, ")", spaces(nameLen, strlen(mn)), " M_VTBLID(", bn, ", ", mn, ")");
      }
   }

   o.ds.printx(ln, "//#define ", c.name, "_class_registration(d) \\", ln);
   while((m = itm.next(publicVirtual)))
   {
      const char * on = m.name, * mn = m.mname;
      o.ds.printx("   //REGISTER_TYPED_METHOD(\"", on, "\", ", mn, ", ", cn, ", d, int, (Class * _class, ", sn, " o, ", sn, " o2), \\", ln,
                  "   //   o, o, return fn(*i, *(", cn, " *)INSTANCEL(o2, o2->_class)), (_class, o, o2), 1); \\", ln);
   }

   o.ds.printx(ln, "//#define ", un, "_VIRTUAL_METHODS(c) \\", ln);
   while((m = itm.next(publicVirtual)))
   {
      const char * mn = m.mname, * tn = m.s;
      o.ds.printx("   //VIRTUAL_METHOD(", mn, ", c, ", cn, ", \\", ln,
                  "   //   int, c & _ARG, , c & b, \\", ln,
                  "   //   return ", tn, "(_class.impl, self ? self->impl : (", sn, ")null, &b ? b.impl : (", sn, ")null)); \\", ln);
   }

   o.ds.printx(ln, "class ", cn);
   if(cBase && cBase.cl.type != systemClass)
      o.ds.printx(" : public ", bn);
   o.ds.printx(ln, "{", ln, "public:", ln);
   if(c.isInstance)
      cppHardcodedInstance(o);
   else if(c.isModule)
      cppHardcodedModule(o);
   else
   {
      o.ds.printx("   CONSTRUCT(", cn, ", ", bn, ") { }", ln);
   }

   o.ds.printx("};", ln);

   delete un;
}

/*static void processNormalClass(CPPGen g, BClass c, BVariant v, BNamespace n, BOutput o)
{
}*/

static void outputContents(File out, CPPGen g)
{
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      /*for(vv : n.contents)
      {
         BOutput o = (BOutput)optr;
         out.Puts(o.ds.array);
      }*/
//      /*
      if(n.orderedBackwardsOutputs.count)
      {
         //g.astAdd(ASTRawString { string = CopyString("// start -- moved backwards outputs") }, true);
         for(optr : n.orderedBackwardsOutputs)
         {
            BOutput o = (BOutput)optr;
            out.Puts(o.ds.array);
         }
         //g.astAdd(ASTRawString { string = CopyString("// end -- moved backwards outputs") }, true);
      }
      for(optr : n.orderedOutputs)
      {
         BOutput o = (BOutput)optr;
         if(o.kind == vmanual || o.kind == vdefine || o.kind == vfunction ||
               o.kind == vclass || o.kind == vtemplaton || o.kind == vmethod || o.kind == vproperty)
         {
            out.Puts(o.ds.array);
         }
         else check();
      }
//      */
   }
}

static void cppHeaderStart(CPPGen g, File f)
{
   //cInHeaderFileComment(g);
   //cInHeaderProcessSourceFile(g, null, ":src/C/c_header_open.src"); //cInHeaderPreprocessorOpen(g);
   //cInHeaderIncludes(g);

   f.PrintLn("// Preprocessor directives can be added at the beginning (Can't store them in AST)");
   f.PrintLn("");
   f.PrintLn("/****************************************************************************");
   f.PrintLn("===========================================================================");
   if(g.lib.ecereCOM)
      f.PrintLn("   Core eC Library");
   else
     f.PrintLn("   ", g.lib.moduleName, " Module");
   f.PrintLn("===========================================================================");
   f.PrintLn("****************************************************************************/");
   f.PrintLn("#if !defined(__", g.lib.defineName, "_HPP__)");
   f.PrintLn("#define __", g.lib.defineName, "_HPP__");
   f.PrintLn("");
   if(g.lib.ecereCOM)
   {
      f.PrintLn("#define ECPRFX eC_");
      f.PrintLn("");
   }
   else
   {
      // hack
      // todo, dependency iterating?
      f.PrintLn("#include \"eC.hpp\"");
      if(!strcmp(g.lib.moduleName, "gnosis2")) // hack, todo
      {
         f.PrintLn("#include \"ecere.hpp\"");
         f.PrintLn("#include \"EDA.hpp\"");
      }
      /*else
         f.PrintLn("#include \"ecere.hpp\"");*/
   }
   f.PrintLn("#include \"", g.lib.bindingName, ".h\"");
   f.PrintLn("");
}

static void cppHeaderEnd(CPPGen g, File f)
{
   f.PrintLn("");
   f.PrintLn("#endif // !defined(__", g.lib.defineName, "_HPP__)");
}
