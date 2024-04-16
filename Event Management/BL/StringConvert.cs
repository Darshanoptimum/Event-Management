using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using static System.Net.Mime.MediaTypeNames;

namespace BL
{
    public static class StringConvert
    {
        // convert base64 string into image and save into storage and return path
        public static string imgToString(EventEntity Event)
        {
            // create image path
            string path = AppDomain.CurrentDomain.BaseDirectory + "image\\img_" + DateTime.Now.ToString().Replace(':', '-') + ".jpg";
            try
            {
                
                if (!Directory.Exists(path.Substring(0, path.LastIndexOf('\\'))))
                {
                    // create if Directory not exists
                    Directory.CreateDirectory(path.Substring(0, path.LastIndexOf('\\')));
                }
                if (!File.Exists(path))
                {
                    // create if File not exists
                    File.Create(path).Close();
                }
                //  convert string into image and store at path
                File.WriteAllBytes(path, Convert.FromBase64String(Event.image.Split(',')[1]));
            }
            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("StringConvert => imgToString => Exception" + ex.Message + ex.StackTrace);
            }
            return path;
        }
        // Convert path into base64 string 
        public static string StringToImage(string path)
        {
            string base64ImageRepresentation=null;
            try
            {
                // create byte array 
                byte[] imageArray = System.IO.File.ReadAllBytes(path);
                // convert byte array into base64 string
                base64ImageRepresentation = Convert.ToBase64String(imageArray);
            }
            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("StringConvert => StringToImage => Exception" + ex.Message + ex.StackTrace);
            }
            return base64ImageRepresentation;
        }
    }
}
