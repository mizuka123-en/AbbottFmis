﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchedaImpiantoInterna.aspx.cs" Inherits="stjude.crm.SchedaImpiantoInterna" %>

<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register Src="~/navigazione.ascx" TagName="navTable" TagPrefix="uc3" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Scheda Impianto | Abbott Medical Italia srl</title>

    <link rel="stylesheet" href="../resources/css/login.css" type="text/css" />
    <link rel="stylesheet" href="../resources/css/page.css" type="text/css" />
    <link rel="icon" href="../resources/favicon.ico" type="image/x-icon" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link rel="shortcut icon" href="../resources/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script>    
    function AggiungiArticolo() {

        ob_post.UpdatePanel('panelAlways');
        if (document.getElementById("tx_utentebolla").value == "") {

            alert("Inserire il numero bolla!\r\n");
            return false;
        }
        
            if (ddl_prod.selectedIndex() != -1) {
                prod = ddl_prod.options[ddl_prod.selectedIndex()].value;
            }
            else {

                alert("Selezionare un Modello");
                return false;
            }
            if (ddl_causale.selectedIndex() != -1) {
                causale = ddl_causale.options[ddl_causale.selectedIndex()].value;
            }
            else {

                alert("Selezionare una causale");
                return false;
            }

            ob_post.ResetParams();
           
            if (document.getElementById("txt_qta").value == "") {
             alert("Compilare il campo Qta");
                return false;
            }
            if (document.getElementById("tx_snlotto").value == "") {
                alert("Compilare il campo S/N - LOTTO");
                return false;
            }
            if (document.getElementById("tx_datascadenza").value == "") {

                alert("Inserire la data scadenza del prodotto!\r\n");
                return false;
            }
            var trasmettitore = "";

            if ($('#trasmett').val() == "true") {
                if (cmd_trasmettitore != null) {
                    if (cmd_trasmettitore.selectedIndex() != -1) {
                        trasmettitore = cmd_trasmettitore.options[cmd_trasmettitore.selectedIndex()].value;
                        $('#trasmett').val('false');
                    }
                    else {
                        alert("Selezionare una Trasmettitore");
                        return false;
                    }
                }
            }
            var idimpianto = document.getElementById("hdn_idimpianto").value;
            var idutemte = document.getElementById("hdn_idutente").value;
            ob_post.AddParam("idimpianto", idimpianto);
            ob_post.AddParam("modelloaccessorio", prod);
            ob_post.AddParam("trasmettitore", trasmettitore);
            ob_post.AddParam("snlotto", document.getElementById("tx_snlotto").value);
            ob_post.AddParam("qta", document.getElementById("txt_qta").value);
            ob_post.AddParam("causale", causale);
            ob_post.AddParam("descrizione", document.getElementById("txt_descrizione").value);
            ob_post.AddParam("datascadenza", document.getElementById("tx_datascadenza").value);
            ob_post.AddParam("idutente", document.getElementById("hdn_idutente").value);
            ob_post.post(null, "AggiungiArticolo", EndaddArticolo);
           
            
        }

        function EndaddArticolo() {
          
            document.getElementById("txt_qta").value = "";
            document.getElementById("txt_descrizione").value = "";
            document.getElementById("tx_snlotto").value = "";
            ddl_causale.selectedIndex(-1);
            ddl_prod.selectedIndex(-1);
            grid1.refresh();
            
            ob_post.ResetParams();
            var response = ob_post.post(null, "VerificaArticoliInseriti");
            tipobolla = '4';
            
           
        }
        function TrasmettitoreScelta() {

            if (ddl_prod != null) {
                prod = ddl_prod.options[ddl_prod.selectedIndex()].value;
                console.log(prod);
                ob_post.ResetParams();
                ob_post.AddParam("idmodel", prod);
                var response = ob_post.post(null, "SelectTrasmettitoreScelta");
                console.log(response);
                if (response == true) {
                    $('#row_trasmettitore').show();
                    $('#trasmett').val('true');
                    console.log($('#trasmett').val());
                }
                else {
                    $('#row_trasmettitore').hide();
                    $('#trasmett').val('false');
                    console.log($('#trasmett').val());
                }

            }
        }
        function SalvaScheda(inviata) {
            
            if (document.getElementById("tx_utentebolla").value == "") {
                alert("Inserire un numero di bolla!");
                return false;
            }
            else {
                numbolla = document.getElementById("tx_utentebolla").value;
                if (numbolla.length == 1) {
                    document.getElementById("tx_utentebolla").value = '0' + numbolla;
                    numbolla = document.getElementById("lbl_numerobolla").innerHTML + '0' + numbolla;

                }
                else {
                    document.getElementById("tx_utentebolla").value = numbolla;
                    numbolla = document.getElementById("lbl_numerobolla").innerHTML + '' + numbolla;
                }
            }
            
            tipobolla = document.getElementById("hdn_tipobolla").value;
            
            if (ddl_ospedale.selectedIndex() != -1) {
                ospedale = ddl_ospedale.options[ddl_ospedale.selectedIndex()].value;
            }
            else {
                alert("Selezionare un Destinatario!");
                return false;
            }
            ob_post.UpdatePanel('panelAlways');
            ob_post.ResetParams();
            var idimpianto = document.getElementById("hdn_idimpianto").value;
            ob_post.AddParam("idimpianto", idimpianto);
            ob_post.AddParam("dataimpianto", document.getElementById("lbl_dataimpianto").innerHTML);
            ob_post.AddParam("numbolla", numbolla);
            ob_post.AddParam("idtipobolla", tipobolla);
            ob_post.AddParam("inviata", inviata);
            var response = ob_post.post(null, "ValidateArticolo");
           
            if (response == 'OK') {
                
                ob_post.ResetParams();
                ob_post.AddParam("dataimpianto", document.getElementById("lbl_dataimpianto").innerHTML);
                ob_post.AddParam("databolla", document.getElementById("tx_databolla").value);
                 ob_post.AddParam("numbolla", numbolla);
                ob_post.AddParam("idtipobolla", tipobolla);
                ob_post.AddParam("creatoda", document.getElementById("hdn_creatoda").value);
                ob_post.AddParam("ospedale", ospedale);
                ob_post.AddParam("note", document.getElementById("tx_note").value);
                ob_post.AddParam("inviata", inviata);
                ob_post.AddParam("checkok", true);
                ob_post.AddParam("numbollaold", "");
                ob_post.AddParam("nota", "");
                ob_post.AddParam("impiantionoff", 0);
                ob_post.AddParam("impiantoprimario", 0);
                ob_post.AddParam("impiantsostituzione", 0);
                ob_post.AddParam("impiantoupgrade", 0);
                ob_post.AddParam("ospedaledest", 0);
                ob_post.AddParam("dataritiro", "");
                ob_post.AddParam("revisione", 0);
                ob_post.AddParam("pernottamento", 0);
                ob_post.AddParam("voloaereo", 0);
                ob_post.AddParam("festivita", 0);
                ob_post.AddParam("sostmodello", 0);
                ob_post.AddParam("sostdataimp", "");
                ob_post.AddParam("sostserial", "");
                ob_post.AddParam("trasferta", 0);
                ob_post.AddParam("autonomia", 0);
                response = ob_post.post(null, "SalvaScheda");
                if (inviata == "1")
                    ElencoImpianti();
                showMessage(response);

                document.getElementById("messaggio").innerHTML = response;
            }
            else {
                alert(response);
                document.getElementById("messaggio").innerHTML = response;
            }
        }
        
        function ElencoImpianti() {
            location.href = 'elencoSchedeImpiantiNew.aspx';
        }
        function EliminaArticolo() {

            var righeSel = '';
            var righedaEliminare = '';
            var idimpianto = document.getElementById("hdn_idimpianto").value;
            if (grid1.SelectedRecords.length > 0) {
                for (var i = 0; i < grid1.SelectedRecords.length; i++) {
                    righeSel = righeSel + grid1.SelectedRecords[i].idriga + ';';
                }
                for (var i = 0; i < grid1.SelectedRecords.length; i++) {
                    righedaEliminare = righedaEliminare + grid1.SelectedRecords[i].modelloaccessori + ';';
                }
                if (!confirm('Attenzione: Vuoi eliminare gli elementi selezionati? \r\n ' + righedaEliminare + ' \r\n Premendo \'OK\' verrànno rimossi in modo permanente.'))
                    return false;
                else {
                    ob_post.ResetParams();
                    ob_post.AddParam("righeSel", righeSel);
                    ob_post.AddParam("idimpianto", idimpianto);
                    var response = ob_post.post(null, "DeleteArticoli", EndaddArticolo);

                    deselectAll();
                }
            }
            else
                alert("Selezionare almeno un articolo");
        }
        
        function deselectAll() {
            for (i = 0; i < grid1.Rows.length; i++) {
                grid1.deselectRecord(i);
            }

            grid1.SelectedRecordsContainer.value = "";
            grid1.SelectedRecords = new Array();
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
    </asp:ScriptManager>
      <asp:HiddenField ID="hdn_idimpianto" runat="server" Value="" />
      <asp:HiddenField ID="hdn_databolla" runat="server" Value="" />
      <asp:HiddenField ID="hdn_creatoda" runat="server" Value="" />
      <asp:HiddenField ID="hdn_annobolla" runat="server" Value="" />
       <asp:HiddenField ID="hdn_tipobolla" runat="server" Value="" />
       <asp:HiddenField ID="hdn_idutente" runat="server" Value="" />
    <div id="wrapper">
        <div id="pageBody" style="background: #fff;">
            <div id="bodyPad">
                <uc1:header ID="Header1" runat="server" />
                <div id="navbar">
                    <% ut.drawMenu();%>
                </div>
                
            </div> <% if (Session["RUOLOAPP"] != null )
                      {
                          if (Session["RUOLOAPP"].ToString() == "1" & Request.QueryString["idimpianto"] != null)
                          { %>
            <table><tr><td>
                <input type="button" class="btnSmall" id="bt_modImpianto" onclick="window.location.href='SchedaImpiantointerna.aspx?idimpianto=<%=Request.QueryString["idimpianto"].ToString() %>&modamm=true'" value="Forza Modifiche" /> 
            </td></tr></table>
       <%}
                      } %>
         <fieldset>
                <legend><b>&raquo;</b>Scheda Impianto</legend>
                <div class="content">
                 <asp:Panel ID="pnSchedaImpianto" runat="server">
             <span id="message" class="messageAction">
                </span> <asp:Label ID="message2" runat="server" ForeColor="Red">
                </asp:Label>
            <table cellpadding="0" cellspacing="0" >
                <tr>
                    <td>
                        <h2>Intestazione</h2>
                        <table class="tabInsertStjude">
                            <tr class="trInsertStjude">
                                <td class="tdLBLStjude">
                                    Tipo Bolla:
                                </td>
                                <td class="tdDATStjude">
                                
                                <asp:Label ID="lbl_tipobolla"  runat="server" Text="INTERNA"></asp:Label>
                                
                                  
                                </td>
                                <td class="tdLBLStjude">
                                    Data Bolla:
                                </td>
                                <td class="tdDATStjude">
                      
                                     <asp:TextBox ID="tx_databolla" runat="server" Width="100px" Text=""></asp:TextBox>
                                      <obout:Calendar ID="Calendar2" runat="server" CultureName="it-IT" StyleFolder="../resources/theme/calendar/graphite"
                                    ShowMonthSelector="true" MonthSelectorType="HtmlList" DateFormat="dd/MM/2012"
                                    DatePickerMode="true" TextBoxId="tx_databolla" Columns="2" DatePickerImagePath="../resources/theme/calendar/orbitz/icon2.gif" />
                                
                                </td>
                            </tr>
                            <tr class="trInsertStjude">
                                <td class="tdLBLStjude">
                                    Numero Bolla :
                                </td>
                                <td class="tdDATStjude">
                                    <asp:Label ID="lbl_numerobolla" runat="server"></asp:Label>
                                    <asp:TextBox ID="tx_utentebolla" runat="server" Width="50px" Text=""></asp:TextBox>
                                   
                                </td>
                                <td class="tdLBLStjude">
                                    Data impianto:
                                </td>
                                <td class="tdDATStjude">
                                <asp:Label ID="lbl_dataimpianto" runat="server"></asp:Label>
                                
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLBLStjude">
                                    Destinatario:
                                </td>
                                <td class="tdDATStjude">
                                <asp:Label ID="lbl_ospedale" runat="server"></asp:Label>
                                     <obout:ComboBox runat="server" AppendDataBoundItems="true" ID="ddl_ospedale" Width="250"
                                        Height="200" DataSourceID="sdsAF" DataTextField="descrizione" DataValueField="idutente"
                                        SelectedIndex="0">
                                        <HeaderTemplate>
                                            <div class="header c1">
                                                AF</div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="itemComboBox" >
                                                <%# Eval("descrizione")%></div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            Displaying
                                            <%# Container.ItemsCount %>
                                            items.
                                        </FooterTemplate>
                                    </obout:ComboBox>
                                </td>
                                <td class="tdLBLStjude">
                                    Utente:
                                </td>
                                <td class="tdDATStjude">
                                    <asp:Label ID="txt_creatoda" ForeColor="Blue" runat="server" Width="250px" ></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td class="tdLBLStjude">
                                    Note:
                                </td>
                                <td class="tdDATStjude" colspan="3">
                                    <asp:Label ID="lbl_note"  runat="server"  ></asp:Label>
                                    <asp:TextBox ID="tx_note" TextMode="MultiLine" Rows="3" runat="server" Width="700px" Text=""></asp:TextBox>
                                   
                                </td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                    
                    <asp:Panel ID="pn_materiale2" runat="server">
                    <h2>Materiale</h2>
                    
                    
                        <table class="tabInsertStjude">
                        
                            <tr class="trInsertStjude">
                                <td class="tdLBLStjude">
                                    Modello:
                                </td>
                                <td class="tdDATStjude" colspan="3">
                                 <obout:ComboBox FolderStyle="../styles/plain" runat="server" AppendDataBoundItems="true" 
                                 ID="ddl_prod" Width="450" AllowCustomText="false" AllowEdit="false" EnableVirtualScrolling="true"
                                        EmptyText="Selezionare un Modello" Height="300" DataSourceID="sdsProdotti" DataTextField="descrizione" DataValueField="idprodotto"
                                        >
                                        <HeaderTemplate>
                                            <div class="header c1">
                                                Prodotti</div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="itemComboBox" >
                                                <%# Eval("descrizione")%></div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            Displaying
                                            <%# Container.ItemsCount %>
                                            items.
                                        </FooterTemplate>
                               </obout:ComboBox>
                                </td>
                            </tr>
                             <tr id="row_trasmettitore" runat="server" class="trInsertStjude" >
                                <td class="tdLBLStjude">
                                    Trasmettitore:
                                </td>
                                <td class="tdDATStjude" colspan="3">
                                  <oajax:CallbackPanel ID="updTrasmettiore" runat="server" RenderMethod="Always">
                                        <Content>
                                        <input type="hidden" id="trasmett" value="false"/>
                                    <obout:ComboBox FolderStyle="../styles/plain" runat="server" AppendDataBoundItems="true" 
                                    ID="cmd_trasmettitore" Width="450" AllowCustomText="false" AllowEdit="false" EnableVirtualScrolling="true"
                                        EmptyText="Selezionare" Height="150" >
                                        <obout:ComboBoxItem Value="NORC" Text="NORC" />
                                        <obout:ComboBoxItem Value="BYOD" Text="BYOD" />
                                        <obout:ComboBoxItem Value="MTX" Text="MTX" />
                                        <obout:ComboBoxItem Value="MCI" Text="MCI" />
                                </obout:ComboBox>  </Content></oajax:CallbackPanel>
                                </td>
                            </tr>
                               <tr>
                                <td class="tdLBLStjude" >
                                      Causale:
                                </td>
                                <td class="tdDATStjude" colspan="3">
                                    <oajax:CallbackPanel ID="UpdCasc" runat="server" RenderMethod="Always">
                                        <Content>
                                            <obout:ComboBox FolderStyle="../styles/plain" runat="server" AppendDataBoundItems="true"
                                                ID="ddl_causale" Width="450" DataSourceID="sdsCausali" DataTextField="descrizione"
                                                DataValueField="idcausale" EmptyText="Selezionare una causale" AllowCustomText="false"
                                                AllowEdit="false" EnableVirtualScrolling="true">
                                                <HeaderTemplate>
                                                    <div class="header c1">
                                                        Causali</div>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <div class="itemComboBox">
                                                        <%# Eval("descrizione")%></div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    Displaying
                                                    <%# Container.ItemsCount %>
                                                    items.
                                                </FooterTemplate>
                                            </obout:ComboBox>
                                        </Content>
                                        <Loading Style="width: 600px; height: 20px">
                                            <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center">
                                                        <img src="../resources/graphics/loading_orizz.gif" alt="loading" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Loading>
                                    </oajax:CallbackPanel>
                                </td>
                            </tr>
                            <tr> 
                            <td class="tdLBLStjude">
                                    Qta:
                                </td>
                                <td class="tdDATStjude">
                                    <asp:TextBox ID="txt_qta" runat="server" Text="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_qta"
                                        Display="None" ErrorMessage="Inserire una Qta" ValidationGroup="prodotto"></asp:RequiredFieldValidator>
                                </td>
                                  <td class="tdLBLStjude">
                                    S/N - LOTTO:
                                </td>
                                <td class="tdDATStjude">
                                    <asp:TextBox ID="tx_snlotto" runat="server" Width="250px"  Text=""></asp:TextBox>
                                </td>
                            </tr>
                         <tr>
                            <td class="tdDATStjude">
                                   Data Scadenza: 
                                      
                                </td> <td class="tdDATStjude" colspan="3">
                                    <asp:TextBox ID="tx_datascadenza" runat="server" Width="100px" Text=""></asp:TextBox>
                                    <obout:Calendar ID="Calendar3" runat="server" CultureName="it-IT" StyleFolder="../resources/theme/calendar/graphite"
                                    ShowMonthSelector="true" MonthSelectorType="HtmlList" DateFormat="dd/MM/yyyy"
                                    DatePickerMode="true" TextBoxId="tx_datascadenza" Columns="2" DatePickerImagePath="../resources/theme/calendar/orbitz/icon2.gif" /></asp:TextBox>
                                </td>
                             </tr>
                             <tr>
                                <td class="tdLBLStjude">
                                     Descrizione dei Beni:
                                </td>
                                <td class="tdDATStjude" colspan="3">
                                    <asp:TextBox ID="txt_descrizione" runat="server" TextMode="MultiLine" Width="95%" Rows="3"
                                        Text=""></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdDATStjude" colspan="4">
                                    <input type="button" class="btn" onclick="AggiungiArticolo()" id="btn_aggiungi" runat="server"
                            value="Aggiungi" /><input type="button" class="btnred" onclick="EliminaArticolo()" id="btn_elimina" runat="server"
                            value="Elimina Articolo" />
                                    
                                </td>
                                
                            </tr>
                            
                        </table>
                        </asp:Panel>
                        <table width"100%"  class="tabInsertStjude"><tr><td>
                             <h2>Articoli Inseriti</h2>
                             <asp:Label ID="lbl_materiale2"  runat="server"  ></asp:Label>
                                 <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
                        FolderStyle="../resources/theme/OboutGrid/style_5" FolderLocalization="../localization"
                        Width="100%" OnRebind="RebindGrid"  AllowAddingRecords="false" GenerateRecordIds="true" 
                        AllowGrouping="false" AllowFiltering="false" AllowSorting="false" Language="it" >
                        <Columns>
                              <obout:CheckBoxSelectColumn ShowHeaderCheckBox="true" ControlType="Standard" />
                              
                              <obout:Column ID="idriga" DataField="idriga" Visible="false" runat="server" />
                            <obout:Column ID="modelloaccessorio" DataField="modelloaccessori" Width="200" HeaderText="Modello"
                                runat="server" />
                                <obout:Column ID="snlotto" DataField="snlotto" Width="200" HeaderText="S/N - LOTTO"
                                runat="server" />
                             <obout:Column ID="QtaRichiesta" DataField="qta" AllowFilter="true" Visible="true"
                                Width="100" Wrap="false" HeaderText="Qta" runat="server" />
                             <obout:Column ID="causale" DataField="causale" Visible="true" Width="100"
                                Wrap="false" HeaderText="Causale" runat="server" />
                            <obout:Column ID="descrizione" DataField="descrizione" Width="250" HeaderText="Descrizione"
                                runat="server" />
                        </Columns>
                    </obout:Grid>
                                <p>
                                    <input type="button" class="btn" onclick="SalvaScheda(0)" id="btn_salva" value="Salva Bozza" runat="server" />
                                     <input type="button" class="btn" onclick="SalvaScheda(1)" id="btn_chiudi" value="Invia e Chiudi" runat="server" />
                                      
                                </p> 
                            <oajax:CallbackPanel runat="server" ID="panelAlways" RenderMethod="Always">
						<content>
                    <div ID="messaggio" style="padding: 4px; width:100%; margin-top:100px;background-color: #006C56; color: White; font-weight: bold;"></div>
                   
                        </content>
                        <loading style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="../resources/graphics/loading.gif">
									</td>
								</tr>
							</table>
						</loading>
                    </oajax:CallbackPanel>
                        </td></tr></table>
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
                </div>
         </fieldset>
         
        
             
         
          </div>
        <ucFooter:footer runat="server" ID="foot" />
    </div>
    <script>        $('#row_trasmettitore').hide();</script>
   <asp:SqlDataSource ID="sdsAF" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="select idutente, concat(upper(Cognome),' ', upper(Nome)) as descrizione from utenti order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>">
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="sdsBolla" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="select * from type_bolla where idbolla in (4) order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCausali" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="select idcausale, upper(descrizione) as descrizione from causali where tipobolla like '%4%' order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>" >
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsProdotti" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="SELECT distinct titolo as descrizione,idprodotto as idprodotto  FROM prodotti  order by 1"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>"> 
    </asp:SqlDataSource>
    
    </form>
</body>
</html>