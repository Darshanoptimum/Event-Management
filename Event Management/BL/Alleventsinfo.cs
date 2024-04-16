using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIBRARY;
using Model;
using System.Reflection;

namespace BL
{
    public class Alleventsinfo
    {
        // get publish event 
        public SerializeResponse<EventActivityEntity> publishevents(EventActivityEntity eventsinfo)
        {
            InsertLog.WriteErrrorLog("Alleventsinfo => publishevents => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<EventActivityEntity> objResponsemessage = new SerializeResponse<EventActivityEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_AllEventwithActivity";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@EventId", DbType.String, eventsinfo.Id);
                SqlParameter[] Sqlpara = { prm1 };
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<EventActivityEntity>(ds.Tables[0]);
                    objResponsemessage.Message = Convert.ToString(ds.Tables[0].Rows[0]["Response"]);
                }

            }

            catch (Exception ex)
            {
                objResponsemessage.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("Alleventsinfo => publishevents => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
    }
}
