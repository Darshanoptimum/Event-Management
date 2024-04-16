using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web.Http;
using BL;
using Model;

namespace Event_Management.Controllers
{
    public class EventController : ApiController
    {
        // API for insert Event into database
        [HttpPost]
        [Route("api/AddEvent")]
        public HttpResponseMessage AddEvent([FromBody] EventEntity EventInfo)
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("EventController => AddEvent => insert " + EventInfo);
                AddEventInfo addEventInfo = new AddEventInfo();
                //call insertEvent method for add Event
                if (ModelState.IsValid)
                {
                    response = addEventInfo.insertEvent(EventInfo);
                }
                else
                {
                    response.Message = "Values are not valid";
                    return Request.CreateResponse(HttpStatusCode.BadRequest, response);
                }

            }

            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("EventController => AddEvent => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }

            return Request.CreateResponse(HttpStatusCode.OK, response.Message);
        }

        // API for get Non publish(active) Event
        [HttpPost]
        [Route("api/getActiveEvent")]
        public HttpResponseMessage getActiveEvent()
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("EventController => getActiveEvent => insert ");
                getActiveEvent getactiveEvent = new getActiveEvent();
                //call getActiveEventInfo method for get Active Event
                if (ModelState.IsValid)
                {
                    response = getactiveEvent.gertActiveEventInfo();
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
                InsertLog.WriteErrrorLog("EventController => getActiveEvent => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }

            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
        //API for publish Event
        [HttpPost]
        [Route("api/PublishEvent")]
        public HttpResponseMessage PublishEvent([FromBody] EventEntity EventInfo)
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("EventController => PublishEvent => insert ");
                PublishEvent publishEvent = new PublishEvent();
                //call publish method for publish Event
                if (ModelState.IsValid)
                {
                    response = publishEvent.publish(EventInfo);
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
                InsertLog.WriteErrrorLog("EventController => PublishEvent => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }

            return Request.CreateResponse(HttpStatusCode.OK, response.Message);
        }
        //API for get all publish event
        [HttpPost]
        [Route("api/getAllEvent")]
        public HttpResponseMessage getAllEvent()
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("EventController => getAllEvent => insert ");
                GetAllEvent getallEvent = new GetAllEvent();
                //call getAllEvent method get all publish event
                if (ModelState.IsValid)
                {
                    response = getallEvent.getAllEvent();
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
                InsertLog.WriteErrrorLog("EventController => getAllEvent => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }

            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
        //API for get all non publish event's date
        [HttpPost]
        [Route("api/getEventDate")]
        public HttpResponseMessage getEventDate([FromBody] EventEntity eventInfo)
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("EventController => getEventDate => insert ");
                GetDateOfEvent getDateOfEvent = new GetDateOfEvent();
                //call DateOfEvent method for get all non publish event's date
                if (ModelState.IsValid)
                {
                    response = getDateOfEvent.DateOfEvent(eventInfo);
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
                InsertLog.WriteErrrorLog("EventController => getEventDate => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }

            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
