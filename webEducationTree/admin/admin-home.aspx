<%@ Page Title="Admin Home" Language="C#" MasterPageFile="~/admin/admin-master.Master" AutoEventWireup="true"
    CodeBehind="admin-home.aspx.cs" Inherits="webEducationTree.admin.admin_home" %>

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
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span>Hi!! <label id="admin_name" runat="server">Admin</label> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="admin-profile.aspx"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span> Sign out</a></li>
            
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
