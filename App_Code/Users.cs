using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Users
/// </summary>
public class UserContent
{
    private alamaatDBDataContext objMyLq = new alamaatDBDataContext();
    
    public alamaat_User GetbyUsername(string name)
    {
        alamaat_User user = objMyLq.alamaat_Users.Where(ku => ku.username.Equals(name)).FirstOrDefault();
        //if (user != null)
        //{
        //    UserInterface finduser = new UserInterface();

        //    finduser.ID = user.User_ID;
        //    finduser.Firstname = user.FirstName;
        //    finduser.LastName = user.LastName;
        //    finduser.CompanyID = user.CompanyID;
        //    finduser.Rights = user.UserRights;
        //    finduser.Email = user.Email;
        //    finduser.ManufactuerType = user.ManufactuerType;
        //    finduser.ManufacturerAdmin = Convert.ToBoolean(user.ManufacturerAdmin);
        //    return finduser;
        //}
        //else
        return user;
    }
    public alamaat_User GetuserById(string id)
    {
        alamaat_User user = objMyLq.alamaat_Users.Where(ku => ku.id.Equals(id)).FirstOrDefault();
        if (user != null)
        {
            return user;
        }
        else
            return null;
    }
    public UserInterface GetuserById(Guid id)
    {
        alamaat_User user = objMyLq.alamaat_Users.Where(ku => ku.id.Equals(id)).FirstOrDefault();
        if (user != null)
        {
            UserInterface finduser = new UserInterface();
            finduser.FirstName = user.firstname;
            finduser.LastName = user.lastname;
            finduser.CompanyName = user.companyname;
            finduser.Email = user.email;
            
            return finduser;
        }
        else
            return null;
    }

