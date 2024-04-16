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
    public class AddEventInfo
    {
        //insert event into database
        public SerializeResponse<EventEntity> insertEvent(EventEntity Event)
        {
            InsertLog.WriteErrrorLog("AddEventInfo => insertEvent => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<EventEntity> objResponsemessage = new SerializeResponse<EventEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            String imgPath=StringConvert.imgToString(Event);
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_InsertEvent";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@EventName", DbType.String, Event.EventName);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@StartDate", DbType.String, Event.EventStartDate);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@EndDate", DbType.String, Event.EventEndDate);
                SqlParameter prm4 = objSDP.CreateInitializedParameter("@Image", DbType.String, imgPath);
                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4 };
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objResponsemessage.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);
                    objResponsemessage.Message = Convert.ToString(ds.Tables[0].Rows[0]["Response"]);
                }
            }

            catch (Exception ex)
            {
                objResponsemessage.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("insertUser => insertUserInfo => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
    }
}



