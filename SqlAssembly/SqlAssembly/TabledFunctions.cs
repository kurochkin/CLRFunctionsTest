using System;
using System.Collections;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using Microsoft.SqlServer.Server;

namespace SqlAssembly
{
    public class TabledFunctions
    {
        [SqlFunction]
        public static SqlString SqlFunction1()
        {
            // Put your code here
            return new SqlString("My fucking foo 2");
        }

        [SqlFunction(FillRowMethodName = "FillRow")]
        public static IEnumerable SqlFunction2()
        {
            // Put your code here
            var rv = Enumerable.Range(1, 10000).Select(x => new Item {Id = x, Name = "Item #" + x}).ToArray();
            return rv;
        }

        public static void FillRow(Object obj, out SqlInt32 id, out SqlString name)
        {
            var item = (Item)obj;
            id = new SqlInt32(item.Id);
            name = new SqlString(item.Name);
        }

        [SqlProcedure]
        public static void TestStoredProcedureCode()
        {
            var dt = new DataTable();
            dt.Columns.Add("Id", typeof (int));
            dt.Columns.Add("Name", typeof (string));

            for (int i = 0; i < 1000; i++)
            {
                var row = dt.NewRow();
                row["Id"] = i;
                row["Name"] = "Name: " + i;
                dt.Rows.Add(row);
            }

            DataSetUtilities.SendDataTable(dt);
        }
    }


    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}