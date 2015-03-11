<%-- Las 4 líneas siguientes son directivas ASP.NET necesarias cuando se usan componentes de SharePoint --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- El marcado y el script del elemento Content siguiente se pondrán en el elemento <head> de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="../Scripts/knockout-2-2-1.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Agregue sus estilos CSS al siguiente archivo -->
    <link rel="Stylesheet" type="text/css" href="../Content/Manager2.css" />

    <!-- Agregue el código JavaScript al siguiente archivo -->
    <script type="text/javascript" src="../Scripts/Manager.js"></script>

    <!-- BOOTSTRAP -->
    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-old.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-responsive.min.css" />

    <script type="text/javascript" src="../Scripts/bootstrap-old.min.js"></script>

</asp:Content>

<%-- El marcado del elemento Content siguiente se pondrá en el elemento TitleArea de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Manager
</asp:Content>

<%-- El marcado y el script del elemento Content siguiente se pondrán en el elemento <body> de la página --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div class="container" id="wrapper">

        <div class="row">
            
            <!-- LLISTA -->
            <div class="span5">
                
                <div style="height: 170px">
                    <h3>Filtre</h3>
                    <form>
                        <fieldset>
                            <label>Assumpte: <input type="text" placeholder="Type something…"></label>
                            <label>Autor: <input type="text" placeholder="Type something…"></label>
                            <button type='button' onclick="console.log('clickey');" class="btn">Filtra</button>
                        </fieldset>
                    </form>
                </div>

                <div id="list">
                    
                    <div class="spinner" id="spinner_list">
                        <div class="spinner-container container1">
                            <div class="circle1"></div>
                            <div class="circle2"></div>
                            <div class="circle3"></div>
                            <div class="circle4"></div>
                        </div>
                            <div class="spinner-container container2">
                            <div class="circle1"></div>
                            <div class="circle2"></div>
                            <div class="circle3"></div>
                            <div class="circle4"></div>
                        </div>
                            <div class="spinner-container container3">
                            <div class="circle1"></div>
                            <div class="circle2"></div>
                            <div class="circle3"></div>
                            <div class="circle4"></div>
                        </div>
                    </div>

                    <div class="panel panel-primary" id="list_show" style="display: none">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h3>Compres</h3></div>

                    <table class="table table-hover"  data-bind="foreach: compras">

                        <tr data-bind="click: $parent.showinfo">
                            <td>
                                <div class="title"><b data-bind="text: title"></b> (id <j data-bind="text: id"></j>)</div>
                                <div class="author" data-bind="text: author"></div>
                                <div class="date" data-bind="text: date"></div>
                            </td>
                        </tr>
                    </table>
                    </div>
                </div>

            </div>
            
            <!-- INFO -->
            <div class="span7">

                <div style="height: 170px">
                    <h3>Edit</h3>
                    <button type='button' id="button1" onclick="accio();" class="btn" disabled>Acció</button>
                    <button type="button" id="button2" class="btn" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat" disabled>Comentar</button> 
                </div>

                <div id="info">
                    <div class="panel panel-primary">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h3>Detalls</h3></div>

                    <table class="table table-hover" id="table_info">
                        
                        <tr>
                            <td >
                                <b>ID</b>
                            </td>
                            <td id="table_info_id">
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <b>Títol</b>
                            </td>
                            <td id="table_info_title">
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <b>Autor</b>
                            </td>
                            <td id="table_info_author">
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <b>Data</b>
                            </td>
                            <td id="table_info_date">
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <b>Descripció</b>
                            </td>
                            <td id="table_info_desc">
                            </td>
                        </tr>
                        <tr>

                            <td colspan="2">
                                <b>Historial</b>
                                
                                <div class="spinner" id="spinner_actions" style="display: none;">
                                    <div class="spinner-container container1">
                                        <div class="circle1"></div>
                                        <div class="circle2"></div>
                                        <div class="circle3"></div>
                                        <div class="circle4"></div>
                                    </div>
                                        <div class="spinner-container container2">
                                        <div class="circle1"></div>
                                        <div class="circle2"></div>
                                        <div class="circle3"></div>
                                        <div class="circle4"></div>
                                    </div>
                                        <div class="spinner-container container3">
                                        <div class="circle1"></div>
                                        <div class="circle2"></div>
                                        <div class="circle3"></div>
                                        <div class="circle4"></div>
                                    </div>
                                </div>

                                <table class="table table-bordered" id="table_actions" data-bind="foreach: info" style="display: none; width: 100%;">
                                    <tbody>
                                    <tr>
                                        <td class="omg">
                                            <!-- ko if: type === 'Comment' -->
                                            <div><b>Comment</b></div>
                                            <div><i data-bind="text: author"></i></div>
                                            <div data-bind="text: content"></div>
                                            <!-- /ko -->
                                            <!-- ko if: type === 'Action' -->
                                            <div><b data-bind="text: content"></b></div>
                                            <div><i data-bind="text: author"></i></div>
                                            <div><i data-bind="text: date"></i></div>
                                            <!-- /ko -->
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </table>

                </div>
                    </div>
            
            </div>

        </div>

    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel">New message</h4>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="message-text" class="control-label">Message:</label>
                <textarea class="form-control" id="modal_comment"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="comment();">Send message</button>
          </div>
        </div>
      </div>
    </div>

</asp:Content>
