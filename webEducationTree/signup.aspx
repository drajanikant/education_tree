<%@ Page Title="" Language="C#" MasterPageFile="~/education-admin.Master" AutoEventWireup="true"
    CodeBehind="signup.aspx.cs" Inherits="webEducationTree.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <div class="col-md-4">
    </div>
    <div class="col-md-4" style="margin-top: 5%;">
        <div class="panel panel-primary">
            <div class="" style="text-align: center; font-size: 25px;">
                 <ul class="nav nav-tabs">
  <li class="col-md-6"><a href="login.aspx" style="width:100%">Sign in</a></li>
  <li class="active col-md-6"><a href="signup.aspx" style="width:100%">Sign Up </a></li>
  
</ul></div>
            <div class="panel-body">
                <form id="form1" runat="server">
                <div class="form-group">
                    <label for="email">
                        Member Name </label>
                    <asp:TextBox ID="txtUserName" class="form-control" runat="server" aria-describedby="emailHelp"
                        placeholder="Enter email" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="email">
                        Email address</label>
                    <asp:TextBox ID="txtUserEmail" class="form-control" runat="server" aria-describedby="emailHelp"
                        placeholder="Enter email" required="required"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
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
                    <asp:TextBox ID="txtUserPass" class="form-control" TextMode="Password" runat="server"
                        placeholder="Password" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="confirm_password">
                       Confirm password</label>
                    <asp:TextBox ID="txtConfirmPassword" class="form-control" TextMode="Password" runat="server"
                        placeholder="Password" required="required"></asp:TextBox>
                     <asp:CompareValidator id="comparePasswords" 
              runat="server"
              ControlToCompare="txtUserPass"
              ControlToValidate="txtConfirmPassword"
              ErrorMessage="Your passwords do not match up!"
              CssClass="requiredFieldValidateStyle"
              ValidationGroup="btnLogin"
              ForeColor="Red"
              Display="Dynamic" />
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Sign up" class="btn btn-primary col-md-5" OnClick="btnLogin_Click" />
                <div class="col-md-2">
                </div>
                <button type="reset" class="btn btn-warning col-md-5">
                    Clear</button>
                </form>
            </div>
        </div>
        
        <div id="success" runat="server" class="alert alert-success alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Success</strong> Admin registration successful.
            Please Click on Login!</div>
        <div id="error" runat="server" class="alert alert-danger alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Error!</strong><p id="error_msg" runat="server"> Failed registration.</p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
