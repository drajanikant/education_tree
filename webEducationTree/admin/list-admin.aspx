<%@ Page Title="Admin User List" Language="C#" MasterPageFile="~/admin/admin-master.Master" AutoEventWireup="true" CodeBehind="list-admin.aspx.cs" Inherits="webEducationTree.admin.list_admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
     <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
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
        <div style="margin-top:20px"></div>
      <div class="col-md-4"></div>
      <div class="col-md-8">
            <form id="admin_list" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:DataList ID="dataAdminName" runat="server" class="table table-bordered table-hover" OnItemCommand="dataAdminName_ItemCommand"  >
                <HeaderTemplate>
                    <th># </th>
                    <th>Admin Name</th>
                    <th>Admin Email</th>
                    <th>Admin Contact</th>
                    
                    <th colspan="2"> Operations</th>
                </HeaderTemplate>
                <ItemTemplate>
                    
                        <td>
                            <%#Container.ItemIndex+1 %>
                        </td>
                        <td>
                            <%# Eval("admin_name") %>
                        </td>
                        <td><%# Eval("admin_email") %></td>
                        <td><%# Eval("admin_contact") %></td>
                        
                        <td><asp:Button ID="edit" CommandName="edit_admin" CommandArgument=<%# Eval("admin_id") %> runat="server" text="Edit" CssClass="btn btn-warning" /></td>
                        <td><asp:Button ID="delete" CommandName="delete_admin" CommandArgument=<%# Eval("admin_id") %> runat="server" Text="Delete" CssClass="btn btn-danger" /></td>
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="delete" ConfirmOnFormSubmit="true" ConfirmText="Are you sure to delete this record" />
                     </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:DataList>
               </form> 

          <div id="success" runat="server" class="alert alert-success alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Success</strong> Admin deleted successful.
        </div>
        <div id="error" runat="server" class="alert alert-danger alert-dismissable">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          <strong>Error!</strong><p id="error_msg" runat="server"> Failed delete operation.</p>
        </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
