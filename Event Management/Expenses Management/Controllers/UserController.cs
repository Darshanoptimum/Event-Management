using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using Model;

namespace Event_Management.Controllers
{
    public class UserController : ApiController
    {
        //  Name : Darshan
        // Date : 05-04-2024
        /// <summary>
        /// Api for CRUD opration of User
        /// </summary>
        /// <param name="Admininfo"></param>
        /// <returns></returns>
        // API for register user
        [HttpPost]
        [Route("api/RegisterUser")]
        public HttpResponseMessage RegisterUser([FromBody] UserEntity UserInfo)
        {
            SerializeResponse<UserEntity> response = new SerializeResponse<UserEntity>();
            try
            {
                InsertLog.WriteErrrorLog("UserController => RegisterUser => insert " + UserInfo);
                insertUser insertuser = new insertUser();
                //call insertUserInfo method register user
                if (ModelState.IsValid)
                {
                    response = insertuser.insertUserInfo(UserInfo);
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
                InsertLog.WriteErrrorLog("UserController => RegisterUser => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response.Message);
        }
        // API for User Login validation
        [HttpPost]
        [Route("api/UserLogin")]
        public HttpResponseMessage UserLogin([FromBody] UserEntity UserInfo)
        {
            SerializeResponse<UserEntity> response = new SerializeResponse<UserEntity>();
            try
            {
                InsertLog.WriteErrrorLog("UserController => UserLogin => insert " + UserInfo);
                UserLoginInfo userLoginInfo = new UserLoginInfo();
                //call userLogin method for User Login validation
                if (ModelState.IsValid)
                {
                    response = userLoginInfo.userLogin(UserInfo);
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
                InsertLog.WriteErrrorLog("UserController => UserLogin => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response.Message);
        }
        //API for get Published Events for userdashboard
        [HttpPost]
        [Route("api/publishedEvent")]
        public HttpResponseMessage PublishedEvent()
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("UserController => publishedEvent => strat");
                publishedEvent publishedevent = new publishedEvent();
                //call publishevents method for get Published Events for userdashboard
                if (ModelState.IsValid)
                {
                    response = publishedevent.publishevents();
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
                InsertLog.WriteErrrorLog("UserController => publishedEvent => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
        // API for Get Events and Activity for userdashboard
        [HttpPost]
        [Route("api/AllEventsinfo")]
        public HttpResponseMessage AllEventsinfo([FromBody] EventActivityEntity eventinfo)
        {
            SerializeResponse<EventActivityEntity> response = new SerializeResponse<EventActivityEntity>();
            try
            {
                InsertLog.WriteErrrorLog("UserController => AllEventsinfo => strat ");
                Alleventsinfo alleventsinfo = new Alleventsinfo();
                //call publishevents method for  Get Events and Activity for userdashboard
                if (ModelState.IsValid)
                {
                    response = alleventsinfo.publishevents(eventinfo);
                    // Convert image path into image base64 string
                    foreach(var arr in response.ArrayOfResponse)
                    {
                        // call StringToImage method for convert image path into image base64 string
                        string imgstring = StringConvert.StringToImage(arr.EventImage);
                        // replace string
                        arr.EventImage=imgstring;
                    }
                    
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
                InsertLog.WriteErrrorLog("UserController => AllEventsinfo => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
