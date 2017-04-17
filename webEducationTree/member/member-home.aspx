<%@ Page Title="Member Home" Language="C#" MasterPageFile="~/member/member.Master" AutoEventWireup="true" CodeBehind="member-home.aspx.cs" Inherits="webEducationTree.member.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
    <li class="active"><a href="member-home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    <li class="dropdown "><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span> Hi!!
        <span id="admin_name" runat="server"> Admin</span>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="member-profile.aspx"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span> Sign out</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
