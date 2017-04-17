<%@ Page Title="Social Links" Language="C#" MasterPageFile="~/member/member.Master" AutoEventWireup="true" CodeBehind="edit-profile-social.aspx.cs" Inherits="webEducationTree.member.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
     <li class=""><a href="member-home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span>Hi!!
        <span id="member_name" runat="server">Admin</span>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="member-profile.aspx"><span class="glyphicon glyphicon-user"></span>Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span>Sign out</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
     <div id="error" runat="server" class="alert alert-danger alert-dismissable">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Error!</strong> <span id="error_message" runat="server">College name deleted successfully.</span>
    </div>
    <div id="success" runat="server" class="alert alert-success alert-dismissable">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success</strong><span id="success_message" runat="server">College name deleted successfully.</span>
    </div>
   

     <div class="btn-group btn-group-lg btn-group-justified" role="group" style="margin-top: 20px;">
        <div class="btn-group" role="group">
            <a class="btn btn-info" href="edit-progfile-general.aspx" style="font-size: 20px">General Information</a>
        </div>
        <div class="btn-group" role="group">
            <a class="btn btn-info" href="edit-profile-address.aspx" style="font-size: 20px">Member Address</a>
        </div>
        <div class="btn-group" role="group">
            <a class="btn btn-info" href="edit-profile-school.aspx" style="font-size: 20px">School/College</a>
        </div>
        <div class="btn-group" role="group">
            <a class="btn btn-primary" href="edit-profile-social.aspx" style="font-size: 20px">Social Informaiton</a>
        </div>
    </div>

    <form id="form_general_info" runat="server">
        <div class="panel panel-primary col-md-5">
            <div class="panel-body ">

                <div id="formCollegeSearch">
                    <div class="form-group ">
                        <label for="drdLinkName ">Site Name : </label>

                        <asp:DropDownList ID="drdLinkName" class="form-control " runat="server" ValidationGroup="SocialLinks" >
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Facebook</asp:ListItem>
                            <asp:ListItem>YouTube</asp:ListItem>
                            <asp:ListItem>Twitter</asp:ListItem>
                            <asp:ListItem>Google+</asp:ListItem>
                            <asp:ListItem>LinkedIn</asp:ListItem>
                            <asp:ListItem>Skype</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="form-group ">
                        <label for="txtLink ">Links/Address : </label>

                        <asp:TextBox ID="txtLink" class="form-control " runat="server"  TextMode="MultiLine" ValidationGroup="SocialLinks"></asp:TextBox>

                    </div>
                  
                    <asp:Button ID="btnAdd" class="btn btn-primary " runat="server" Text="Add" ValidationGroup="SocialLinks" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnDone" class="btn btn-warning " runat="server" Text="Done" ValidationGroup="SocialLinks" />
                </div>

            </div>

        </div>
        <div class="panel panel-primary col-md-7">
            <div class="panel-body ">
                 <asp:DataList ID="dataAddress" runat="server" class="col-md-12" OnItemCommand="dataAddress_ItemCommand"  >
                         <ItemTemplate>
                        <table class="table table-bordered " >
                            <tr>
                                <th>Social Site :</th>
                                <td><%# Eval("site_name") %></td>
                            </tr>
                            <tr>
                                <th>Link :</th>
                                <td><a href=<%# Eval("social_address") %>><%# Eval("social_address") %></a>  </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="Button1" CommandName="delete_link" CommandArgument='<%# Eval("social_link_id") %>' runat="server" Text="Delete" CssClass="btn btn-danger" /></td>
                              </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                   

                
                </asp:DataList>
               
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
