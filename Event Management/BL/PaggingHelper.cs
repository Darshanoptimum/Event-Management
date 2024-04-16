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
    public class PaggingHelper
    {
        public SerializeResponse<PageEntity> pageCount(PageEntity Page)
        {
            InsertLog.WriteErrrorLog("UserLoginInfo => userLogin => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<PageEntity> objResponsemessage = new SerializeResponse<PageEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_PublishedEventCount";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter[] Sqlpara = {  };
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<PageEntity>(ds.Tables[0]);
                    objResponsemessage.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["C"]);
                }
            }

            catch (Exception ex)
            {
                objResponsemessage.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("UserLoginInfo => userLogin => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
        public SerializeResponse<EventEntity> PageData(PageEntity Page)
        {
            InsertLog.WriteErrrorLog("UserLoginInfo => userLogin => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<EventEntity> objResponsemessage = new SerializeResponse<EventEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_PublishedEventForPagging";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@page", DbType.String, Page.Page);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@EventPerPage", DbType.String, Page.EventPerPage);

                SqlParameter[] Sqlpara = { prm1 , prm2 };
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
                InsertLog.WriteErrrorLog("UserLoginInfo => userLogin => Exception" + ex.Message + ex.StackTrace);
            }
            return objResponsemessage;
        }
    }
}
