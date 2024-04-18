using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using Model;

namespace Expenses_Management.Controllers
{
    public class AdminController : ApiController
    {
        //  Name : Darshan
        // Date : 05-04-2024
        /// <summary>
        /// Api for CRUD opration of Admin
        /// </summary>
        /// <param name="Admininfo"></param>
        /// <returns></returns>
        //API for Admin login validation
        [HttpPost]
        [Route("api/AdminLogin")]
        public HttpResponseMessage AdminLogin([FromBody] AdminEntity Admininfo)
        {
            SerializeResponse<AdminEntity> response = new SerializeResponse<AdminEntity>();
            try
            {
                InsertLog.WriteErrrorLog("AdminController => AdminLogin => insert " + Admininfo);
                AdminLoginInfo adminLoginInfo = new AdminLoginInfo();
                //call adminLoginInfo method for Admin login validation
                if (ModelState.IsValid)
                {
                    response = adminLoginInfo.adminLogin(Admininfo);
                }
                else
                {
                    response.Message = "Values are not valid";
                    // If Model data is not valid then send bad request as response
                    return Request.CreateResponse(HttpStatusCode.BadRequest, response);
                }
            }
            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("AdminController => AdminLogin => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response.Message);
        }
        //API for Get past Event
        [HttpPost]
        [Route("api/GetpastEvent")]
        public HttpResponseMessage GetpastEvent()
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("AdminController => GetpastEvent => insert ");
                getEventForAdmin adminLoginInfo = new getEventForAdmin();
                //call adminLoginInfo method for Get past Event
                if (ModelState.IsValid)
                {
                    response = adminLoginInfo.getEvent("past");
                }
                else
                {
                    response.Message = "Values are not valid";
                    // If Model data is not valid then send bad request as response
                    return Request.CreateResponse(HttpStatusCode.BadRequest, response);
                }
            }
            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("AdminController => AdminLogin => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
        //API for Get upcoming Event
        [HttpPost]
        [Route("api/GetUpcomingEvent")]
        public HttpResponseMessage GetUpcomingEvent()
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("AdminController => GetUpcomingEvent => insert ");
                getEventForAdmin adminLoginInfo = new getEventForAdmin();
                //call adminLoginInfo method for Get upcoming Event
                if (ModelState.IsValid)
                {
                    response = adminLoginInfo.getEvent("upcoming");
                }
                else
                {
                    response.Message = "Values are not valid";
                    // If Model data is not valid then send bad request as response
                    return Request.CreateResponse(HttpStatusCode.BadRequest, response);
                }
            }
            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("AdminController => GetUpcomingEvent => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
