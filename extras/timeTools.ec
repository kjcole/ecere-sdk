#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

Time QuickTime()
{
   DateTime time;
   time.GetLocalTime();
   return time.hour * 60 * 60 + time.minute * 60 + time.second;
}

public class TimeGate
{
private:
   Time from;
public:
   Time delay;

   property bool elapsed
   {
      get
      {
         Time time = GetTime();
         if(!from || time - from > delay)
         {
            from = time;
            return true;
         }
         return false;
      }
   }
}

public struct TimeMeasure
{
private:
   DateTime from;
   DateTime to;

public:

   void begin() { from.GetLocalTime(); }
   void end() { to.GetLocalTime(); };
   void print()
   {
      bool cycle;
      int sec, min, hour, day = 0, month = 0, year = 0;
      int plus = 0;
      cycle = to.second < from.second;
      sec = (cycle ? 60 - from.second + to.second : to.second - from.second);
      plus = sec >= 60 ? 1 : 0;
      if(plus) sec -= 60;
      cycle = to.minute < from.minute;
      min = (cycle ? 60 - from.minute + to.minute : to.minute - from.minute) + plus;
      plus = min >= 60 ? 1 : 0;
      if(plus) hour -= 60;
      cycle = to.hour < from.hour;
      hour = (cycle ? 24 - from.hour + to.hour : to.hour - from.hour) + plus;
      plus = hour >= 24 ? 1 : 0;
      if(plus) hour -= 24;
      // todo: day, month, year, etc
      //PrintLn(year ? "year" : "",
      if(year) Print(year, "y");
      if(month) Print(month, "m");
      if(day) Print(day, "d");
      if(hour) Print(hour, "h");
      if(min) Print(min, "m");
      Print(sec, "s");
      PrintLn("");
   }
};
