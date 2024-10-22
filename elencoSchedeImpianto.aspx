<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="elencoSchedeImpianto.aspx.cs" Inherits="stjude.crm.elencoSchede" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register Src="~/navigazione.ascx" TagName="navTable" TagPrefix="uc3" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Models" Assembly="Syncfusion.EJ" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="h1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <h1:header ID="Header2" runat="server" />
    <title>Elenco Schede Impianto</title>
     <script type="text/javascript">
      function Aggiorna() {

          document.getElementById('snlotto').value = document.getElementById('tx_snlotto').value;
          document.getElementById('customernumber').value = document.getElementById('tx_customernumber').value;
          document.getElementById('customername').value = document.getElementById('tx_customername').value;
            gridGestUt.refresh();
            grid1.refresh();
        }
         function ModificaCrm(obj) {
                    deselectAllCrm();
             location.href = "fms_schedampiantocrm.aspx?idimpianto=" + obj.id.replace('bt_modbolla_', '');
            }
            function InviaBolla() {
                var selRecord = '';
                for (var i = 0; i < gridGestUt.SelectedRecords.length; i++) {
                    selRecord = selRecord + gridGestUt.SelectedRecords[i].idimpianto;
                }
                if (selRecord.length > 0) {
                    deselectAllCrm();
                    ob_post.ResetParams();
                    ob_post.AddParam("idimpianto", selRecord);
                    var response = ob_post.post(null, "InviaScheda");
                    gridGestUt.refresh();
                    showMessage(response);
                }
                else {
                    alert("Selezionare una scheda");
                    return false;
                }
            }
            function EliminaCrm(obj) {
                var str = obj.id.replace('bt_delbolla_', '').split("_");
                if (!confirm('Attenzione: Vuoi eliminare gli elementi selezionati? \r\n Premendo \'OK\' verrànno rimossi in modo permanente.')) {
                    deselectAllCrm();
                    return false;
                }
                else {
                    
                    if (str[1] == "Inviata") {
                        showMessage("Impossibile eliminare una bolla inviata");
                    }
                    else {
                        
                        deselectAllCrm();
                        ob_post.ResetParams();
                        ob_post.AddParam("idimpianto", str[0]);
                        var response = ob_post.post(null, "EliminaCrm");
                        gridGestUt.refresh();
                        showMessage(response);
                    }
                }
            }
           
            
            function ModificaCrmInterna(obj) {

                var str = obj.id.replace('bt_modbolla_', '');
                location.href = "fms_schedampiantocrm_interna.aspx?idimpianto=" + str;
              
            }
            function EliminaCrmInterna(obj) {
                var str = obj.id.replace('bt_delbolla_', '').split("_");
               
                if (!confirm('Attenzione: Vuoi eliminare gli elementi selezionati? \r\n ' + str[0] + ' \r\n Premendo \'OK\' verrànno rimossi in modo permanente.')) {
                    deselectAllCrm();
                    return false;
                }
                else {


                    if (str[1] == "Inviata") {
                        showMessage("Impossibile eliminare una bolla inviata");
                        return false;
                    }
                    else {

                        deselectAllCrm();
                        ob_post.ResetParams();
                        ob_post.AddParam("idimpianto", str[0]);
                        var response = ob_post.post(null, "EliminaCrm");
                        grid1.refresh();
                        showMessage(response);
                    }

                }
            }

            function deselectAllCrmInterna() {
                for (i = 0; i < grid1.Rows.length; i++) {
                    grid1.deselectRecord(i);
                }
                grid1.SelectedRecordsContainer.value = "";
                grid1.SelectedRecords = new Array();
            }
            
            function deselectAllCrm() {
                for (i = 0; i < gridGestUt.Rows.length; i++) {
                    gridGestUt.deselectRecord(i);
                }
                gridGestUt.SelectedRecordsContainer.value = "";
                gridGestUt.SelectedRecords = new Array();
            }
     </script>
