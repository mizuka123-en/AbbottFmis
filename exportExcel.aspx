<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exportExcel.aspx.cs" Inherits="stjude.exportExcel" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register Src="~/menunavigazione.ascx" TagName="navTable" TagPrefix="uc3" %>
<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Esporta dati AF</title>
    <link rel="stylesheet" href="../resources/css/page.css" type="text/css" />
    <link rel="icon" href="../resources/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="../resources/favicon.ico" type="image/x-icon" />
    <link display="all" href="../resources/theme/OboutTextBox/style.css" rel="stylesheet"
        type="text/css" />
    <link display="all" href="../resources/theme/OboutButton/style.css" rel="stylesheet"
        type="text/css" />
        <script>
            function exportDetailAF() {
                
                if (document.getElementById('tx_dal').value == "" || document.getElementById('tx_al').value == "") {
                    alert("Inserisci un range di date");
                    return false;
                    }
                    else {
                        if (ddl_report.selectedIndex() != -1) {
                            report = ddl_report.options[ddl_report.selectedIndex()].value;
                        }
                        else {

                            alert("Selezionare una causale");
                            return false;
                        }
                        var response = '';
                        ob_post.ResetParams();
                        ob_post.AddParam("dal", document.getElementById('tx_dal').value);
                        ob_post.AddParam("al", document.getElementById('tx_al').value);
                        alert(report);
                        if (report =="report1")
                            response = ob_post.post(null, "CreaExcel");
                        if (report == "report2")
                            response = ob_post.post(null, "CreaExcel2");
                    }
               // gridGestUt.refresh();
            }
        </script>
</head> 
<body> <form id="form1" runat="server">
<% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/jquery/functionDiv.js" />
        </Scripts>
    </asp:ScriptManager>
   <div id="wrapper">
        <div id="pageBody">
            <div id="bodyPad">
            <uc1:header ID="Header1" runat="server" />
                <div id="navbar">
                    <% ut.drawMenu();%>
                </div>
            </div>
            <div id="menuopzioni">
            <table><tr><td>
            <asp:Button ID="btn_aggiungiImage" CssClass="btn" Text="Export US" runat="server" OnClick="CreaExcelEUR"  />
            <asp:Button ID="Button1" CssClass="btn" Text="Export IT" runat="server" OnClick="CreaExcelIT"  />
            <asp:Button ID="Button2" CssClass="btn" Text="Export IT FULL" runat="server" OnClick="CreaExcelITFull"  />
           
             </td></tr>
             <tr><td> <asp:Label ID="lbl_msg" runat="server" Text="" ForeColor="Red"></asp:Label></td></tr>
             </table>
            </div>
            <div id="kt-wrapper">
                <table border="0" width="100%">
                    <tr>
                        <td>
                            <div id="content">
                                  <table class="tabInsertStjude">
                                  <tr ><td colspan="4" class="tdLBLStjude">Indicare un range di date e cliccare sul tipo di report desiderato</td>
                                  </tr>
                                     <tr>
                                        <td  class="tdLBLStjude">
                                            Dal:
                                        </td>
                                        <td  class="tdDATStjude">
                                            <asp:TextBox ID="tx_dal" runat="server" Width="100px" Text=""></asp:TextBox>
                                                <obout:Calendar ID="Calendar1" runat="server" CultureName="it-IT" StyleFolder="/resources/theme/calendar/graphite"
                                                ShowMonthSelector="true" MonthSelectorType="HtmlList" DateFormat="dd/MM/yyyy"
                                                DatePickerMode="true" TextBoxId="tx_dal"  Columns="2" DatePickerImagePath="/resources/theme/calendar/orbitz/icon2.gif" />
                                        </td></tr><tr>
                                        <td class="tdLBLStjude">
                                            Al:
                                        </td>
                                        <td  class="tdDATStjude">
                                            <asp:TextBox ID="tx_al" runat="server" Width="100px" Text=""></asp:TextBox>
                                                <obout:Calendar ID="Calendar2" runat="server" CultureName="it-IT" StyleFolder="resources/theme/calendar/graphite"
                                                ShowMonthSelector="true" MonthSelectorType="HtmlList" DateFormat="dd/MM/yyyy"
                                                DatePickerMode="true" TextBoxId="tx_al" Columns="2" DatePickerImagePath="resources/theme/calendar/orbitz/icon2.gif" />
                                        </td>
                                    </tr></table>
                                    <br /><br />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div><ucFooter:footer runat="server" ID="foot" />
    </div>
    
   
    </form>

</body>
</html>
