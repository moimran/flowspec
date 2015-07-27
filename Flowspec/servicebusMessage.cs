using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Web.Script.Serialization;
using System.Text;
using Newtonsoft.Json;

namespace Flowspec
{
    public class servicebusMessage
    {
        public servicebusMessage()
        {

        }
        public static string SendMessage(MessageFormat msg,string SharedKey)
        {
            try
            {
                string connectionString = string.Format("Endpoint=sb://myflow-ns.servicebus.windows.net/;SharedAccessKeyName={0};SharedAccessKey={1}", msg.PolicyName, SharedKey);
                string JsonMessage = JsonConvert.SerializeObject(msg);
                var jsonObjStream = new MemoryStream(Encoding.UTF8.GetBytes(JsonMessage));
                MessagingFactory factory = MessagingFactory.CreateFromConnectionString(connectionString);
                MessageSender MessageSender = factory.CreateMessageSender("flowspec");
                BrokeredMessage Message = new BrokeredMessage(jsonObjStream);
                MessageSender.Send(Message);
                if (msg.Action == "Add")
                {
                    return "The Filter is added";
                }
                else
                {
                    return "The Filter is removed";
                }
                
            }
            catch (MessagingCommunicationException)
            {

                return "Client is not able to establish a connection to Service Bus.";
            }

            catch (UnauthorizedAccessException)
            {
                return "PolicyName or SharedAccessKey is incorrect";
            }
        } 
    }
}