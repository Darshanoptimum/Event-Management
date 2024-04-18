using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIBRARY;
using Model;

namespace BL
{
    public class PublishEvent
    {
        // Name : Darshan
        // Date : 05-04-2024
        //publish event
        /// <summary>
        /// This method pulish the specific event using given Event ID
        /// </summary>
        /// <param name="eventInfo"></param>
        /// <returns></returns>
        public SerializeResponse<EventEntity> publish(EventEntity eventInfo)
        {
            InsertLog.WriteErrrorLog("PublishEvent => publish => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<EventEntity> objResponsemessage = new SerializeResponse<EventEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_PublishEvent";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@EventId", DbType.String, eventInfo.Id);

                SqlParameter[] Sqlpara = { prm1 };
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objResponsemessage.Message = Convert.ToString(ds.Tables[0].Rows[0]["Response"]);
                }
            }

            catch (Exception ex)
            {
                objResponsemessage.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("PublishEvent => publish => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
    }
}
