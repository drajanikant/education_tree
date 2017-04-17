<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/education-admin.Master"
    AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="webEducationTree.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <div class="col-md-4">
    </div>
    <div class="col-md-4" style="margin-top:5%;">
        
        <div class="panel panel-primary">
            <div class="" style="text-align: center; font-size: 25px;">
               <ul class="nav nav-tabs">
  <li class="active col-md-6"><a href="login.aspx" >Sign in</a></li>
  <li class=" col-md-6"><a href="signup.aspx" >Sign Up </a></li>
  </ul></div>
            <div class="panel-body">
                <form id="form1" runat="server">
                <div class="form-group">
                    <label for="email">
                        Email address</label>
                    <asp:TextBox ID="txtUserEmail" class="form-control" runat="server" aria-describedby="emailHelp"
                        placeholder="Enter email" required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator"
                    runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="btnLogin" ControlToValidate="txtUserEmail"
                     CssClass="requiredFieldValidateStyle"
                     ForeColor="Red"
                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                     Display="Dynamic"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group">
                    <label for="password">
                        Password</label>
                    <asp:TextBox ID="txtUserPass" class="form-control" TextMode="Password" runat="server" placeholder="Password" required="required"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label for="type">
                        Member Type</label>
                    <asp:DropDownList ID="drdType" class="form-control" runat="server" placeholder="select any one" required="required">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Member</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                     </asp:DropDownList>
                </div>
                <div class="form-check">
                    
                    <label class="form-check-label">

                        <asp:CheckBox ID="chbRemember" class="form-check-input" runat="server" Text="Remember Me"  />
                    </label>
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    class="btn btn-primary col-md-5" onclick="btnLogin_Click" />
                <div class="col-md-2"></div>
                <button type="reset" class="btn btn-warning col-md-5">
                    Clear</button>
                </form>
            </div>
        </div>
    <div id="alert" runat="server" class="alert alert-danger alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Error!</strong><p id="error_message" runat="server"> User name or password may be wrong.</p>
        </div>
    </div>
        

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>

