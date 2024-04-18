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
    public class PaggingController : ApiController
    {
        //  Name : Darshan
        // Date : 12-04-2024
        /// <summary>
        /// Api for Pagging
        /// </summary>
        /// <param name="Admininfo"></param>
        /// <returns></returns>
        // this API return the count of published event
        [HttpPost]
        [Route("api/Eventcount")]
        public HttpResponseMessage Eventcount([FromBody] PageEntity Pagedata)
        {
            SerializeResponse<PageEntity> response = new SerializeResponse<PageEntity>();
            try
            {
                InsertLog.WriteErrrorLog("PaggingController => Eventcount => insert ");
                PaggingHelper pagecount = new PaggingHelper();
                //call addPriceOfEvent method for add activity price
                if (ModelState.IsValid)
                {
                    response = pagecount.pageCount(Pagedata);
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
                InsertLog.WriteErrrorLog("PaggingController => Eventcount => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response.ID);
        }
        //This API rerurn the event data as per page number and per page event 
        [HttpPost]
        [Route("api/GetEventDataForPage")]
        public HttpResponseMessage GetEventDataForPage([FromBody] PageEntity Pagedata)
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("PaggingController => GetEventDataForPage => insert ");
                PaggingHelper pagecount = new PaggingHelper();
                //call addPriceOfEvent method for add activity price
                if (ModelState.IsValid)
                {
                    response = pagecount.PageData(Pagedata);
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
                InsertLog.WriteErrrorLog("PaggingController => GetEventDataForPage => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
