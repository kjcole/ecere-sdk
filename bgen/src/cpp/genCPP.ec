import "bgen"
import "cppHardcoded"

AVLTree<consttstr> tmpclincl
{ [
   { "eC", "Surface" },
   { "eC", "IOChannel" },
   { "eC", "Window" },
   { "eC", "DataBox" },
   { "eC", "Instance" },
   { "eC", "Module" },
   { "eC", "Application" },
   { "eC", "Container" },
   { "eC", "Array" },
   { "eC", "CustomAVLTree" },
   { "eC", "AVLTree" },
   { "eC", "Map" },
   { "eC", "LinkList" },
   { "eC", "List" },
   { "eC", "SerialBuffer" },
   { "eC", "OldArray" },
   { "eC", "" },
   { null, null }
] };

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
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g_.lib.ecereCOM && !tmpclincl.Find({ g_.lib.bindingName, c.name }))
            skip = true;
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

   char * allocMacroSymbolName(const bool noMacro, const MacroType type, const TypeInfo ti, const char * name, const char * name2, int ptr)
   {
      switch(type)
      {
         case C:
            if(noMacro)    return                CopyString(name);
            if((ti.c && ti.c.isBool) ||
                  (ti.c && ti.c.cl.type == normalClass) ||
                  (ti.cl && ti.cl.type == normalClass))
                           return                CopyString(name);
                           return PrintString(       "C(" , name, ")");
         case CM:          return PrintString(       "CM(", name, ")");
         case CO:          return PrintString(       "CO(", name, ")");
         case SUBCLASS:    return PrintString( "subclass(", name, ")");
         case THISCLASS:   return PrintString("thisclass(", name, ptr ? " *" : "", ")");
         case T:           return getTemplateClassSymbol(   name, false);
         case TP:          return PrintString(       "TP(", name, ", ", name2, ")");
         case METHOD:      return PrintString(   "METHOD(", name, ", ", name2, ")");
         case PROPERTY:    return PrintString( "PROPERTY(", name, ", ", name2, ")");
         case M_VTBLID:    return PrintString( "M_VTBLID(", name, ", ", name2, ")");
      }
      return CopyString(name);
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
   predefineClasses(g, f);
   outputContents(g, f);
   cppHeaderEnd(g, f);
}

void predefineClasses(CPPGen g, File f)
{
   BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
   f.PrintLn("");
   while((c = itacl.next(all)))
   {
      bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
      if(g.lib.ecereCOM && !tmpclincl.Find({ g.lib.bindingName, c.name }))
         skip = true;
      if(!skip && !c.cl.templateClass)
         f.PrintLn("class ", c.name, ";");
   }
   f.PrintLn("");
}

static void generateCPP(CPPGen g, File f)
{
   Class firstClass = null;
   f.PrintLn("#include \"", g.lib.bindingName, ".hpp\"");
   f.PrintLn("");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g.lib.ecereCOM && !tmpclincl.Find({ g.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && c.cl.type == normalClass && !c.cl.templateClass)
         {
            firstClass = c.cl;
            f.PrintLn("TCPPClass<", c.cl.name, "> ", c.cl.name, "::_class;");
         }
      }
   }
   f.PrintLn("");
   f.PrintLn("void ", g.lib.name, "_cpp_init(Module & module)");
   f.PrintLn("{");
   f.PrintLn("   if(!", firstClass.name, "::_class.impl)");
   f.PrintLn("   {");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g.lib.ecereCOM && !tmpclincl.Find({ g.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && c.cl.type == normalClass && !c.cl.templateClass)
            f.PrintLn("      REGISTER_CPP_CLASS(", c.cl.name, ", module);");
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
   // todo tofix tocheck tmp? skip to template class name for derrivation
   BClass cBase = c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base;
   BOutput o { vclass, c = c, ds = { } };
   BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
   const char * sn = c.symbolName, * cn = c.name, * bn = cBase ? cBase.name : "";
   char * un = CopyAllCapsString(c.name);
   bool hasBase = cBase && cBase.cl.type != systemClass;
   bool first;
   TypeInfo ti;

   c.outTypedef = o;
   n.contents.Add(v);
   if(hasBase)
      v.processDependency(otypedef, otypedef, cBase.cl);

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
         o.ds.printxln("#define ", cn, "_", mn, "_vTblID", spaces(nameLen, strlen(mn)), " ", bn, "_", mn, "_vTblID");
      }
   }

   o.ds.printx(ln, "//#define ", c.name, "_class_registration(d)"/*" \\"*/, ln);
   while((m = itm.next(publicVirtual)))
   {
      const char * on = m.name, * mn = m.mname;
      o.ds.printx("   //REGISTER_TYPED_METHOD(\"", on, "\", ", mn, ", ", cn, ", d, int, (Class * _class, ", sn, " o, ", sn, " o2),"/*" \\"*/, ln,
                  "   //   o, o, return fn(*i, *(", cn, " *)INSTANCEL(o2, o2->_class)), (_class, o, o2), 1);"/*" \\"*/, ln);
   }

   o.ds.printx(ln, "#define ", un, "_VIRTUAL_METHODS(c) \\", ln);
   first = true;
   while((m = itm.next(publicVirtual)))
   {
      const char * mn = m.mname, * tn = m.s;
      if(!first)
         o.ds.printx(" \\", ln);
      else
         first = false;
      ti = { type = m.md.dataType.returnType, md = m.md, cl = c.cl };
      o.ds.printx("   VIRTUAL_METHOD(", mn, ", c, ", cn, ", \\", ln,
                  "      ", (s = cppTypeName(ti)), ", c & _ARG, , c & b, \\", ln,
                  "      return ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null, &b ? b.impl : (", sn, ")null));");
      delete s;
   }
   o.ds.printx(ln);

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

char * cppTypeName(TypeInfo ti)
{
   char * result;
   DynamicString z { };
   // note: calling zTypeName creates templaton output objects with null ds
   zTypeName(z, null, ti, { anonymous = true }, null);
   result = CopyString(z.array);
   delete z;
   return result;
/*
   char * name = null;

      SpecsList quals = null;

   if(ti && ti.type)
   {
      int ptr = 0;
      Type t = unwrapPointerType(ti.type, &ptr);
      SpecialType st = specialType(t);
      switch(st)
      {
         case normal:

            break;
         case baseClass:
         case typedObject:
         case anyObject:
            shh();
            break;
      }
   }
   return name;
*/
}

void cppTypeSpec(DynamicString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToDynamicString(z, list, false);
   list.Free();
   delete list;
}


/*static void processNormalClass(CPPGen g, BClass c, BVariant v, BNamespace n, BOutput o)
{
}*/

static void outputContents(CPPGen g, File out)
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
            if(o.ds)
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
