<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin-master.Master" AutoEventWireup="true" CodeBehind="search-result.aspx.cs" Inherits="webEducationTree.admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
     <li class="active"><a href="admin-home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
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
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span>Hi!! <span id="admin_name" runat="server">Admin</span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="admin-profile.aspx"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span> Sign out</a></li>
            
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
     <div style="padding:20px"></div>
    <div class="panel panel-primary ">
        <div class="panel-heading" style="text-align: center; font-size: 25px;">
            General Information
        </div>
        <div class="panel-body ">
            <asp:DataList ID="dataGeneral" runat="server" class="col-md-12">
                <ItemTemplate>
                    <table class="table table-bordered ">
                        <tr>
                            <th class="col-md-4">Member Name :</th>
                            <td><%# Eval("member_name") %></td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Date Of Birth :</th>
                            <td><%# Eval("member_dob") %></td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Gender :</th>
                            <td><%# Eval("member_gender") %></td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Email :</th>
                            <td><%# Eval("member_email") %></td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Mobile :</th>
                            <td><%# Eval("member_mobile") %></td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Education :</th>
                            <td><%# Eval("education_type") %></td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Job :</th>
                            <td><%# Eval("job_type") %> </td>
                        </tr>
                        <tr>
                            <th class="col-md-4">Company Name :</th>
                            <td><%# Eval("company_name") %> </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:DataList>

        </div>
    </div>
    <div class="panel panel-primary ">
        <div class="panel-heading" style="text-align: center; font-size: 25px;">
            Address
        </div>
        <div class="panel-body">
            <asp:DataList ID="dataAddress" runat="server" class="col-md-12">
                <ItemTemplate>
                    <table class="table table-bordered ">
                        <tr>
                            <th>Address Line 1 :</th>
                            <td><%# Eval("address_line_1") %></td>
                        </tr>
                        <tr>
                            <th>Address Line 2 :</th>
                            <td><%# Eval("address_line_2") %></td>
                        </tr>
                        <tr>
                            <th>City :</th>
                            <td><%# Eval("city_name") %></td>
                        </tr>
                        <tr>
                            <th>Taluka :</th>
                            <td><%# Eval("taluka_name") %></td>
                        </tr>
                        <tr>
                            <th>District :</th>
                            <td><%# Eval("district_name") %></td>
                        </tr>
                        <tr>
                            <th>State :</th>
                            <td><%# Eval("state_name") %></td>
                        </tr>

                    </table>
                    <br />
                </ItemTemplate>



            </asp:DataList>

        </div>
    </div>
    <div class="panel panel-primary ">
        <div class="panel-heading" style="text-align: center; font-size: 25px;">
            School / College Details
        </div>
        <div class="panel-body ">

            <asp:DataList ID="dataCollege" runat="server" class="col-md-12">
                <ItemTemplate>
                    <table class="table table-bordered ">
                        <tr>
                            <th>College Name :</th>
                            <td><%# Eval("college_name") %></td>
                        </tr>
                        <tr>
                            <th>College Type :</th>
                            <td><%# Eval("college_type") %></td>
                        </tr>
                        <tr>
                            <th>Year of Passing :</th>
                            <td><%# Eval("year_of_passing") %></td>
                        </tr>

                    </table>
                    <br />
                </ItemTemplate>



            </asp:DataList>

        </div>
    </div>

    <div class="panel panel-primary ">
        <div class="panel-heading" style="text-align: center; font-size: 25px;">
            Social Details
        </div>
        <div class="panel-body ">
            <asp:DataList ID="dataSocial" runat="server" class="col-md-12">
                <ItemTemplate>
                    <table class="table table-bordered ">
                        <tr>
                            <th>Social Site :</th>
                            <td><%# Eval("site_name") %></td>
                        </tr>
                        <tr>
                            <th>Link :</th>
                            <td><a href='<%# Eval("social_address") %>'><%# Eval("social_address") %></a>  </td>
                        </tr>

                    </table>
                    <br />
                </ItemTemplate>



            </asp:DataList>

        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
