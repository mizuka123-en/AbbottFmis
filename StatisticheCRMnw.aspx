<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticheCRMnw.aspx.cs" Inherits="stjude.crm.StatisticheCRMnw" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Models" Assembly="Syncfusion.EJ" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="h1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <h1:header ID="Header2" runat="server" />
    <title>Statistiche CRM</title>
   <link rel="stylesheet" href="../resources/css/page_22.css" type="text/css" />
    <link rel="icon" href="../resources/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="../resources/favicon.ico" type="image/x-icon" />
    <link display="all" href="../resources/theme/OboutTextBox/style.css" rel="stylesheet"
        type="text/css" />
    <link display="all" href="../resources/theme/OboutButton/style.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
    
 
        function Aggiorna() {

            location.href = "StatisticheCRMnw.aspx?dal=" + document.getElementById("tx_dal").value + "&al=" + document.getElementById("tx_al").value;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
<% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/jquery/functionDiv.js" />
        </Scripts>
    </asp:ScriptManager>  <% ut.drawMenu22();%>
            <div class="container-fluid page-body-wrapper">
     
               <div class="row mb-12 tabFMS">
                         <h4>Esportazione dati Schede Impianti</h4>
                   </div>
  
            </div> 
               
            <div id="menuopzioniDIVISION">
               
                  <asp:Label ID="lbl_msg" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
                    <div class="col-lg-4 stretch-card grid-margin">
                        <table class="tabInsertStjude">
                        <tr ><td colspan="4" class="tdLBLStjude">Indicare un range di date e cliccare sul tipo di report desiderato</td>
                                  
                        </tr>
                            <tr>
                            <td  class="tdLBLStjude">
                                Dal:
                            </td>
                            <td  class="tdDATStjude">

                                    <ej:DatePicker runat="server" ID="tx_dal" DateFormat="dd/MM/yyyy" CssClass="form-control"></ej:DatePicker>
                            </td></tr><tr>
                            <td class="tdLBLStjude">
                                Al:
                            </td>
                            <td  class="tdDATStjude">
                                <ej:DatePicker runat="server" ID="tx_al"  DateFormat="dd/MM/yyyy" CssClass="form-control"></ej:DatePicker>
                            </td>
                        </tr>
                            <tr>
                            <td class="tdDATStjude" colspan="2">
                                <input type="button" class="btn" id="bt_creaScheda" onclick="Aggiorna()" value="Visualizza" />
                                <asp:Button ID="Button2" CssClass="btn" Text="Export Excel" runat="server" OnClick="CreateExcelAll2" />
                            </td>
                               
                        </tr>

                        </table>
                        </div>
            <div class="col-lg-12 stretch-card grid-margin">
                                     <ej:Grid ID="gridGestCRM" runat="server"  AllowSorting="true" AllowPaging="true" 
                                    AllowFiltering="true" AllowGrouping="true"  Locale="it-IT">
                                                                <Columns>
                                                                    <ej:Column Field="idimpianto" Visible="false"></ej:Column>
                                                                     <ej:Column Field="numbolla" HeaderText="Num Bolla" Width="110">
                                                                       
                                                                    </ej:Column>
                                                                    <ej:Column Field="regione" HeaderText="Regione" Width="100">
                                                                      
                                                                    </ej:Column>
                                                                    <ej:Column Field="fce"  HeaderText="FTE" Width="110">
                                                                    </ej:Column>
                                                                    <ej:Column Field="modello" HeaderText="Modello" Width="200">
                                                                     
                                                                    </ej:Column>
                                                                    <ej:Column Field="ospedale" HeaderText="Ospedale/Dest" Width="180" >
                                                                       
                                                                    </ej:Column>
                                                                    
                                                                    <ej:Column Field="snlotto" HeaderText="Sn lotto" Width="120">
                                                                      
                                                                    </ej:Column>
                                                                   
                                                                     <ej:Column Field="impianto" HeaderText="Impianto" Width="70">
                                                                      
                                                                    </ej:Column>
                                                                    <ej:Column Field="dataimpianto" HeaderText="Data Impianto" Width="100">
                                                                      
                                                                    </ej:Column>
                                                                     
                                                                </Columns>
                                                            </ej:Grid>
                                                           <asp:HiddenField runat="server" ID="datadal" Value="" />
                                                          <asp:HiddenField runat="server" ID="dataal" Value="" />
                                                         
                            </div>
    
   <ucFooter:footer runat="server" />
    </form>
</body>
</html>
