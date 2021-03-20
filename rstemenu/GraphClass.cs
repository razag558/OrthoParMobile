using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace rstemenu
{
    public class GraphClass
    {
       public int qty { get; set; }
       public String itemName { get; set; }
    }

    public class LineGraph
    {
        public int total { get; set; }

    }

    public class Graph
    {
        public Graph(int start, int end, String total)
        {
            this.start = start;
            this.end = end;
            this.total = total;
        }

        public Graph(int day, String total)
        {
            this.day = day;
            this.total = total;
        }
        public Graph(String monthNames, int totalAmount)
        {
            this.monthNames = monthNames;
            this.totalAmount = totalAmount;
        }

        public Graph(String weekdays, String total)
        {
            this.weekdays = weekdays;
            this.total = total;
        }

        public int start { get; set; }
        public int end { get; set; }
        public int day { get; set; }
        public String monthNames { get; set; }
        public String weekdays { get; set; }
        public String total { get; set; }
        public int totalAmount { get; set; }

    }

    public class LineGraphWeek
    {

        public LineGraphWeek(String day, String total)
        {
            this.day = day;
            this.total = total;
        }

        public String day { get; set; }
        public String total { get; set; }
    }
    public class LineGraphMonth
    {

        public LineGraphMonth(int day, String total)
        {
            this.day = day;
            this.total = total;
        }

        public int day { get; set; }
        public String total { get; set; }
    }
}