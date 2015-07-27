using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Services;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Web.Script.Serialization;
using System.Text;



namespace Flowspec
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        [System.Web.Services.WebMethod]
        public static string Add(string DestinationPrefix, string SourcePrefix, string DestinationPort, string SourcePort, 
            string PolicyName, string Protocol, string Comment, string Treatment, string Action,
            string lookups, string Ticket, string Hash, string SharedAccessKey, string ttl)
        {
            MessageFormat msg = new MessageFormat();
            if (lookups == "no")
            {
                //IpWhoIs.IpLookup IpSrc = null;
                //IpWhoIs.IpLookup IpDest = null;
                msg.DestinationGEO = null;
                msg.SourceGEO = null;
                msg.DestinationWHOIS = null;
                msg.SourceWHOIS = null;
                
            }
            else
            {
                string DestIP = (DestinationPrefix).Split('/')[0];
                IpWhoIs.IpLookup IpDest = IpWhoIs.WhoIs(DestIP);
                string SrcIP = (SourcePrefix).Split('/')[0];
                IpWhoIs.IpLookup IpSrc = IpWhoIs.WhoIs(SrcIP);
                msg.DestinationGEO = IpDest.regionName;
                msg.SourceGEO = IpSrc.regionName;
                msg.DestinationWHOIS = IpDest.org;
                msg.SourceWHOIS = IpSrc.org;
            }

            if ( Action == "Add")
            {
                
                msg.DestinationPrefix = (DestinationPrefix == "") ? msg.DestinationPrefix = "0.0.0.0/0" : msg.DestinationPrefix = DestinationPrefix;
                msg.DestinationPort = (DestinationPort == "") ? msg.DestinationPort = 0 : msg.DestinationPort = Int32.Parse(DestinationPort);
                msg.SourcePrefix = (SourcePrefix == "") ? msg.SourcePrefix = "0.0.0.0/0" : msg.SourcePrefix = SourcePrefix;
                msg.SourcePort = (SourcePort == "") ? msg.SourcePort = 0 : msg.SourcePort = Int32.Parse(SourcePort);
                msg.TTL = (ttl == "") ? msg.TTL = 86400 : msg.TTL = Int32.Parse(ttl);
                msg.PolicyName = PolicyName;
                msg.Protocol = (Protocol == "") ? msg.Protocol = 0 : msg.Protocol = Int32.Parse(Protocol);
                msg.Comment = Comment;
                msg.Treatment = Treatment;
                msg.Action = Action;
                msg.lookups = lookups;
                msg.DestinationDNS = null;
                msg.SourceDNS = null;
                msg.Ticket = Ticket;
                msg.Hash = Hash;
                string SharedKey = SharedAccessKey;
                string op = servicebusMessage.SendMessage(msg, SharedKey);
                return op;
            }
            else
            {
                msg.Hash = Hash;
                msg.PolicyName = PolicyName;
                msg.Ticket = Ticket;
                msg.Action = Action;
                string SharedKey = SharedAccessKey;
                string op1=   servicebusMessage.SendMessage(msg, SharedKey);
                return op1;

            }
            

        }

        [System.Web.Services.WebMethod]
        public static string Remove(string Action,string Ticket, string Hash, string PolicyName,string SharedAccessKey)
        {
            MessageFormat msg = new MessageFormat();
            msg.Hash = Hash;
            msg.PolicyName = PolicyName;
            msg.Ticket = Ticket;
            msg.Action = Action;
            string SharedKey = SharedAccessKey;
            string op1 = servicebusMessage.SendMessage(msg, SharedKey);
            return op1;
            
        }
    }
}