<link rel="stylesheet" href="../resources/css/page_22.css" type="text/css" />
<link rel="icon" href="../resources/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="../resources/favicon.ico" type="image/x-icon" />
<link display="all" href="../resources/theme/OboutTextBox/style.css" rel="stylesheet" type="text/css" />
<link display="all" href="../resources/theme/OboutButton/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/jquery/functionDiv.js" />
        </Scripts>
    </asp:ScriptManager> <% ut.drawMenu22();%>
     <div id="wrapper">
        <div id="pageBody">

          
                <asp:HiddenField runat="server" ID="snlotto" Value="1x1" />
                <asp:HiddenField runat="server" ID="customernumber" Value="1x1" />
                <asp:HiddenField runat="server" ID="customername" Value="1x1" />
                <section class="pb-12">
                    <div class="bg-white tabInsertENG">
                        <section class="w-100 p-12 pb-12">
                        <div class="row mb-6 trLBLENG">
                            <div class="col-auto tdLBLENG">
                                <div class="form-outline">
                                    <label class="form-label" for="cmb_tipobolla">CUSTOMER NAME:</label>
                                </div>
                            </div>
                            <div class="col-auto tdDATENG">
                                <div class="form-outline ">
                                    <input type="text" id="tx_customername" name="tx_customername" value="" />

                                </div>
                            </div>
                            <div class="col-auto tdLBLENG">
                                <div class="form-outline ">
                                    <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">
                                        CUSTOMER NUMBER:
                                    </label>

                                </div>
                            </div>
                            <div class="col-auto tdDATENG">
                                <div class="form-outline ">
                                    <input type="text" id="tx_customernumber" name="tx_customernumber" value="" />

                                </div>
                            </div>
                        </div>
                        <div class="row mb-4 trLBLENG">
                            <div class="col-auto tdLBLENG">
                                <div class="form-outline ">
                                    <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">
                                        SNLOTTO:
                                    </label>
                                </div>
                            </div>
                            <div class="col-auto tdDATENG">
                                <div class="form-outline ">
                                    <input type="text" id="tx_snlotto" name="tx_snlotto" value="" /></div>
                            </div>

                            <div class="col-auto tdLBLENG">
                                <div class="form-outline ">
                                    <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">
                                        <input type="button" class="btnSmall" id="Button2" onclick="Aggiorna()" value="CERCA" style="padding: 5px; width: 120px; height: 30px;" />
                                    </label>

                                </div>
                            </div>
                           
                        </div>
                        <div class="row mb-4 trLBLENG">
                            <div class="col-auto ">
                                <div class="form-outline ">
                                    <input type="button" class="btn" id="bt_creaImpianto" onclick="window.location.href='fms_schedampiantocrm.aspx'" value="Crea Impianto" />
                                </div>
                            </div>
                            <div class="col-auto ">
                                <div class="form-outline ">
                                    <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">
                                        <input type="button" class="btn" id="Button6" onclick="window.location.href='fms_schedampiantocrm_interna.aspx'" value="Crea Scheda Interna" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-auto ">
                                <div class="form-outline ">
                                    <input type="button" class="btnblu" id="bt_Attivita" onclick="window.location.href='ImpiantiExport.aspx'" value="Esporta Impianti" />
                                </div>
                            </div>
                            <div class="col-auto ">
                                <div class="form-outline ">
                                    <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">
                                        <input type="button" class="btnblu" id="Button3" onclick="window.location.href='StatisticheCRMnw.aspx'" value="Esporta Tutto" />
                                    </label>

                                </div>
                            </div>
                        </div>
                        </section>
                    </div>
                </section>
                <section class="pb-12 horiz-scrollable">
                      <div class="row mb-12">
                                 <table class="tabFMS" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                Elenco Schede Impianti:
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                    <div class="bg-white tabInsertENG rowelenco">
                          <section class="w-100 p-12 pb-12" >
                             
                               <div class="row mb-12">
                            <asp:Panel ID="pnDesc" runat="server" CssClass="horiz-scrollable">
                                <div class="rowelenco">
                            <asp:ValidationSummary ID="ValidationSummary1" class="ActionMessage" ValidationGroup="utente"
                                runat="server" HeaderText="Attenzione! Si sono verificati i seguenti errori:" />
                            <div class="ActionMessage" visible="false" id="divControllo" runat="server">
                                <asp:Label ID="lbl_errore" runat="server"></asp:Label></div>
                                                    
                                    <obout:Grid ID="gridGestUt" runat="server" Serialize="true" AutoGenerateColumns="false"
                                        FolderStyle="../resources/theme/OboutGrid/style_5"  FolderLocalization="../localization" Language="it" 
                                        AllowAddingRecords="false"  AllowMultiRecordSelection="False" PageSize="25" OnRowDataBound="RowDataBound1"
                                        EnableRecordHover="True" DataSourceID="SqlDataSource1" GenerateRecordIds="true" 
                                        AllowFiltering="true">
                                        <Columns>
                                            <obout:Column DataField="idimpianto" Visible="false"></obout:Column>
                                            <obout:Column DataField="tipobolla"  HeaderText="Tipo Bolla" Width="150">
                                            </obout:Column>
                                            <obout:Column DataField="numbolla" HeaderText="N° Bolla" Width="150">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column> <obout:Column DataField="creatoda" HeaderText="Creato Da" Width="140">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column>
                                                                    
                                            <obout:Column DataField="dataimpianto" HeaderText="Data Impianto" Width="95">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column>
                                                                   
                                            <obout:Column DataField="ospedale" HeaderText="Ospedale" Width="250">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column>
                                                                     
                                            <obout:Column DataField="inviata" AllowFilter="false" HeaderText="Inviata" Width="100">
                                            </obout:Column>
                                                <obout:Column Width="90px" HeaderText="OPZIONI" Align="left">
                                                <TemplateSettings  TemplateId="BtnTemplate" /></obout:Column>
                       
                                        </Columns>
                                        <TemplateSettings  RowEditTemplateId="BtnTemplate" />
			                                <Templates> <obout:GridTemplate runat="server" ID="BtnTemplate">
                                            <Template>
                                                <%#"<img src=\"../resources/graphics/edit.png\" Style=\"padding-top: 2px;cursor: pointer;\" id=\"bt_modbolla_" + Container.DataItem["idimpianto"] + "\" " +
                                                    "onclick=\"ModificaCrm(this)\" " +
                                                "title=\"Modifica Bolla\" alt=\"Modifica Bolla\" />"%>
                                                <%# "<img src=\"../resources/graphics/delete.png\" Style=\"padding-top: 2px;cursor: pointer;\" id=\"bt_delbolla_" + Container.DataItem["idimpianto"] + "_" + Container.DataItem["inviata"] + "\" " +
                                                "onclick=\"EliminaCrm(this)\" " +
                                                "title=\"Elimina Bolla\" alt=\"Elimina Bolla\" />"%>
                                                <!-- <%#"<a href=\"../stampe/stampabolla.aspx?ID=" + Container.DataItem["idimpianto"] + "\" target=\"_blank\"><img src=\"../resources/graphics/pdf.gif\" Style=\"padding-top: 2px;cursor: pointer;\" id=\"bt_modbolla_" + Container.DataItem["idimpianto"] + "\" " +
                                                    "title=\"Stampa Bolla\" alt=\"Stampa Bolla\" /></a>"%>-->
                                            </Template>
                                        </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>" 
                                        SelectCommand="SELECT idimpianto, case when numbolla = '' then 'BOZZA' else t.descrizione end as tipobolla, numbolla,dataimpianto,datascheda, case when ospedale = '0' then '' else
                                                (select ospedale from ospedali where idospedale = i.ospedale) end as ospedale, note , creatoda, case when inviata = 0 then 'Da inviare' else 'Inviata' end as inviata
                                                FROM impianti i, type_bolla t where interna = 0 and t.idbolla = i.idtipobolla #utente# " 
                                        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>" OnSelecting="SelDAt">
                                            <SelectParameters>
                                            <asp:ControlParameter ControlID="snlotto" Name="snlotto" Type="String" DefaultValue="1x1" />   
                                            <asp:ControlParameter ControlID="customernumber" Name="customernumber" Type="String" DefaultValue="1x1" />   
                                            <asp:ControlParameter ControlID="customername" Name="customername" Type="String" DefaultValue="1x1" />            
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                                            
                                    <br />
                                        <div id="Div2">
                                        <h3>Elenco Bolle Passaggio Fte</h3><br /><br />
                                                           
                                    </div>
                                        <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
                                        FolderStyle="../resources/theme/OboutGrid/style_5"  FolderLocalization="../localization" Language="it" 
                                        AllowAddingRecords="false"  AllowMultiRecordSelection="False" PageSize="25" 
                                        EnableRecordHover="True" DataSourceID="SqlDataSource2" GenerateRecordIds="true" OnRowDataBound="RowDataBound1"
                                        AllowFiltering="true">
                                        <Columns>
                                            <obout:Column DataField="idimpianto" Visible="false"></obout:Column>
                                            <obout:Column DataField="tipobolla"  HeaderText="Tipo Bolla" Width="120">
                                            </obout:Column>
                                            <obout:Column DataField="numbolla" HeaderText="N° Bolla" Width="140">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column> <obout:Column DataField="creatoda" HeaderText="Creato Da" Width="170">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column>
                                                                    
                                            <obout:Column DataField="dataimpianto" HeaderText="Data Impianto" Width="100">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column>
                                                                   
                                            <obout:Column DataField="dest" HeaderText="Destinatario" Width="230">
                                                <FilterOptions>
                                                    <obout:FilterOption Type="NoFilter" />
                                                    <obout:FilterOption Type="EqualTo" />
                                                    <obout:FilterOption Type="Contains" />
                                                    <obout:FilterOption Type="StartsWith" />
                                                </FilterOptions>
                                            </obout:Column>
                                                                     
                                            <obout:Column DataField="inviata" AllowFilter="false" HeaderText="Inviata" Width="100">
                                            </obout:Column>
                                                <obout:Column Width="90px" HeaderText="OPZIONI" Align="left">
                                                <TemplateSettings  TemplateId="BtnTemplate1" /></obout:Column>
                                        </Columns>
                                        <TemplateSettings  RowEditTemplateId="BtnTemplate1" />
			                                <Templates> <obout:GridTemplate runat="server" ID="BtnTemplate1">
                                            <Template>
                                                <%#"<img src=\"../resources/graphics/edit.png\" Style=\"padding-top: 2px;cursor: pointer;\" id=\"bt_modbolla_" + Container.DataItem["idimpianto"] + "\" " +
                                                                                                                                "onclick=\"ModificaCrmInterna(this)\" " +
                                                "title=\"Modifica Bolla\" alt=\"Modifica Bolla\" />"%>
                                                <%# "<img src=\"../resources/graphics/delete.png\" Style=\"padding-top: 2px;cursor: pointer;\" id=\"bt_delbolla_" + Container.DataItem["idimpianto"] + "_" + Container.DataItem["inviata"] + "\" " +
                                                                                                                            "onclick=\"EliminaCrmInterna(this)\" " +
                                                "title=\"Elimina Bolla\" alt=\"Elimina Bolla\" />"%>
                                            </Template>
                                                                    
                                        </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
                                                             
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
                                        SelectCommand="SELECT idimpianto, t.descrizione as tipobolla, numbolla,dataimpianto,datascheda, case when ospedale = '0' then '' else
                                                        (select concat(nome,' ',cognome) from utenti where idutente = i.ospedale) end as dest, note , creatoda, 
                                                        case when inviata = 0 then 'Da inviare' else 'Inviata' end as inviata
                                                        FROM impianti i, type_bolla t where interna = 1 and t.idbolla = i.idtipobolla #utente# " 
                                        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>" OnSelecting="SelDAt2">
                                    <SelectParameters>
                                            <asp:ControlParameter ControlID="snlotto" Name="snlotto" Type="String" DefaultValue="1x1" />   
                                            <asp:ControlParameter ControlID="customernumber" Name="customernumber" Type="String" DefaultValue="1x1" />   
                                            <asp:ControlParameter ControlID="customername" Name="customername" Type="String" DefaultValue="1x1" />          
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                                       
                            </div>
                        </asp:Panel>
                                 </div>
                           </section>
                    </div>
                </div>
            </div>
    </div>
    
    <span id="message" class="messageAction">
    </span> <ucFooter:footer ID="Footer2" runat="server" /></form>

   
</body>
</html>
