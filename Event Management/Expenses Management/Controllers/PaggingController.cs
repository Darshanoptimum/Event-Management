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
        [HttpPost]
        [Route("api/Eventcount")]
        public HttpResponseMessage addPrice([FromBody] PageEntity Pagedata)
        {
            SerializeResponse<PageEntity> response = new SerializeResponse<PageEntity>();
            try
            {
                InsertLog.WriteErrrorLog("ActivityController => addPrice => insert ");
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
                InsertLog.WriteErrrorLog("UserController => RegisterUser => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response.ID);
        }
        [HttpPost]
        [Route("api/GetEventDataForPage")]
        public HttpResponseMessage GetEventDataForPage([FromBody] PageEntity Pagedata)
        {
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                InsertLog.WriteErrrorLog("ActivityController => addPrice => insert ");
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
                InsertLog.WriteErrrorLog("UserController => RegisterUser => Exception " + ex.Message + ex.StackTrace);
                response.Message = ex.Message;
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
