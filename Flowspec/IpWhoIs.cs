using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using Newtonsoft.Json;
using System.IO;



namespace Flowspec
{
    public class IpWhoIs
    {
        public static IpLookup WhoIs(string IP)
        {
            try
            {
                string url = string.Format(@"http://ip-api.com/json/{0}", IP);
                //Uri uri = new Uri(url);
                WebRequest webRequest = WebRequest.Create(url);
                WebResponse response = webRequest.GetResponse();
                StreamReader streamReader = new StreamReader(response.GetResponseStream());
                var responseData = streamReader.ReadToEnd();
                IpLookup values = JsonConvert.DeserializeObject<IpLookup>(responseData);
                return values;
            }
            catch (Exception)
            {

                IpLookup values = new IpLookup();
                values.status = "";
                values.org = "";
                values.regionName = "";
                return values;
            }
           
            

        }

        public class IpLookup
        {
            public string status { get; set; }
            public string org { get; set; }
            public string regionName { get; set; }
        }
        
        

    }
}