    public alamaat_User GetuserByEmail(string email)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                List<alamaat_User> user = objMyLq.alamaat_Users.Where(ku => ku.email.ToLower().Equals(email.ToLower())).ToList();
                if (user.Count >= 1)
                {
                    return user[0];
                }
                else { return null; }
            }
            catch (Exception ex) { return null; }
        }

    }
    
    public bool InsertUser(UserInterface user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {

                alamaat_User objNewcontent = new alamaat_User();
                objNewcontent.id = user.ID;
                objNewcontent.title = user.Title;
                objNewcontent.firstname = user.FirstName;
                objNewcontent.lastname = user.LastName;
                objNewcontent.username = user.UserName;
                objNewcontent.password = user.Password;
                objNewcontent.middlename = user.MiddleName;
                objNewcontent.email = user.Email;
                objNewcontent.registerDate = DateTime.Now;
                objNewcontent.block = false;
                objNewcontent.active = false;
                objNewcontent.address = user.Address;
                objNewcontent.city = user.City;
                objNewcontent.province = user.Province;
                objNewcontent.country = user.Country;
                objNewcontent.postalcode = user.PCode;
                objNewcontent.phone = user.Phone;
                objNewcontent.mobilephone = user.MobilePhone;
                objNewcontent.fax = user.Fax;
                objMyLq.alamaat_Users.InsertOnSubmit(objNewcontent);
                objMyLq.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool UpdateUser(alamaat_User user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_Users.Single(p => p.id == user.id);
                if (null != objcontent)
                {
                    objcontent.active = true;
                    objcontent.activation = DateTime.Now;
                    objMyLq.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool UpdateUser(UserInterface user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_Users.Single(p => p.username == user.UserName);
                objcontent.firstname = user.FirstName;
                objcontent.lastname = user.LastName;
                objcontent.username = user.UserName;
                objcontent.email = user.Email;
                objcontent.registerDate = DateTime.Now;
                // objNewcontent.block = false;
                objcontent.address = user.Address;
                objcontent.city = user.City;
                objcontent.province = user.Province;
                objcontent.country = user.Country;
                objcontent.postalcode = user.PCode;
                objcontent.phone = user.Phone;
                objcontent.mobilephone = user.MobilePhone;
                objcontent.fax = user.Fax;
                objMyLq.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool DeleteUser(UserInterface _objcontent)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_Users.Single(p => p.username == _objcontent.UserName);
               // objcontent.Active = false;
               // objcontent.SyncDate = DateTime.Now;
                objMyLq.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
public class UserInterface
{
    private Guid id;
    public Guid ID
    {
        get { return id; }
        set { id = value; }
    }
    private string username;
    public string UserName
    {
        get { return username; }
        set { username = value; }
    }
    private string password;
    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    private string companyname;
    public string CompanyName
    {
        get { return companyname; }
        set { companyname = value; }
    }
    private string title;
    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    private string firstname;
    public string FirstName
    {
        get { return firstname; }
        set { firstname = value; }
    }
    private string lastname;
    public string LastName
    {
        get { return lastname; }
        set { lastname = value; }
    }
    private string middlename;
    public string MiddleName
    {
        get { return middlename; }
        set { middlename = value; }
    }
    private string email;
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    
    private string address;
    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    private string city;
    public string City
    {
        get { return city; }
        set { city = value; }
    }
    private string province;
    public string Province
    {
        get { return province; }
        set { province = value; }
    }
    private string country;
    public string Country
    {
        get { return country; }
        set { country = value; }
    }
    private string pcode;
    public string PCode
    {
        get { return pcode; }
        set { pcode = value; }
    }
    private string phone;
    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }
    private string mobilephone;
    public string MobilePhone
    {
        get { return mobilephone; }
        set { mobilephone = value; }
    }
    private string fax;
    public string Fax
    {
        get { return fax; }
        set { fax = value; }
    }
    private string birthdate;
    public string BirthDate
    {
        get { return birthdate; }
        set { birthdate = value; }
    }
}

public class SubscriberContent
{
    private alamaatDBDataContext objMyLq = new alamaatDBDataContext();

    
    public string Getuseremails()
    {
        string email = string.Empty;
        foreach (var user in objMyLq.alamaat_subscribers)
        {
            if (user.email != null && user.email != string.Empty)
            {
                if (email == string.Empty)
                    email = user.email;
                else
                    email += ","+user.email;
            }
        }
        return email;
    }
    public alamaat_subscriber Getuserbyemail(string email)
    {
        List<alamaat_subscriber> user = objMyLq.alamaat_subscribers.Where(e => e.email.ToLower() == email.ToLower()).ToList();
        if (user.Count() > 0)
            return user[0];
        return null;
    }
    public alamaat_subscriber Getuserbyid(string id)
    {
         alamaat_subscriber user = objMyLq.alamaat_subscribers.Where(e => e.id.ToString() == id).FirstOrDefault();
        
        return user;
    }
    public bool InsertSubscriber(SubscriberInterface user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {

                alamaat_subscriber objNewcontent = new alamaat_subscriber();
                objNewcontent.id = user.ID;
                objNewcontent.email = user.Email;
                objNewcontent.active = user.Active;
                objNewcontent.created = DateTime.Now;
                objMyLq.alamaat_subscribers.InsertOnSubmit(objNewcontent);
                objMyLq.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool UpdateSubscriber(alamaat_subscriber user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_subscribers.Single(p => p.id == user.id);
                if (null != objcontent)
                {
                    objcontent.active = true;
                    objMyLq.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool UpdateSubscriber(SubscriberInterface user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_subscribers.Single(p => p.id == user.ID);
                objcontent.active = user.Active;
                objMyLq.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool DeleteUser(SubscriberInterface _objcontent)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_subscribers.Single(p => p.id == _objcontent.ID);
                // objcontent.Active = false;
                // objcontent.SyncDate = DateTime.Now;
                objMyLq.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
public class SubscriberInterface
{
    private Guid id;
    public Guid ID
    {
        get { return id; }
        set { id = value; }
    }
    private string email;
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    private bool active;
    public bool Active
    {
        get { return active; }
        set { active = value; }
    }
}