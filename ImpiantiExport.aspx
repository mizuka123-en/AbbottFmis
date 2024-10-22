<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImpiantiExport.aspx.cs" Inherits="stjude.crm.ImpiantiExport" %>
<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="h1" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Models" Assembly="Syncfusion.EJ" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Export Impianti</title>
    <h1:header ID="Header" runat="server" />
    <link rel="icon" href="../resources/favicon.ico" type="image/x-icon" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link rel="shortcut icon" href="../resources/favicon.ico" type="image/x-icon" />
  <script src="../../Scripts/ej/i18n/ej.culture.it-IT.min.js" type="text/javascript"></script>
        <script>
      
        function Aggiorna() {

            location.href = "ImpiantiExport.aspx?dal=" + document.getElementById("tx_dal").value + "&al=" + document.getElementById("tx_al").value;
        }
        </script>
</head>
<body> <form id="form1" runat="server">
 <% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
      </asp:ScriptManager>
      <% ut.drawMenu22();%>
       <div class="container-fluid page-body-wrapper">
     
         <div class="row mb-12 tabFMS">
                   <h4>Elenco Schede Impianti</h4>
             </div>
        
      </div> 
            
            <div id="menuopzioniDIVISION">
            <asp:Button ID="Button1" CssClass="btn" Text="Export CD" runat="server" OnClick="CreaExcelITCD" />
             <asp:Button ID="Button3" CssClass="btn" Text="Export PM" runat="server" OnClick="CreaExcelITPMN" />
            <asp:Button ID="Button2" CssClass="btn" Text="Export PM3" runat="server" OnClick="CreaExcelITPM" />
            <asp:Button ID="Button4" CssClass="btn" Text="Export DM" runat="server" OnClick="CreaExcelITDM" />
            <asp:Button ID="Button5" CssClass="btn" Text="Export LS" runat="server" OnClick="CreaExcelITAV" />
            <asp:Label ID="lbl_msg" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
              <div class="col-lg-4 stretch-card grid-margin">
                                 <table class="tabInsertStjude">
                                  <tr>
                                      <td colspan="5" class="tdLBLStjude">Indicare un range di date e cliccare sul tipo di report desiderato</td>
                                 </tr>
                                     <tr>
                                        <td class="tdLBLStjude">
                                            Dal:
                                        </td>
                                        <td  class="tdDATStjude">
                                            <ej:DatePicker runat="server" ID="tx_dal" DateFormat="dd/MM/yyyy" CssClass="form-control"></ej:DatePicker>
                                        </td>
                                        <td class="tdLBLStjude">
                                            Al:
                                        </td>
                                        <td class="tdDATStjude">
                                             <ej:DatePicker runat="server" ID="tx_al"  DateFormat="dd/MM/yyyy" CssClass="form-control"></ej:DatePicker>
                                          </td> 
                                         </tr>
                                     <tr>
                                     <td class="tdDATStjude" colspan="5">
                                         <input type="button" class="btn" id="bt_creaScheda" onclick="Aggiorna()" value="Visualizza" />
                                     </td>
                                    </tr>
                                 </table>
                                  
                  </div>
                   <div class="col-lg-12 stretch-card grid-margin">
                                     <ej:Grid ID="gridGestUt" runat="server" AllowSorting="true" AllowPaging="true" 
                                        AllowFiltering="true" AllowGrouping="true"  Locale="it-IT"
                                                                 >
                                        <Columns>
                                            <ej:Column  Field="idimpianto" Visible="false"></ej:Column>
                                            <ej:Column Field="regione" HeaderText="Regione" Width="100">
                                                                        
                                            </ej:Column>
                                            <ej:Column Field="fce"  HeaderText="FTE" Width="150">
                                            </ej:Column>
                                            <ej:Column Field="modello" HeaderText="Modello" Width="250">
                                                                       
                                            </ej:Column> 
                                                <ej:Column Field="ospedale" HeaderText="Ospedale" Width="180">
                                                                       
                                            </ej:Column>
                                                                    
                                            <ej:Column Field="snlotto" HeaderText="Sn lotto" Width="150">
                                                                       
                                            </ej:Column>
                                                                   
                                            <ej:Column Field="dataimpianto" format="{0:dd/MM/yyyy}" HeaderText="Data Impianto" Width="100">
                                                                        
                                            </ej:Column>
                                                                     
                                        </Columns>
                                    </ej:Grid>
                                    
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>" 
                                        SelectCommand="SELECT  case when autonomia = 0 then concat(u.cognome, ' ', u.nome) else 'Autonomia' end as fce, (select titolo from prodotti where idprodotto = ir.modelloaccessori) as modello,
                                        case when i.ospedaledest <> 0 then (select ospedale from ospedali where idospedale = i.ospedaledest)  else  (case when i.interna = 0 then (select ospedale from ospedali where idospedale = i.ospedale)  else (select concat(upper(Cognome),' ', upper(Nome)) from utenti where idutente = i.ospedale) end) end as ospedale,
                                        case when i.interna = 0 then o.regione else (select regione from utenti where idutente = i.ospedale) end as regione, 
                                        substring(p.modelnumber,3,1) as camere, o.area, '' as areafte, o.customername, ir.snlotto, i.dataimpianto, case when i.upgrade > 0 then 'TRUE' else 'FALSE' end as upgrade,
                                         case when i.primaria >0 then 'TRUE' else 'FALSE' end as primaria, case when i.sostituzione>0 then 'TRUE' else 'FALSE' end as sostituzione, o.salesperson, 
                                         '' as Family, ir.descrizione, i.upgrade, i.primaria, i.sostituzione, year(dataimpianto) as Year, case when month(dataimpianto) > 0 
                                         and month(dataimpianto) <= 3 then 1 when month(dataimpianto) > 3 and month(dataimpianto) <= 6 then 2 when month(dataimpianto) > 6 
                                         and month(dataimpianto) <= 9 then 3 when month(dataimpianto) > 9 and month(dataimpianto) <= 12 then 4 end as qtr, month(dataimpianto) as month1,
                                          week(dataimpianto) as week1, WEEKDAY(dataimpianto) +1 as weekday, '' as fieldaction 
                                          , case when sostserial <> '' then concat('SOST ',p.modelnumber,' SN ',sostserial, ' DEL ',DATE_FORMAT(sostdataimp,'%d-%m-%Y') ) end  as sostituzione
                                           FROM impianti i inner join impianti_righe ir 
                                          on i.idimpianto = ir.idimpianto left join ospedali o on i.ospedale = o.idospedale left join utenti u on i.idutente = u.idutente left join prodotti p 
                                          on ir.modelloaccessori = p.idprodotto where i.impiantionoff = 1 and (p.modelnumber like 'CD%' or p.modelnumber like 'PM%') #dataimpianto# order by i.idimpianto desc " 
                                        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>"  OnSelecting="SelDAt">
                                            
                                    </asp:SqlDataSource>
            </div>
   <ucFooter:footer ID="Footer2" runat="server" />
    </form>

</body>
</html>
