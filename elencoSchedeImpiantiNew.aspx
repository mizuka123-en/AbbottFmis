<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="elencoSchedeImpiantiNew.aspx.cs" Inherits="stjude.crm.elencoSchedeImpiantiNew" %>
<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="h1" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Models" Assembly="Syncfusion.EJ" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
    
    <h1:header ID="Header1" runat="server" />
  <script src="../../Scripts/ej/i18n/ej.culture.it-IT.min.js" type="text/javascript"></script>
    <title>Elenco delle importazioni</title >         <script>
              function ModificaBollaFMS(obj) {
                
                  location.href = "fms_schedampiantocrm.aspx?idimpianto=" + obj.id.replace('bt_modbolla_', '');
              }

              function ModificaCrmInterna(obj) {

                  var str = obj.id.replace('bt_modbolla_', '');
                  location.href = "fms_schedampiantocrm_interna.aspx?idimpianto=" + str;

              }
          </script>
</head>
<body>
    <form id="form1" runat="server">
    <% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
      </asp:ScriptManager>
      <% ut.drawMenu22();%> 
       
            <div class="container-fluid page-body-wrapper">
              
                  <div class="row mb-12 tabFMS">
                            <h4>Elenco Documenti di Trasporto CRM</h4>
                      </div>
                 
               </div>  

         <div class="col-lg-12 stretch-card grid-margin">
                    <div class="row mb-12 " style="margin-top: 10px;">
             <input type="button" class="btn" id="bt_creaImpianto" onclick="window.location.href='fms_schedampiantocrm.aspx'" value="Crea Impianto" />  
 
                <input type="button" class="btn" id="Button6" onclick="window.location.href='fms_schedampiantocrm_interna.aspx'" value="Crea Scheda Interna" />

              
                <input type="button" class="btn " id="bt_Attivita" onclick="window.location.href='ImpiantiExport.aspx'" value="Esporta Impianti" />
 
                <input type="button" class="btn " id="Button3" onclick="window.location.href='StatisticheCRMnw.aspx'" value="Esporta Tutto" />
             </div>
            </div>
            <div id="menuopzioniDIVISION">
                <asp:HiddenField runat="server" ID="idimpianto" Value="1x1" />
                 <asp:HiddenField runat="server" ID="snlotto" Value="1x1" />
              
            <table class="tabFMS">
            <tr>
           
            <td>
                <span class="labelFMS" >SNLOTTO:</span><asp:TextBox runat="server" type="text" id="tx_snlotto" name="tx_snlotto" Text="" />
            </td>
            <td >
                <ej:Button ID="BTNcerca"  CssClass="btn" runat="server"  Text="CERCA"></ej:Button>
          
            </td>
            </tr>
             </table>
            </div>
              <div class="col-lg-12 stretch-card grid-margin">
                          <ej:Grid ID="gridGestBolleCrm" runat="server"  DataSourceID="SqlDataSource1"  load="load" AllowSorting="true" AllowPaging="true" 
                                        AllowFiltering="true" AllowGrouping="true"  Locale="it-IT" EnablePersistence="false">
                                        <Columns >
                                            <ej:Column Field="idimpianto" IsPrimaryKey="true" Visible="false" Width="30"   AllowEditing="false" ></ej:Column>
                                           
                                            <ej:Column Field="tipobolla"  HeaderText="Tipo Bolla" Width="100" EditType="StringEdit">           
                                            </ej:Column> 
                                                        
                                            <ej:Column Field="numbolla" HeaderText="N° Bolla" Width="120"  EditType="StringEdit">
                                            </ej:Column>
                                             <ej:Column Field="ospedale" HeaderText="Ospedale" Width="120"  EditType="StringEdit">
                                            </ej:Column>
                                             <ej:Column Field="customername" HeaderText="Customer name" Width="120"  EditType="StringEdit">
                                            </ej:Column>
                                            <ej:Column Field="customernumber" HeaderText="Customer Number" Width="120"  EditType="StringEdit">
                                            </ej:Column>
                                            <ej:Column Field="creatoda" HeaderText="Creato Da" Width="120" >          
                                            </ej:Column>

                                             <ej:Column Field="datascheda" format="{0:dd/MM/yyyy}"  DefaultValue="{System.DateTime.Now}" AllowEditing="false" HeaderText="Data Impianto" Width="120" >     
                                               <ValidationRule>
                                                   <ej:KeyValue Key="required" Value="true"/>
                                               </ValidationRule> 

                                            </ej:Column>
                                           
                                            <ej:Column Field="inviata" AllowFiltering="false" HeaderText="Inviata" Width="100">   </ej:Column>
                                            <ej:Column Field="imagepers" HeaderText="DATI" AllowFiltering="false" Width="100"  EditType="StringEdit"></ej:Column>                
                                        </Columns>                                
                                        <FilterSettings FilterType="FilterBar" />
                                    </ej:Grid>
                                    <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>" 
                                                                SelectCommand="SELECT idimpianto, case when numbolla = '' then 'BOZZA' else t.descrizione end as tipobolla, numbolla,dataimpianto,datascheda, case when ospedale = '0' then '' else
                                                                        (select ospedale from ospedali where idospedale = i.ospedale) end as ospedale,
                                        (select customername from ospedali where idospedale = i.ospedale)  as customername,
                                        (select customernumber from ospedali where idospedale = i.ospedale)  as customernumber,note , creatoda,
                                        case when inviata = 0 then 'Da inviare' else 'Inviata' end as inviata,
                                        #imaging# 
                                        FROM impianti i, type_bolla t where interna = 0 and t.idbolla = i.idtipobolla   #utente#" 
                                        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>"  OnSelecting="SelDAt">
                                         
                                    </asp:SqlDataSource>
                  <script id="Refresh" type="text/x-jsrender">
                <a class="e-toolbaricons refresh" />
            </script>
                             <script type="text/javascript">
                                 function onToolBarClick(sender) {
                                     if (sender.itemName == "Expand")
                                         this.expandAll();
                                     else if (sender.itemName == "Collapse")
                                         this.collapseAll();
                                     else
                                         this.refreshContent();
                                 }
                             </script>

                   </div>
           
         <div class="container-fluid page-body-wrapper">
    
        <div class="row mb-12 tabFMS">
                  <h4>Elenco Bolle Passaggio Fte </h4>
            </div>
       
     </div>  
     
         <div class="col-lg-12 stretch-card grid-margin">
                             
                              <ej:Grid ID="grid1" runat="server" EnablePersistence="true"  DataSourceID="SqlDataSource2"  load="load" AllowSorting="true" AllowPaging="true" 
                                        AllowFiltering="true" AllowGrouping="true"  Locale="it-IT">
                                        <EditSettings AllowEditing="false" AllowAdding="false" AllowDeleting="false" ></EditSettings>
                                        <ToolbarSettings ShowToolbar="true"  >
                                             <CustomToolbarItem>
                                                <ej:CustomToolbarItem Text="Expand" />
                                                <ej:CustomToolbarItem Text="Collapse" />
                                                <ej:CustomToolbarItem TemplateID="#Refresh" />
                                            </CustomToolbarItem>
                                        </ToolbarSettings>
                              <Columns>
                                   <ej:Column Field="idimpianto" IsPrimaryKey="true" Visible="false" Width="30"   AllowEditing="false" ></ej:Column>
                                           
                                  <ej:Column Field="tipobolla"  HeaderText="Tipo Bolla" Width="120"></ej:Column>
                                  <ej:Column Field="numbolla" HeaderText="N° Bolla" Width="140"></ej:Column> 
                                  <ej:Column Field="creatoda" HeaderText="Creato Da" Width="170"></ej:Column>
                                  <ej:Column Field="dataimpianto"  format="{0:dd/MM/yyyy}"  HeaderText="Data Bolla" Width="100"></ej:Column>
                                  <ej:Column Field="dest" HeaderText="Destinatario" Width="230"> </ej:Column>
                                  <ej:Column Field="inviata"  HeaderText="Inviata" Width="100"></ej:Column>
                                  <ej:Column Field="imageint" HeaderText="DATI" AllowFiltering="false" Width="100"  EditType="StringEdit"></ej:Column>   
                              </Columns>
                          </ej:Grid>
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
                              SelectCommand="SELECT idimpianto, t.descrizione as tipobolla, numbolla,dataimpianto,datascheda, case when ospedale = '0' then '' else
                                              (select concat(nome,' ',cognome) from utenti where idutente = i.ospedale) end as dest, note , creatoda, 
                                              case when inviata = 0 then 'Da inviare' else 'Inviata' end as inviata, #imageint#
                                              FROM impianti i, type_bolla t where interna = 1 and t.idbolla = i.idtipobolla #utente# " 
                              ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>" OnSelecting="SelDAt2">
                         
                          </asp:SqlDataSource>
                    </div>
                    
          <!-- content-wrapper ends -->
      

         <ucFooter:footer ID="Footer2" runat="server" />
      

 
<style> 
    .e-Reply:before { 
        content: "\e815"; 
    } 
</style> 
</form>
</body>
</html>

