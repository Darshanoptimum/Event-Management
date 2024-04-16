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
    public class AddPriceOfEvent
    {
        // add price of activity into database
        public SerializeResponse<ActivityEntity> addPriceOfEvent(ActivityEntity activityInfo)
        {
            InsertLog.WriteErrrorLog("AddPriceOfEvent => addPriceOfEvent => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<ActivityEntity> objResponsemessage = new SerializeResponse<ActivityEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_ActivityPrice";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@ActivityId", DbType.String, activityInfo.Id);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Price", DbType.String, activityInfo.Price);

                SqlParameter[] Sqlpara = { prm1, prm2 };
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<ActivityEntity>(ds.Tables[0]);
                    objResponsemessage.Message = Convert.ToString(ds.Tables[0].Rows[0]["Response"]);
                }
            }

            catch (Exception ex)
            {
                objResponsemessage.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("AddPriceOfEvent => addPriceOfEvent => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
    }
}
