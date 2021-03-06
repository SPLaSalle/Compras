﻿<%-- Las 4 líneas siguientes son directivas ASP.NET necesarias cuando se usan componentes de SharePoint --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- El marcado y el script del elemento Content siguiente se pondrán en el elemento <head> de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Agregue sus estilos CSS al siguiente archivo -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Agregue el código JavaScript al siguiente archivo -->
    <script type="text/javascript" src="../Scripts/Default.js"></script>


    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-old.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-responsive.min.css" />

    <script type="text/javascript" src="../Scripts/bootstrap-old.min.js"></script>
</asp:Content>

<%-- El marcado del elemento Content siguiente se pondrá en el elemento TitleArea de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Home
</asp:Content>

<%-- El marcado y el script del elemento Content siguiente se pondrán en el elemento <body> de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div>
      <ul class="nav navbar-nav" style="border: 1px solid black;">
        <li class="active"><a href="Default.aspx?{StandardTokens}">Home</a></li>
        <li><a href="new.aspx?{StandardTokens}">Nova sol·licitud</a></li>
        <li><a href="miscompras.aspx?{StandardTokens}">Les meves sol·licituds</a></li>
        <li><a href="Manager.aspx?{StandardTokens}">Manager de compres</a></li>
        <li><a href="../Lists/Compras">Llista compras</a></li>
        <li><a href="../Lists/Actions">Llista accions</a></li>
      </ul>
    </div>
  </div>
</nav>
    
    <div class="span5">
    <h3>Nova sol·licitud</h3>
    <p>A l'apartat de nova sol·licitud pots omplir el formulari per una nova compra. <i>Estat: funciona.</i></p>
    <h3>Les meves sol·licituds</h3>
    <p>A l'apartat de les meves sol·licituds pots veure l'estat de les teves sol·licituds i registrar canvis. <i>Estat: funciona.</i></p>
    <h3>Manager de compres</h3>
    <p>L'apartat de mànager de compres nomes hauria de ser disponible per la gent encargada de administrar les compres. Com que l'app encara esta en versió prematura tothom hi pot accedir ara per ara. <i>Estat: funciona.</i></p>
    <h3>Llistes</h3>
    <p>Aquests apartats no s'haurien de veure, només hi son per ajudar...</p>
    </div>

</asp:Content>
