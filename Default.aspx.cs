using Facebook;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    string facebook_urlAuthorize_base = "https://graph.facebook.com/oauth/authorize";
    string facebook_urlGetToken_base = "https://graph.facebook.com/oauth/access_token";
    string facebook_AppID = ConfigurationManager.AppSettings["facebook:AppID"];
    string facebook_AppSecret = ConfigurationManager.AppSettings["facebook:AppSecret"];

    protected void Page_Load(object sender, EventArgs e)
    {
       // btnHide.Attributes.Add("onclick", "return openWin()");

        if (!IsPostBack)
        {
            //if (Request["code"] != null)
            //{
            //    //After this page have redirected the users browser to Facebook asking to be authorized to write to the
            //    //users wall, Facebook will redirect back to this page and if authorized having a "code" key in the querystring

            //    //Since we have a code we got authorized and can now
            //    //1) get an access_token
            //    //2) use the access_token to write to the users Facebook wall
            //    string authorizationCode = Request["code"];
            //    string access_token = Facebook_GetAccessToken(authorizationCode);
            //    if (access_token == "")
            //    {
            //        Response.Write("Could not get access_token");
            //        return;
            //    }
            //   // Facebook_ListFriends(access_token);
            //    Shared(access_token);
            //}
        }

    }
    protected void RadAjaxManager1_AjaxRequest(object sender, Telerik.Web.UI.AjaxRequestEventArgs e)
    { }
    protected void lbllogout_Click(object sender, EventArgs e)
    {
        Facebook_AuthorizeApplication();
    }
    private void Facebook_AuthorizeApplication()
    {

        string scope = "publish_stream"; //see: http://developers.facebook.com/docs/authentication/permissions/ for extended permissions
        string urlAuthorize = facebook_urlAuthorize_base;
        urlAuthorize += "?client_id=" + facebook_AppID;
        urlAuthorize += "&redirect_uri=" + Facebook_GetRedirectUri();
        urlAuthorize += "&scope=" + scope;

        //redirect the users browser to Facebook to ask the user to authorize our Facebook application
        Response.Redirect(urlAuthorize, true); //this cannot be done using WebRequest since facebook may need to show dialogs in the users browser
    }
    private string Facebook_GetAccessToken(string pAuthorizationCode)
    {

        string urlGetAccessToken = facebook_urlGetToken_base;
        urlGetAccessToken += "?client_id=" + facebook_AppID;
        urlGetAccessToken += "&client_secret=" + facebook_AppSecret;
        urlGetAccessToken += "&redirect_uri=" + Facebook_GetRedirectUri();
        urlGetAccessToken += "&code=" + pAuthorizationCode;

        string responseData = RequestResponse(urlGetAccessToken); //we write RequestResponse a little later
        if (responseData == "")
        {
            return "";
        }
        NameValueCollection qs = HttpUtility.ParseQueryString(responseData);
        string access_token = qs["access_token"] == null ? "" : qs["access_token"];

        return access_token;
        //(The access_token is valid only from within the site domain specified for our Facebook application)
    }
    private string Facebook_GetRedirectUri()
    {
        string urlCurrentPage = Request.Url.AbsoluteUri.IndexOf('?') == -1 ? Request.Url.AbsoluteUri : Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.IndexOf('?'));
        NameValueCollection nvc = new NameValueCollection();
        foreach (string key in Request.QueryString) { if (key != "code") { nvc.Add(key, Request.QueryString[key]); } }
        string qs = "";
        foreach (string key in nvc)
        {
            qs += qs == "" ? "?" : "&";
            qs += key + "=" + nvc[key];
        }
        string redirect_uri = urlCurrentPage + qs; //urlCallback have to be exactly the same each time it is used (that's why the code key is removed)

        return redirect_uri;
    }
    private void Facebook_ListFriends(string pAccessToken)
    {
        string username = "me";
        //string dataType = "friends";
        string dataType = "likes";
        string urlGetFriends = "https://graph.facebook.com/" + username + "/" + dataType + "?access_token=" + pAccessToken;
        string jsonFriends = RequestResponse(urlGetFriends);
        if (jsonFriends == "")
        {
            Response.Write("<br /><br />urlGetFriends have problems");
            return;
        }
        Friends friends = JsonConvert.DeserializeObject<Friends>(jsonFriends); //we write the Friends class later
        List<Friend> frds = new List<Friend>();
        //lbluser.Text = friends.data.Count().ToString()+" ";
        foreach (Friend friend in friends.data) //we write the Friend class later
        {
            Friend frd = new Friend();
            frd.name = friend.name;
            frd.id = friend.id;
            frd.image =string.Format("https://graph.facebook.com/{0}/picture", friend.id);
            frds.Add(frd);
            //Response.Write("<br />" + friend.name);
        }
        RadListView1.DataSource = frds;
        RadListView1.DataBind();
    }
    private string HttpPost(string pUrl, string pPostData)
    {
        HttpWebRequest webRequest = (HttpWebRequest)HttpWebRequest.Create(pUrl);
        webRequest.ContentType = "application/x-www-form-urlencoded";
        webRequest.Method = "POST";
        byte[] bytes = System.Text.Encoding.UTF8.GetBytes(pPostData);
        Stream requestWriter = webRequest.GetRequestStream(); //GetRequestStream
        requestWriter.Write(bytes, 0, bytes.Length);
        requestWriter.Close();

        Stream responseStream = null;
        StreamReader responseReader = null;
        string responseData = "";
        try
        {
            WebResponse webResponse = webRequest.GetResponse();
            responseStream = webResponse.GetResponseStream();
            responseReader = new StreamReader(responseStream);
            responseData = responseReader.ReadToEnd();
        }
        catch (Exception exc)
        {
            throw new Exception("could not post : " + exc.Message);
        }
        finally
        {
            if (responseStream != null)
            {
                responseStream.Close();
                responseReader.Close();
            }
        }

        return responseData;
    }
    private string RequestResponse(string pUrl)
    {
        HttpWebRequest webRequest = System.Net.WebRequest.Create(pUrl) as HttpWebRequest;
        webRequest.Method = "GET";
        webRequest.ServicePoint.Expect100Continue = false;
        webRequest.Timeout = 20000;

        Stream responseStream = null;
        StreamReader responseReader = null;
        string responseData = "";
        try
        {
            WebResponse webResponse = webRequest.GetResponse();
            responseStream = webResponse.GetResponseStream();
            responseReader = new StreamReader(responseStream);
            responseData = responseReader.ReadToEnd();
        }
        catch (Exception exc)
        {
            Response.Write("<br /><br />ERROR : " + exc.Message);
        }
        finally
        {
            if (responseStream != null)
            {
                responseStream.Close();
                responseReader.Close();
            }
        }

        return responseData;
    }
    //Share pictures
    string message = "";
    private void CheckAuthorization()
        {
            string app_id = "APP_ID";
            string app_secret = "APP_SECRET";
            string scope = "publish_stream,manage_pages";
 
            if (Request["code"] == null)
            {
                Response.Redirect(string.Format(
                    "https://graph.facebook.com/oauth/authorize?client_id={0}&redirect_uri={1}&scope={2}",
                    app_id, Request.Url.AbsoluteUri, scope));
            }
            else
            {
                Dictionary<string, string> tokens = new Dictionary<string, string>();
 
                string url = string.Format("https://graph.facebook.com/oauth/access_token?client_id={0}&redirect_uri={1}&scope={2}&code={3}&client_secret={4}",
                    app_id, Request.Url.AbsoluteUri, scope, Request["code"].ToString(), app_secret);
 
                HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
 
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    StreamReader reader = new StreamReader(response.GetResponseStream());
 
                    string vals = reader.ReadToEnd();
 
                    foreach (string token in vals.Split('&'))
                    {                       
                        tokens.Add(token.Substring(0, token.IndexOf("=")),
                            token.Substring(token.IndexOf("=") + 1, token.Length - token.IndexOf("=") - 1));
                    }
                }
 
                string access_token = tokens["access_token"];
 
                var client = new FacebookClient(access_token);
 
                //client.Post("/me/feed", new { message = bodymessage });
            }
    }
    protected void Shared(string access_token)
    {
        string app_id = "508197835942931";
            string app_secret = "969c88330438e916bae258c761921d44";
            string scope = "publish_stream,manage_pages";

        //    if (Request["code"] == null)
        //    {
         //       Response.Redirect(string.Format(
         //           "https://graph.facebook.com/oauth/authorize?client_id={0}&redirect_uri={1}&scope={2}",
        //            app_id, Request.Url.AbsoluteUri, scope));
        //    }
        //    else
        //    {
                //Dictionary<string, string> tokens = new Dictionary<string, string>();

                //string url = string.Format("https://graph.facebook.com/oauth/access_token?client_id={0}&redirect_uri={1}&scope={2}&code={3}&client_secret={4}",
                //    app_id, Request.Url.AbsoluteUri, scope, code, app_secret);

                //HttpWebRequest request = System.Net.WebRequest.Create(url) as HttpWebRequest;

                //using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                //{
                //    StreamReader reader = new StreamReader(response.GetResponseStream());

                //    string vals = reader.ReadToEnd();

                //    foreach (string token in vals.Split('&'))
                //    {
                //        //meh.aspx?token1=steve&token2=jake&...
                //        tokens.Add(token.Substring(0, token.IndexOf("=")),
                //            token.Substring(token.IndexOf("=") + 1, token.Length - token.IndexOf("=") - 1));
                //    }
                //}

                //string access_token = tokens["access_token"];

                var client = new FacebookClient(access_token);
                string ImagePath = Server.MapPath("Images/books/Matla-e-Asaar2.jpg");

                FacebookClient fb = new FacebookClient(access_token);
                string appid = fb.AppId;// ConfigurationManager.AppSettings["APPID"].ToString();
                string scret = fb.AppSecret;//ConfigurationManager.AppSettings["APPSECRET"].ToString();

                var imgstream = File.OpenRead(ImagePath);
                dynamic res = fb.Post("669471026419805/photos", new
                {
                    message = "November 2013 Edition",
                    file = new FacebookMediaStream
                    {
                        ContentType = "image/jpg",
                        FileName = Path.GetFileName(ImagePath)
                    }.SetValue(imgstream)
                });
                //client.Post(res);

               // var myAccounts = client.Get("/me/accounts?type=page");
               // var pageAccessToken = myAccounts.Single(x => x.pageName == MY_PAGE_NAME).access_token;

                //var pageClient = new FacebookClient(pageAccessToken);
                //dynamic parameters = new ExpandoObject();
                //parameters.message = "November 2013 Edition";
                //books bookcontent = new books();
               // ProductThumb thumb = bookcontent.Getimage(new Guid("BC90654F-B2EE-4421-8886-C9FD854403B8"));
                //if (thumb != null)
                //{
                   
                //}
                //else
                //{
                //}
                
                
               // parameters.link = "http://alamaat.biz/Item.aspx";
               // parameters.picture = "http://alamaat.biz/Images/books/foi2.jpg";
               // parameters.name = "Fehm-O-Idrak";
              //  parameters.caption = "Fehm-O-Idrak";
               // parameters.access_token = access_token;
                //446533181408238 is my fan page
                //client.Post("/669471026419805/feed", parameters);
                //client.Post("/669471026419805/feed", new { message = "Welcome " });

           // }
    
    }


}
public class Friend
{
    public string id { get; set; }
    public string name { get; set; }
    public string image { get; set; }
}
public class Friends
{
    public List<Friend> data { get; set; }
}