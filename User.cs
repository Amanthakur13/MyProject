using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Text;
using System.Threading.Tasks;


/// <summary>
/// Summary description for User
/// </summary>
public class User
{
	public User()
	{
		 [JsonProperty("@userId")]
        public int @userId { get; set; }

        [JsonProperty("@id")]
        public string @id { get; set; }

        [JsonProperty("@title")]
        public string @title { get; set; }

        [JsonProperty("@completed")]
        public string @completed { get; set; }

     
       }
}
