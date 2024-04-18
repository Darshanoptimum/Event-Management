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
    public class UserLoginInfo
    {
        // Name : Darshan
        // Date : 05-04-2024
        // user login validation
        /// <summary>
        /// This method validate user data
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public SerializeResponse<UserEntity> userLogin(UserEntity user)
        {
            InsertLog.WriteErrrorLog("UserLoginInfo => userLogin => Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<UserEntity> objResponsemessage = new SerializeResponse<UserEntity>();
            // create data set for store data tables set
            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "SP_UserLogIn";
            try
            {
                // call connection string
                string Con_str = Connection.constrSMC();
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@Name", DbType.String, user.Name);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@EmailId", DbType.String, user.Email);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@Password", DbType.String, user.Password);
                SqlParameter[] Sqlpara = { prm1, prm2, prm3};
                // call sql helper class method for execute stored proc
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    // convert data table into response array
                    objResponsemessage.ArrayOfResponse = bl.ListConvertDataTable<UserEntity>(ds.Tables[0]);
                    objResponsemessage.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);
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
