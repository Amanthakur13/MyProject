using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Xml.Linq;




public partial class Pages_ApiGetData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String str = string.Format("https://jsonplaceholder.typicode.com/todos/1");
        WebRequest requestObjGet = WebRequest.Create(str);
        requestObjGet.Method = "GET";
        // requestObjGet.ContentType = "application/json";
        HttpWebResponse responseObjGet = null;
        responseObjGet = (HttpWebResponse)requestObjGet.GetResponse();

        string strresulttest = null;
        using (Stream stream = responseObjGet.GetResponseStream())
        {
            StreamReader sr = new StreamReader(stream);
            strresulttest = sr.ReadToEnd();
            sr.Close();
        }

         User UserModel = new User();
        if (strresulttest == null || strresulttest == "")
        {
        }
        else
        {
            XNode node = JsonConvert.DeserializeXNode(strresulttest, "Root");
            XmlDocument xdoc = JsonConvert.DeserializeXmlNode("{\"root\":" + strresulttest + "}", "root");
            XmlNodeList nodes = xdoc.SelectNodes("root");
            if (nodes != null)
            {
                foreach (XmlNode titlenode in nodes)
                {
                    if (titlenode != null)
                    {
                        foreach (XmlNode child1 in titlenode.SelectNodes("root"))
                        {
                            if (child1 != null)
                            {
                                foreach (XmlNode child2 in child1.SelectNodes("user"))
                                {
                                    if (child2 != null)
                                    {
                                        UserModel.userId = Convert.ToUInt16(child2.ChildNodes[0].InnerText);
                                        UserModel.id = child2.ChildNodes[1].InnerText;
                                        UserModel.title = child2.ChildNodes[2].InnerText;
                                        UserModel.completed = child2.ChildNodes[3].InnerText;

                                        this.Hide();
                                        FormTimeTracker TT = new FormTimeTracker(UserModel.id, UserModel.firstname, UserModel.lastname, UserModel.mail);
                                        TT.Show();
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // var patientClassInfo = JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(responseString);
            // UserModel = JsonConvert.DeserializeObject<User>(patientClassInfo.ToString());
            //UserModel = JsonConvert.DeserializeObject<User>(responseString);
        }
    }
    }







