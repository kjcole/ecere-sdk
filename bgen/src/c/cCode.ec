import "genC"

const char * indent;
const char * findin;

void cCode(CGen g)
{
   indent = g.lib.ecereCOM ? "         " : "      ";
   findin = g.lib.ecereCOM ? "app" : "module";

   cInCodeStart(g);
   cInCodeGlobalFunctionPointers(g);
   cInCodeVirtualMethods(g);
   cInCodeMethodFunctionPointers(g);
   cInCodeProperties(g);

   cInCodeClassPointers(g);
   cInCodeVirtualMethodIDs(g);
   cInCodeGlobalFunctions(g);

   cInCodeInitStart(g);
   cInCodeInitClasses(g);
   cInCodeInitFunctions(g);
   cInCodeInitEnd(g);
   if(g.lib.ecereCOM)
      cInCodeThisModule(g);
}

static void cInCodeStart(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   z.printxln("#include \"", g.lib.bindingName, ".h\"");
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeGlobalFunctionPointers(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Global Functions Pointers\n");
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
            z.printxln("LIB_EXPORT ", g.sym.globalFunction, " * FUNCTION(", f.oname, ");");
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeVirtualMethods(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Virtual Methods\n");
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(all)))
      {
         if(!cl.templateClass)
         {
            BClass c = cl;
            Method md; IterMethod met { cl };
            bool haveContent = false;
            while((md = met.next(publicOnly)))
            {
               BMethod m = md;
               m.init(md, c);
               z.printxln("LIB_EXPORT ", g_.sym.method, " * ", m.m, ";");
               haveContent = true;
            }
            if(haveContent) z.printxln("");
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeMethodFunctionPointers(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Methods Function Pointers\n");
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(all)))
      {
         BClass c = cl;
         if(!cl.templateClass)
         {
            Method md; IterMethod met { cl };
            bool haveContent = false;
            while((md = met.next(publicOnly)))
            {
               // skipping Module::Load and Module::Unload here because we want to use the dllexported methods directly
               if(!g.lib.ecereCOM || !(c.isModule && (!strcmp(md.name, "Load") || !strcmp(md.name, "Unload"))))
               {
                  BMethod m = md;
                  m.init(md, c);
                  if(md.type == normalMethod)
                  {
                     TypeInfo qti;
                     ASTNode node = astFunction(m.s, (qti = { type = md.dataType, md = md, cl = cl, m = m, c = c }), { pointer = true }, null); delete qti;
                     ec2PrintToDynamicString(z, node, true);
                  }
                  haveContent = true;
               }
            }
            if(haveContent) z.printxln("");
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeProperties(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Properties\n");
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(all)))
      {
         BClass c = cl;
         if(!cl.templateClass)
         {
            Property pt; IterProperty prop { cl };
            Property cn; IterConversion conv { cl };
            while((pt = prop.next(publicOnly)))
               g.astAdd(astProperty(pt, c, _define, false, &c.first, null), true);
            while((cn = conv.next(publicOnly)))
               g.astAdd(astProperty(cn, c, _define, false, &c.first, null), true);
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeClassPointers(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Classes\n");
   z.printxln("// bitClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(bitOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef/* || c.isUnichar*/ || c.isBool;
            z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
         }
      }
   }
   z.printxln("// enumClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(enumOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef/* || c.isUnichar*/ || c.isBool;
            z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
         }
      }
   }
   z.printxln("// unitClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(unitOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef/* || c.isUnichar*/ || c.isBool;
            z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
         }
      }
   }
   z.printxln("// systemClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(systemOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            if(!c.isUnInt) // hack?
            {
               bool skip = /*c.skipTypeDef || *//*c.isUnichar || */c.isBool;
               z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
            }
         }
      }
   }
   z.printxln("// structClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(structOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef || c.isUnichar || c.isBool;
            z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
         }
      }
   }
   z.printxln("// noHeadClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(noHeadOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef || c.isUnichar || c.isBool;
            z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
         }
      }
   }
   z.printxln("// normalClass");
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(normalOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            if(!c.isCharPtr)
            {
               bool skip = c.skipTypeDef || c.isUnichar || c.isBool;
               if(g_.lib.ecere && c.isWindow) skip = true;
               z.printxln(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * CO(", c.cname, ");");
            }
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeVirtualMethodIDs(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Virtual Method IDs\n");
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(all)))
      {
         BClass c = cl;
         if(!cl.templateClass)
         {
            Method md; IterMethod met { cl };
            bool haveContent = false;
            while((md = met.next(publicVirtual)))
            {
               BMethod m = md;
               m.init(md, c);
               z.printxln("LIB_EXPORT int ", m.v, ";");
               haveContent = true;
            }
            if(haveContent) z.printxln("");
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeGlobalFunctions(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("\n// Global Functions\n");
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
         {
            TypeInfo qti;
            ASTNode node = astFunction(f.oname, (qti = { type = fn.dataType, fn = fn }), { pointer = true }, null); delete qti;
            ec2PrintToDynamicString(z, node, true);
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeInitClasses(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(all)))
      {
         bool content = false;
         BClass c = cl;
         if(!cl.templateClass && !c.skip &&
               !c.isBool && !c.isByte && !c.isCharPtr && !c.isUnInt) //!c.is_class) // !c.isString?
         {
            IterMethod met { cl };
            z.printxln(indent, "CO(", c.cname, ") = eC_findClass(", findin, ", \"", cl.name, "\");");
            if(met.next(publicOnly))
               content = true;
            else
            {
               IterProperty prop { cl };
               if(prop.next(publicOnly))
                  content = true;
               else
               {
                  IterConversion conv { cl };
                  if(conv.next(publicOnly))
                     content = true;
               }
            }
            if(content)
            {
               z.printxln(indent, "if(CO(", c.cname, "))");
               z.printxln(indent, "{");
            }
         }
         if(content)
         {
            Method md; IterMethod met { cl };
            Property pt; IterProperty prop { cl };
            Property cn; IterConversion conv { cl };
            while((md = met.next(publicOnly)))
            {
               // skipping Module::Load and Module::Unload here because we want to use the dllexported methods directly
               if(!g.lib.ecereCOM || !(c.isModule && (!strcmp(md.name, "Load") || !strcmp(md.name, "Unload"))))
               {
                  BMethod m = md;
                  m.init(md, c);
                  if(!c.first)
                     z.printxln("");
                  else
                     c.first = false;
                  z.printxln(indent, "   ", m.m, " = Class_findMethod(CO(", c.cname, "), \"", md.name, "\", ", findin, ");");
                  z.printxln(indent, "   if(", m.m, ")");
                  if(md.type == normalMethod)
                  {
                     z.printx(indent, "      ", m.s, " = (");
                     {
                        TypeInfo qti;
                        ASTNode node = astFunction(null, (qti = { type = md.dataType, md = md, cl = cl }), { pointer = true, anonymous = true }, null); delete qti;
                        ec2PrintToDynamicString(z, node, true);
                        z.size -= 2;
                     }
                     z.printxln(")", m.m, "->function;");
                  }
                  else
                     z.printxln(indent, "      ", m.v, " = ", m.m, "->vid;");
               }
            }
            while((cn = conv.next(publicOnly)))
            {
               ASTNode node = astProperty(cn, c, assign, false, &c.first, null);
               ec2PrintToDynamicString(z, node, true);
            }
            while((pt = prop.next(publicOnly)))
            {
               ASTNode node = astProperty(pt, c, assign, false, &c.first, null);
               ec2PrintToDynamicString(z, node, true);
            }
            z.printxln(indent, "}");
         }
      }
   }
   ns.cleanup();
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeInitFunctions(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   IterNamespace ns { module = g.mod };
   z.printxln("");
   z.printxln("         // Set up all the function pointers, ...");
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
         {
            z.printxln("");
            z.printxln(indent, "FUNCTION(", f.oname, ") = eC_findFunction(", findin, ", \"", f.fname, "\");");
            z.printxln(indent, "if(FUNCTION(", f.oname, "))");
            z.printxln(indent, "   ", f.oname, " = (void *)FUNCTION(", f.oname, ")->function;");
         }
      }
   }
   ns.cleanup();
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeInitStart(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   if(g.lib.ecereCOM)
   {
      z.printxln("LIB_EXPORT ", g_.sym.application, " ", g.lib.bindingName,
            "_init(", g_.sym.module, " fromModule, bool loadEcere, bool guiApp, int argc, char * argv[])");
      z.printxln("{");
      z.printxln("   if(!fromModule)");
      z.printxln("   {");
      z.printxln("      fromModule = eC_initApp(guiApp, argc, argv);");
      z.printxln("      if(fromModule) fromModule->_refCount++;");
      z.printxln("   }");
      z.printxln("   __thisModule = fromModule;");
      z.printxln("   if(fromModule)");
      z.printxln("   {");
      z.printxln("      ", g_.sym.module, " app = fromModule;");
      z.printxln("      ", g_.sym.module, " module = Module_load(fromModule, loadEcere ? \"ecere\" : \"ecereCOM\", ", _publicAccess, ");");
      z.printxln("      if(module)");
      z.printxln("      {");
   }
   else
   {
      z.printxln("LIB_EXPORT ", g_.sym.module, " ", g.lib.bindingName, "_init(", g_.sym.module, " fromModule)");
      z.printxln("{");
      if(g.lib.ecere)
         z.printxln("   ", g_.sym.module, " module = fromModule;");
      else
         z.printxln("   ", g_.sym.module, " module = Module_load(fromModule, ", g_.lib.defineName, "_MODULE_NAME, ", _publicAccess, ");");
      z.printxln("   if(module)");
      z.printxln("   {");
   }
   z.printxln(indent, "// Set up all the CO(x) *, property, method, ...");
   z.printxln("");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeInitEnd(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   if(g.lib.ecereCOM)
      z.printxln("      }");
   z.printxln("   }");
   z.printxln("   else");
   if(g.lib.ecereCOM)
      z.printxln("      printf(\"Unable to load eC module: %s\\n\", loadEcere ? \"ecere\" : \"ecereCOM\");");
   else if(g.lib.ecere)
      z.printxln("      printf(\"Unable to load eC module: ecere\\n\");");
   else
      z.printxln("      printf(\"Unable to load eC module: %s\\n\", ", g.lib.defineName, "_MODULE_NAME);");
   if(g.lib.ecereCOM)
      z.printxln("   return fromModule ? IPTR(fromModule, Module)->application : null;");
   else
      z.printxln("   return module;");
   z.printx("}");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}

static void cInCodeThisModule(CGen g)
{
   ASTRawString raw { }; DynamicString z { };
   z.println("");
   z.printxln(g_.sym.module, " __thisModule;");
   raw.string = CopyString(z.array); delete z;
   g.astAdd(raw, true);
}
