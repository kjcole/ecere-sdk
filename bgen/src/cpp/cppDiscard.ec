
/*static */void scanTypes(CPPGen g)
{
   IterNamespace ns { module = g.mod };
   while(ns.next())
   {
      IterDefine df { ns.ns };
      IterFunction fn { ns.ns };
      IterClass cl { ns.ns };
      while(df.next())
      {
      }
      while(fn.next())
      {
      }
      while(cl.next(all))
      {
         IterMethod md { cl };
         IterMemberOrProperty or { cl };
         IterProperty pt { cl };
         IterDataMember dm { cl };
         IterConversion cn { cl };
         while(md.next(all))
         {
         }
         while(or.next(all))
         {
         }
         while(pt.next(all))
         {
         }
         while(dm.next(all))
         {
         }
         while(cn.next(all))
         {
         }
      }
   }
   ns.cleanup();
}
