using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flowspec
{
    public class MessageFormat
    {
        public MessageFormat()
        {
            Protocol = 0;
        }
        public string DestinationPrefix { get; set; }
        public int DestinationPort { get; set; }
        public string SourcePrefix { get; set; }
        public int SourcePort { get; set; }
        public int TTL { get; set; }
        public string PolicyName { get; set; }
        public int Protocol { get; set; } 
        public string Comment { get; set; }
        public string Treatment { get; set; }
        public string Action { get; set; }
        public string lookups { get; set; }
        public string Hash { get; set; }
        public string DestinationGEO { get; set; }
        public string SourceGEO { get; set; }
        public string SourceWHOIS { get; set; }
        public string DestinationWHOIS { get; set; }
        public string SourceDNS { get; set; }
        public string DestinationDNS { get; set; }
        public string Ticket { get; set; }
    }
}