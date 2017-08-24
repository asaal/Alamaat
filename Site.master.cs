using Facebook;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
        
       
      // var fb = new FacebookClient("508197835942931");
       //var result = (IDictionary<string, object>)fb.Get("me");
       //dynamic me = fb.Get("me");
        //if (Request.Params["code"] != null)
       // {
        //    Facebook.FacebookClient fbClient = new Facebook.FacebookClient(GetAccessToken());

        //    dynamic me = fbClient.Get("me");
           // dynamic result = fbClient.Get("/asad.qau.it");
        //}

        //ViewBag.Members = result.data;
    }
    private string GetAccessToken()
    {
        if (HttpRuntime.Cache["access_token"] == null)
        {
            Dictionary<string, string> args = GetOauthTokens(Request.Params["code"]);
            HttpRuntime.Cache.Insert("access_token", args["access_token"], null, DateTime.Now.AddMinutes(Convert.ToDouble(args["expires"])), TimeSpan.Zero);
        }

        return HttpRuntime.Cache["access_token"].ToString();
    }

    private Dictionary<string, string> GetOauthTokens(string code)
    {
        Dictionary<string, string> tokens = new Dictionary<string, string>();

        string clientId = "508197835942931";
        string redirectUrl = "http://localhost:3945/Default.aspx";
        string clientSecret = "969c88330438e916bae258c761921d44";

        string url = string.Format("https://graph.facebook.com/oauth/access_token?client_id={0}&redirect_uri={1}&client_secret={2}&code={3}",
                        clientId, redirectUrl, clientSecret, code);

        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
        using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
        {
            StreamReader reader = new StreamReader(response.GetResponseStream());
            string retVal = reader.ReadToEnd();

            foreach (string token in retVal.Split('&'))
            {
                tokens.Add(token.Substring(0, token.IndexOf("=")),
                    token.Substring(token.IndexOf("=") + 1, token.Length - token.IndexOf("=") - 1));
            }
        }

        return tokens;
    }
    void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        //this.countMe();

        //DataSet tmpDs = new DataSet();
        //tmpDs.ReadXml(Server.MapPath("~/counter.xml"));
        string users= Application["OnlineUsers"].ToString();
       // lblCounter.Text = users;//tmpDs.Tables[0].Rows[0]["hits"].ToString();
    }

    private void countMe()
    {
        DataSet tmpDs = new DataSet();
        tmpDs.ReadXml(Server.MapPath("~/counter.xml"));

        int hits = Int32.Parse(tmpDs.Tables[0].Rows[0]["hits"].ToString());

        hits += 1;

        tmpDs.Tables[0].Rows[0]["hits"] = hits.ToString();

        tmpDs.WriteXml(Server.MapPath("~/counter.xml"));

    }
    
}
