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
    public class MonthViseEvent
    {
        // Name : Darshan
        // Date : 24-04-2024
        // get all Month vise event
        /// <summary>
        /// This method return all Month vise event
        /// </summary>
        /// <returns></returns>
        public SerializeResponse<MonthEntity> getAllEvent(MonthEntity mData)
        {
            InsertLog.WriteErrrorLog("MonthViseEvent => getAllEvent => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<MonthEntity> objResponsemessage = new SerializeResponse<MonthEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_monthViseData";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@Name", DbType.String, mData.flag);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Name", DbType.String, mData.MONTH);
                SqlParameter[] Sqlpara = { prm1, prm2 };
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<MonthEntity>(ds.Tables[0]);
                }
            }

            catch (Exception ex)
            {
                objResponsemessage.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("MonthViseEvent => getAllEvent => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
    }
}
