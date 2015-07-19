using System;
using System.Collections;
using System.Data.SqlTypes;
using System.Diagnostics;

namespace SqlAssembly
{
    public class TabledFunctions
    {
        //[Microsoft.SqlServer.Server.SqlFunction]
        //public static SqlString SqlFunction1()
        //{
        //    // Put your code here
        //    return new SqlString("My fucking foo 2");
        //}

        [Microsoft.SqlServer.Server.SqlFunction(FillRowMethodName = "FillRow")]
        public static IEnumerable SqlFunction2()
        {
            // Put your code here
            return new [] {new Item {Id = 1, Name = "adsfasdf"}, new Item {Id = 2, Name = "adsfasdddddf"}};
        }

        public static void FillRow(Object obj, out SqlInt32 id, out SqlString name)
        {
            Item eventLogEntry = (Item)obj;
            id = new SqlInt32(eventLogEntry.Id);
            name = new SqlString(eventLogEntry.Name);
        }
    }


    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}