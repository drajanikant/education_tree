<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin-master.Master" AutoEventWireup="true" CodeBehind="admin-profile.aspx.cs" Inherits="webEducationTree.admin.admin_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
     <li class=""><a href="admin-home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-blackboard"></span> College<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="college-register.aspx"><span class="glyphicon glyphicon-save-file"></span> Register college</a></li>
            <li><a href="list-college.aspx"><span class="glyphicon glyphicon-list-alt"></span> College list</a></li>
            
        </ul>
    </li>
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-map-marker"></span> Address<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="state-register.aspx"><span class="glyphicon glyphicon-king"></span> State</a></li>
            <li><a href="register-district.aspx"><span class="glyphicon glyphicon-queen"></span> District</a></li>
            <li><a href="register-taluka.aspx"><span class="glyphicon glyphicon-knight"></span> Taluka</a></li>
            <li><a href="register-city.aspx"><span class="glyphicon glyphicon-pawn"></span> City</a></li>
            
        </ul>
    </li>
     <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-eye-open"></span> Administration<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="admin-register.aspx"><span class="glyphicon glyphicon-save-file"></span> Register admin</a></li>
            <li><a href="list-admin.aspx"><span class="glyphicon glyphicon-list-alt"></span> Admin List</a></li>
            
        </ul>
    </li>
    <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span>Hi!! <label id="admin_name" runat="server">Admin</label> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="admin-profile.aspx"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span> Sign out</a></li>
            
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">

     <div class="col-md-4">
    </div>
    <div class="col-md-8" style="margin-top: 3%;">
        <div class="panel panel-primary">
            <div class="panel-heading" style="text-align: center; font-size: 25px;">
               Admin Profile
            </div>
            <div class="panel-body">
                <form class="form-horizontal" ID="form1" runat="server">
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="Admin_name">Admin ID :</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAdminId" runat="server" class="form-control" ReadOnly="true"  ></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="Admin_name">Admin Name :</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAdminName" ReadOnly="true" runat="server" class="form-control" placeholder="Enter Admin name" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="Admin_Email">Admin Email :</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAdminEmail" ReadOnly="true" runat="server" class="form-control" placeholder="Enter Admin email address" required="required" ></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                runat="server" ErrorMessage="Please Enter Valid Email ID"
                                ValidationGroup="btnRegister" ControlToValidate="txtAdminEmail"
                                CssClass="requiredFieldValidateStyle"
                                ForeColor="Red"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                Display="Dynamic"></asp:RegularExpressionValidator>

                        </div>

                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="Contact">Contact Number :</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtContact" runat="server" ReadOnly="true"  class="form-control" placeholder="Contact Number" required="required"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
      ControlToValidate="txtContact" ErrorMessage="RegularExpressionValidator" 
    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                             </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn btn-primary" OnClick="btnEdit_Click"  />
                            
                        </div>
                    </div>
                </form>
            </div>
        </div>
                <div id="success" runat="server" class="alert alert-success alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Success</strong> Admin updation successful.
        </div>
        <div id="error" runat="server" class="alert alert-danger alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Error!</strong><p id="error_msg" runat="server"> Updation failed.</p>
        </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
