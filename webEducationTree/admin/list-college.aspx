<%@ Page Title="College List" Language="C#" MasterPageFile="~/admin/admin-master.Master" AutoEventWireup="true" CodeBehind="list-college.aspx.aspx.aspx.aspx.cs" Inherits="webEducationTree.admin.list_college" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
    <li class=""><a href="admin-home.aspx"><span class="glyphicon glyphicon-home"></span>Home</a></li>
    <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-blackboard"></span>College<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="college-register.aspx"><span class="glyphicon glyphicon-save-file"></span>Register college</a></li>
            <li><a href="list-college.aspx"><span class="glyphicon glyphicon-list-alt"></span>College list</a></li>

        </ul>
    </li>
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-map-marker"></span>Address<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="state-register.aspx"><span class="glyphicon glyphicon-king"></span>State</a></li>
            <li><a href="register-district.aspx"><span class="glyphicon glyphicon-queen"></span>District</a></li>
            <li><a href="register-taluka.aspx"><span class="glyphicon glyphicon-knight"></span>Taluka</a></li>
            <li><a href="register-city.aspx"><span class="glyphicon glyphicon-pawn"></span>City</a></li>

        </ul>
    </li>
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-eye-open"></span>Administration<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="admin-register.aspx"><span class="glyphicon glyphicon-save-file"></span>Register admin</a></li>
            <li><a href="list-admin.aspx"><span class="glyphicon glyphicon-list-alt"></span>Admin List</a></li>

        </ul>
    </li>
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span>Hi!!
        <label id="admin_name" runat="server">Admin</label>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="admin-profile.aspx"><span class="glyphicon glyphicon-user"></span>Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span>Sign out</a></li>

        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <!--  <form class="form-inline" >
  <label class="sr-only" for="inlineFormInput">State : </label>
          
  <label class="sr-only" for="inlineFormInput">District : </label>
         <div class="input-group mb-2 mr-sm-2 mb-sm-0">
          
             </div>
 

</form>
    -->
    <div style="margin-top: 20px">
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading" style="text-align: center; font-size: 25px;">
                        Search College
                    </div>
                    <div class="panel-body">
                        <div id="formCollegeSearch">
                            <div class="form-group ">
                                <label for="drdState ">State : </label>

                                <asp:DropDownList ID="drdState" class="form-control " runat="server" AutoPostBack="True" OnSelectedIndexChanged="drdState_SelectedIndexChanged" required="required"></asp:DropDownList>

                            </div>
                            <div class="form-group ">
                                <label for="drdDistrict ">District : </label>

                                <asp:DropDownList ID="drdDistrict" class="form-control " runat="server" required="required"></asp:DropDownList>

                            </div>
                            <div class="form-group ">
                                <label for="drdCollegeType ">College Type : </label>

                                <asp:DropDownList ID="drdCollegeType" class="form-control " runat="server" required="required">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>S.S.C.</asp:ListItem>
                                    <asp:ListItem>H.S.C.</asp:ListItem>
                                    <asp:ListItem>Diploma</asp:ListItem>
                                    <asp:ListItem>U.G.</asp:ListItem>
                                    <asp:ListItem>P.G.</asp:ListItem>
                                    <asp:ListItem>Doctorate</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <asp:Button ID="btnSearch" class="btn btn-primary " runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
                <div id="error" runat="server" class="alert alert-danger alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Error!</strong> Error while deleting college.
                </div>
                <div id="success" runat="server" class="alert alert-success alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Success</strong><p id="error_message" runat="server">College name deleted successfully.</p>
                </div>
            </div>

            <div class="col-md-8">

                <asp:DataList ID="dataCollegeName" runat="server" class="table table-bordered table-hover" OnItemCommand="dataCollegeName_ItemCommand">
                    <HeaderTemplate>
                        <th># </th>
                        <th>College Name</th>
                        <th>College District</th>
                        <th>College City</th>
                        <th>College Type</th>
                        <th colspan="2">Operations</th>
                    </HeaderTemplate>
                    <ItemTemplate>

                        <td>
                            <%#Container.ItemIndex+1 %>
                        </td>
                        <td>
                            <%# Eval("college_name") %>
                        </td>
                        <td><%# Eval("district_name") %></td>
                        <td><%# Eval("city_name") %></td>
                        <td><%# Eval("college_type") %></td>
                        <td>
                            <asp:Button ID="edit" CommandName="edit_college" CommandArgument='<%# Eval("college_id") %>' runat="server" Text="Edit" CssClass="btn btn-warning" /></td>
                        <td>
                            <asp:Button ID="delete" CommandName="delete_college" CommandArgument='<%# Eval("college_id") %>' runat="server" Text="Delete" CssClass="btn btn-danger" /></td>

                        
                        <cc1:ConfirmButtonExtender ID="cbe" runat="server" TargetControlID="delete" ConfirmOnFormSubmit="true" ConfirmText="Do you want to delete this record"></cc1:ConfirmButtonExtender>
                       <!--- <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="delete" OkControlID="btnYes"
                            CancelControlID="btnNo" BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="pnlPopup" runat="server" CssClass="modal fade" role="dialog" Style="display: none">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Confirmation</h4>

                                    </div>
                                    <div class="modal-body">
                                        <p>Do you want to delete this record?</p>
                                    </div>

                                    <div class="modal-footer">
                                        <asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="btn btn-success" data-dismiss="modal" />
                                        <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-warning" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>-->
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:DataList>

            </div>
        </form>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
