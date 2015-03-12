<%-- Las 4 líneas siguientes son directivas ASP.NET necesarias cuando se usan componentes de SharePoint --%>

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
    <script type="text/javascript" src="../Scripts/New.js"></script>


    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-old.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-responsive.min.css" />

    <script type="text/javascript" src="../Scripts/bootstrap-old.min.js"></script>
</asp:Content>

<%-- El marcado del elemento Content siguiente se pondrá en el elemento TitleArea de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Nova sol·licitud
</asp:Content>

<%-- El marcado y el script del elemento Content siguiente se pondrán en el elemento <body> de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div>
      <ul class="nav navbar-nav" style="border: 1px solid black;">
        <li><a href="Default.aspx?{StandardTokens}">Home</a></li>
        <li class="active"><a href="new.aspx?{StandardTokens}">Nova sol·licitud</a></li>
        <li><a href="miscompras.aspx?{StandardTokens}">Les meves sol·licituds</a></li>
        <li><a href="Manager.aspx?{StandardTokens}">Manager de compres</a></li>
        <li><a href="../Lists/Compras">Llista compras</a></li>
        <li><a href="../Lists/Actions">Llista accions</a></li>
      </ul>
    </div>
  </div>
</nav>

    
    <form>
     
        <fieldset>

            <div class="row">
                <label class="span1 offset1">Title: </label><input class="span4" type="text" placeholder="Type something…" id="title" >
            </div>
            <div class="row">
                <label class="span1 offset1">Description: </label><input class="span4" type="text" placeholder="Type something…" id="desc">
            </div>
            <div class="row">
                <button type='button' onclick="envia();" class="btn offset1">Envia</button>
            </div>
        </fieldset>
                        
    </form>

</asp:Content>
