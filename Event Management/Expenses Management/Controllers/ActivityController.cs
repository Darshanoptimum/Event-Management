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
    public class ActivityController : ApiController
    {
        //API for add activity into database
        [HttpPost]
        [Route("api/addActivity")]
        public HttpResponseMessage addActivity([FromBody] ActivityEntity activityInfo)
        {
            SerializeResponse<ActivityEntity> response = new SerializeResponse<ActivityEntity>();
            try
            {
                InsertLog.WriteErrrorLog("ActivityController => addActivity => insert");
                InsertActivity insertActivity = new InsertActivity();
                //call InsertActivityInfo method for add activity
                if (ModelState.IsValid)
                {
                    response = insertActivity.InsertActivityInfo(activityInfo);
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
                InsertLog.WriteErrrorLog("ActivityController => addActivity => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response.Message);
        }
        //API for get Activity 
        [HttpPost]
        [Route("api/getActivity")]
        public HttpResponseMessage getActivity([FromBody] ActivityEntity activityInfo)
        {
            SerializeResponse<ActivityEntity> response = new SerializeResponse<ActivityEntity>();
            try
            {
                InsertLog.WriteErrrorLog("ActivityController => getActivity => insert ");
                GetActivity getActivity = new GetActivity();
                //call GetActivityInfo method for get Activity 
                if (ModelState.IsValid)
                {
                    response = getActivity.GetActivityInfo(activityInfo);
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
                InsertLog.WriteErrrorLog("ActivityController => getActivity => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
        // API for add activity price
        [HttpPost]
        [Route("api/addPrice")]
        public HttpResponseMessage addPrice([FromBody] ActivityEntity activityInfo)
        {
            SerializeResponse<ActivityEntity> response = new SerializeResponse<ActivityEntity>();
            try
            {
                InsertLog.WriteErrrorLog("ActivityController => addPrice => insert ");
                AddPriceOfEvent addPriceOfEvent = new AddPriceOfEvent();
                //call addPriceOfEvent method for add activity price
                if (ModelState.IsValid)
                {
                    response = addPriceOfEvent.addPriceOfEvent(activityInfo);
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
    }
}
