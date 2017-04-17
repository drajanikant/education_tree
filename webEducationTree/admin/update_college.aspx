<%@ Page Title="Update College Information" Language="C#" MasterPageFile="~/admin/admin-master.Master" AutoEventWireup="true" CodeBehind="update_college.aspx.cs" Inherits="webEducationTree.admin.update_college" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
   <li class=""><a href="admin-home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
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
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
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
                Register College
            </div>
            <div class="panel-body">
                <form class="form-horizontal" ID="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="txtCollegeID">College ID :</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCollegeID" runat="server" class="form-control" placeholder="Enter college ID" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="college_name">College Name :</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCollegeName" runat="server" class="form-control" placeholder="Enter college name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="college_state">State :</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="drdCollegeState" runat="server" class="form-control" placeholder="College State" AutoPostBack="True" OnSelectedIndexChanged="drdCollegeState_SelectedIndexChanged"></asp:DropDownList>
                            
                        </div>
                    </div>
                   <div class="form-group">
                        <label class="control-label col-sm-3" for="college_district">District :</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="drdDistrict" runat="server" class="form-control" placeholder="College District" AutoPostBack="True" OnSelectedIndexChanged="drdDistrict_SelectedIndexChanged"></asp:DropDownList>
                            
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3" for="college_taluka">Taluka :</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="drdTaluka" runat="server" class="form-control" placeholder="College Tauka" AutoPostBack="True" OnSelectedIndexChanged="drdTaluka_SelectedIndexChanged"></asp:DropDownList>
                            
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3" for="college_city">City :</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="drdCity" runat="server" class="form-control" placeholder="College City" AutoPostBack="True" ></asp:DropDownList>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="college_type">College Type :</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="drdCollegeType" runat="server" class="form-control" placeholder="College Type">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>S.S.C.</asp:ListItem>
                                <asp:ListItem>H.S.C.</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem>U.G.</asp:ListItem>
                                <asp:ListItem>P.G.</asp:ListItem>
                                <asp:ListItem>Doctorate</asp:ListItem>
                            </asp:DropDownList>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="btnRegister" runat="server" Text="Update" class="btn btn-primary" OnClick="btnRegister_Click" />
                            <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnRegister" ConfirmOnFormSubmit="true" ConfirmText="Are you sure to update this record" />
                            <button type="reset" class="btn btn-warning">Clear</button>
                        </div>
                    </div>
                </form>
            </div>
            </div>
            <div id="error" runat="server" class="alert alert-danger alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Error!</strong> Error while updating college information.
        </div>
        <div id="success" runat="server" class="alert alert-success alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Success</strong><p id="error_message" runat="server"> College information updated successfully.</p>
        </div>
        

    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
