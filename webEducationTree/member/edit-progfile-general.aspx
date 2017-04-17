<%@ Page Title="General Information" Language="C#" MasterPageFile="~/member/member.Master" AutoEventWireup="true" CodeBehind="edit-progfile-general.aspx.cs" Inherits="webEducationTree.member.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
    <li class=""><a href="member-home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span> Hi!!
        <label id="member_name" runat="server"> member</label>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="member-profile.aspx"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span> Sign out</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <div style="padding:10px;"></div>
    <div id="error" runat="server" class="alert alert-danger alert-dismissable">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Error!</strong> Error while deleting college.
    </div>
    <div id="success" runat="server" class="alert alert-success alert-dismissable">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success</strong><p id="error_message" runat="server">College name deleted successfully.</p>
    </div>
    <div class="btn-group btn-group-lg btn-group-justified" role="group" >
        <div class="btn-group" role="group">
            <a class="btn btn-primary" href="edit-progfile-general.aspx" style="font-size:20px">General Information</a>
        </div>
        <div class="btn-group" role="group">
            <a  class="btn btn-info" href="edit-profile-address.aspx" style="font-size:20px">Member Address</a>
        </div>
        <div class="btn-group" role="group">
            <a  class="btn btn-info" href="edit-profile-school.aspx" style="font-size:20px">School/College</a>
        </div>
        <div class="btn-group" role="group">
            <a  class="btn btn-info" href="edit-profile-social.aspx" style="font-size:20px">Social Informaiton</a>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-body">
            <form class="form-horizontal" id="form_general_info" runat="server">
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="txtMemberName">Member Name:</label>
                    <div class="col-sm-10">                        
                        <asp:TextBox ID="txtMemberName" runat="server" class="form-control" placeholder="Enter member name"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtDob">Date of Birth:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDob" runat="server" class="form-control" placeholder="Enter date of birth"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="drdGender">Gender:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="drdGender" runat="server" class="form-control" placeholder="Enter date of birth">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtEmail">Email:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter email address"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="txtMobile">Mobile Number:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Enter mobile number"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtEducationType">Education Type:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtEducationType" runat="server" class="form-control" placeholder="Enter education type"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="drdJobType">Job Type:</label>
                    <div class="col-sm-10">
                       <asp:DropDownList ID="drdJobType" runat="server" class="form-control" >
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Self Employed</asp:ListItem>
                            <asp:ListItem>Company</asp:ListItem>
                        </asp:DropDownList></div>
                </div>
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="txtCompanyName">Company Name:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCompanyName" runat="server" class="form-control" placeholder="Enter company name"></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                       
                        <asp:Button ID="btnSave" runat="server" Text="Save"  class="btn btn-primary" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDone" runat="server" Text="Done" class="btn btn-warning" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
