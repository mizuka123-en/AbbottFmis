<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fms_schedampiantocrmsync.aspx.cs" Inherits="stjude.crm.fms_schedampiantocrmsync" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register Src="~/ControlFile.ascx" TagName="FileControl" TagPrefix="uc1" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Models" Assembly="Syncfusion.EJ" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="h1" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <h1:header ID="Header2" runat="server" /><title>Scheda Impianto | Abbott Medical Italia srl</title>
    <link rel="stylesheet" href="../resources/css/page_22.css" type="text/css" />
    <link rel="icon" href="../resources/favicon.ico" type="image/x-icon" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link rel="shortcut icon" href="../resources/favicon.ico" type="image/x-icon" />
   
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" >
        function AggiungiFotobolla() {
            var numbolla = '';
            numbolla = document.getElementById("lbl_numerobolla").innerHTML;
            document.getElementById("lbl_numerobolla2").innerHTML = numbolla;
        }
       
        function eliminaImmagine() {
            var numbolla = '';
            numbolla = document.getElementById("lbl_numerobolla").innerHTML;
            ob_post.ResetParams();
            ob_post.AddParam("numbolla", numbolla);
            var response = ob_post.post(null, "DeleteImmagine");
            RedirectSame();
        }

        function RedirectSame() {
            location.href = location.href;
        }
        function onCheckedChanged(sender, isChecked) {
         
            console.log('The checked state of ' + sender.ID + ' has been changed to: ' + isChecked + '.');
            if (isChecked) {
                enable();
            }
            else
                disable();
        }
        function onCheckedChanged2(sender, isChecked) {
            console.log('The checked state of ' + sender.ID + ' has been changed to: ' + isChecked + '.');
            if (isChecked) {
                $('#tabsostituzione').show();
            }
            else {
                $('#tabsostituzione').hide();
            }
        }
        function disable() {
            ck_primario.disable();
            ck_sostituzione.disable();
            ck_upgrade.disable();

            ck_primario.checked(false);
            ck_sostituzione.checked(false);
            ck_upgrade.checked(false);
            
        }

        function enable() {
            ck_primario.enable();
            ck_sostituzione.enable();
            ck_upgrade.enable();
        }
    function AggiungiArticolo() {

        ob_post.UpdatePanel('panelAlways');       
        if (document.getElementById("tx_utentebolla").style.visibility != 'hidden') {
            
            if (document.getElementById("tx_utentebolla").value == "") {

                alert("Inserire il numero bolla!\r\n");
                return false;
            }
        }
        if (ddl_ospedale.selectedIndex() != -1) {
            ospedale = ddl_ospedale.options[ddl_ospedale.selectedIndex()].value;
        }
        else {
            alert("Selezionare un ospedale!");
            return false;
        }
        if (document.getElementById("tx_dataimpianto").value == "") {

            alert("Inserire la data impianto!\r\n");
            return false;
        }

        if (document.getElementById("tx_dataritiro").value == "") {

            alert("Inserire la data del ritiro!\r\n");
            return false;
        }
        
        if (ddl_prod.selectedIndex() != -1) {
            prod = ddl_prod.options[ddl_prod.selectedIndex()].value;
        }
        else {

            alert("Selezionare un Modello");
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
        var trasmettitore = "";
        
        if ($('#trasmett').val()=="true") {
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
        ob_post.AddParam("fieldaction", document.getElementById("txt_fieldaction").value);
        ob_post.AddParam("idutente", document.getElementById("hdn_idutente").value);
        ob_post.AddParam("idutente", document.getElementById("hdn_idutente").value);
        ob_post.post(null, "AggiungiArticolo", EndaddArticolo);
 }

        
        function GetCheckedValue(id) {
            var chkElement = '';
            var radioButtons = document.getElementsByName(id);
            for (var i = 0; i < radioButtons.length; i++) {
                var elem = radioButtons[i];
                if (elem.checked) {
                    chkElement = elem.value;
                    break;
                }
            }
            return chkElement;
        }
        function EndaddArticolo() {
          
            document.getElementById("txt_qta").value = "";
            document.getElementById("txt_descrizione").value = "";
            document.getElementById("tx_snlotto").value = "";
            console.log('test');
            ddl_causale.selectedIndex(-1);
            // ddl_prod.selectedIndex(-1);
            grid1.refresh();
            ob_post.ResetParams();

            var response = ob_post.post(null, "VerificaArticoliInseriti");
            if (response == true & cmb_tipobolla != null) {
                cmb_tipobolla.disable();
                if (cmb_tipobolla.selectedIndex() != -1) {
                    tipobolla = cmb_tipobolla.options[cmb_tipobolla.selectedIndex()].text;
                }
               
            }
           
        }

       

        function ElencoImpianti() {
        
            if (getQSParam('modamm')==null)
                location.href = 'elencoSchedeImpiantiNew.aspx';
        }
        function EliminaArticolo() {

            var righeSel = '';
            var righedaEliminare = '';
            var idimpianto = document.getElementById("hdn_idimpianto").value
            var idutente = document.getElementById("hdn_idutente").value;
            if (grid1.SelectedRecords.length > 0) {
                for (var i = 0; i < grid1.SelectedRecords.length; i++) {
                    righeSel = righeSel + grid1.SelectedRecords[i].idriga + ';';
                }
                for (var i = 0; i < grid1.SelectedRecords.length; i++) {
                    righedaEliminare = righedaEliminare + grid1.SelectedRecords[i].modelloaccessori + ';';
                }
                if (!confirm('Attenzione: Vuoi eliminare gli elementi selezionati? \r\n  Premendo \'OK\' verrànno rimossi in modo permanente.'))
                    return false;
                else {
                    ob_post.ResetParams();
                    ob_post.AddParam("righeSel", righeSel);
                    ob_post.AddParam("idimpianto", idimpianto);
                    ob_post.AddParam("idutente", idutente);
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
        function getQSParam(ParamName) {
            // Memorizzo tutta la QueryString in una variabile
            QS = window.location.toString();
            // Posizione di inizio della variabile richiesta
            var indSta = QS.indexOf(ParamName);
            // Se la variabile passata non esiste o il parametro è vuoto, restituisco null
            if (indSta == -1 || ParamName == "") return null;
            // Posizione finale, determinata da una eventuale &amp; che serve per concatenare più variabili
            var indEnd = QS.indexOf('&', indSta);
            // Se non c'è una &amp;, il punto di fine è la fine della QueryString
            if (indEnd == -1) indEnd = QS.length;
            // Ottengo il solore valore del parametro, ripulito dalle sequenze di escape
            var valore = unescape(QS.substring(indSta + ParamName.length + 1, indEnd));
            // Restituisco il valore associato al parametro 'ParamName'
            return valore;
        }

        function OnTipobollaChange(args) {
           
            var selectedValue = args.value;
            document.getElementById('lbl_numerobolla').innerHTML = selectedValue;
            if (selectedValue == "2") {
                document.getElementById("tx_utentebolla").style.visibility = 'visible';
                document.getElementById("lbl_numerobolla").innerHTML = response;

            }
            else if (selectedValue == "1") {
                document.getElementById("tx_utentebolla").style.visibility = 'visible';
                document.getElementById("lbl_numerobolla").innerHTML = response;

            }
            else if (selectedValue == "3") {

                document.getElementById("tx_utentebolla").style.visibility = 'hidden';
                document.getElementById("lbl_numerobolla").innerHTML = response;

            }
        }
        function ConcatenaFiltri() {

            if (cmb_tipobolla != null) {

                if (cmb_tipobolla.selectedIndex() != -1) {
                    tipobolla = cmb_tipobolla.options[cmb_tipobolla.selectedIndex()].value;
                }
                else {
                    alert("Selezionare un Tipo di bolla!");
                    return false;
                }
            }
            else
                tipobolla = document.getElementById("hdn_tipobolla").value;
            
            ob_post.ResetParams();
            ob_post.AddParam("tipobolla", tipobolla);
            var response = ob_post.post(null, "Selecttipobolla");

            if (tipobolla == "2") {
                document.getElementById("tx_utentebolla").style.visibility = 'visible';
                document.getElementById("lbl_numerobolla").innerHTML = response;
                
            }
            else if (tipobolla == "1") {
            document.getElementById("tx_utentebolla").style.visibility = 'visible';
                document.getElementById("lbl_numerobolla").innerHTML = response;

            }
            else if (tipobolla == "3") {

                document.getElementById("tx_utentebolla").style.visibility = 'hidden';
                document.getElementById("lbl_numerobolla").innerHTML = response;

            }
             
            ob_post.UpdatePanel("UpdCasc");
        }

        function ConcatenaFiltriCitta() {

            if (cmb_citta != null) {

                if (cmb_citta.selectedIndex() != -1) {
                    citta = cmb_citta.options[cmb_citta.selectedIndex()].value;
                }
                else {
                    alert("Selezionare una citt&agrave!");
                    return false;
                }
            }
            else
                citta = document.getElementById("hdn_citta").value;
            ob_post.ResetParams();
            ob_post.AddParam("citta", citta);
            var response = ob_post.post(null, "SelectCitta");
            ob_post.UpdatePanel("updOspedali");
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
        function ConcatenaFiltriCittaDest() {

            if (cmb_cittadest != null) {

                if (cmb_cittadest.selectedIndex() != -1) {
                    citta = cmb_cittadest.options[cmb_cittadest.selectedIndex()].value;
                }
                else {
                    alert("Selezionare una citt&agrave di destinazione!");
                    return false;
                }
            }
            else
                citta = document.getElementById("hdn_citta").value;
            ob_post.ResetParams();
            ob_post.AddParam("citta", citta);
            var response = ob_post.post(null, "SelectCittaDest");
            ob_post.UpdatePanel("updOspedaliDest");
        }

        function AggiungiBolla() {
            showFlyout('flImg');
        }
    </script>
</head>
<body style="background:none;">
<script type="text/javascript" > 
 function SalvaScheda(inviata) {
            checkok = $('#hdn_checkok').val();
            numbollaold = '';
            continua = true;
            nota ='';
            <%if (Request.QueryString["modamm"] != null) {%>
                numbollaold = $('#hdn_numbolla').val();
                numbollanew = $('#tx_utentebolla').val();
                nota = $('#tx_nota').val();               
                if ((numbollaold != numbollanew) && (checkok=="false"))
                {                    
                    showFlyout('fllogin');
                    continua = false;
                }
            <%} %>
            
            if (continua)
            {
                if (cmb_tipobolla != null) {

                    if (cmb_tipobolla.selectedIndex() != -1) {
                        tipobolla = cmb_tipobolla.options[cmb_tipobolla.selectedIndex()].value;
                    }
                    else {
                        alert("Selezionare un Tipo di bolla!");
                        return false;
                    }
                }
                else
                    tipobolla = document.getElementById("hdn_tipobolla").value;
                var numbolla = '';
                
                if (tipobolla != 3) {
                    if (document.getElementById("tx_utentebolla").value == "") {
                        alert("Inserire un numero di bolla!");
                        return false;
                    }
                    else {
                        numbolla = document.getElementById("tx_utentebolla").value;
                        if (numbolla.length == 1) {
                            document.getElementById("tx_utentebolla").value = numbolla;
                            numbolla = document.getElementById("lbl_numerobolla").innerHTML + '0' + numbolla;

                        }
                        else {
                            document.getElementById("tx_utentebolla").value = numbolla;
                            numbolla = document.getElementById("lbl_numerobolla").innerHTML + '' + numbolla;
                        }
                    }
                }
                else
                    numbolla = document.getElementById("lbl_numerobolla").innerHTML;
                
               
                if (ddl_ospedale.selectedIndex() != -1) {
                    ospedale = ddl_ospedale.options[ddl_ospedale.selectedIndex()].value;
                }
                else {
                    alert("Selezionare un ospedale!");
                    return false;
                }
                ospedaledest = 0;
                if (ddl_ospedaledest.selectedIndex() != -1) {
                    ospedaledest = ddl_ospedaledest.options[ddl_ospedaledest.selectedIndex()].value;
                }
                
                 if (GetCheckedValue('ck_upgrade') == 'on') {
                        impiantoupgrade = "1";
                    }
                     else {
                        impiantoupgrade = "0";
                    }
                    if (GetCheckedValue('ck_primario') == 'on') {
                        impiantoprimario = "1";
                    }
                     else {
                        impiantoprimario = "0";
                    }

                     if (GetCheckedValue('ck_revisione') == 'on') {
                        revisione = "1";
                    }
                     else {
                        revisione = "0";
                    }
                     if (GetCheckedValue('ck_pernottamento') == 'on') {
                        pernottamento = "1";
                    }
                     else {
                        pernottamento = "0";
                    }
                     if (GetCheckedValue('ck_voloaereo') == 'on') {
                        voloaereo = "1";
                    }
                     else {
                        voloaereo = "0";
                    }
                     if (GetCheckedValue('ck_autonomia') == 'on') {
                        autonomia = "1";
                    }
                     else {
                        autonomia = "0";
                    }
                    if (GetCheckedValue('ck_festivita') == 'on') {
                        festivita = "1";
                    }
                     else {
                        festivita = "0";
                    }
                     if (GetCheckedValue('ck_trasferta') == 'on') {
                        trasferta = "1";
                    }
                     else {
                        trasferta = "0";
                    }
                    if (GetCheckedValue('ck_sostituzione') == 'on') {
                        impiantsostituzione = "1";
                        sostmodello=0;
                        sostserial = document.getElementById("tx_sostserial").value;
                        if (cmb_sostmodello.selectedIndex() != -1) {
                            sostmodello = cmb_sostmodello.options[cmb_sostmodello.selectedIndex()].value;
                        }
                        sostdataimp =  document.getElementById("tx_sostdataimp").value;
                    }
                     else {
                        sostmodello=0;
                        sostserial ="";
                        impiantsostituzione = "0";
                        sostdataimp = '';
                    }

                    if (GetCheckedValue('ck_impianto') == 'on') {
                        impiantionoff = "1";
                        tipologiaimp="";
                         if (cmb_tipologiaimp.selectedIndex() != -1) {
                                tipologiaimp = cmb_tipologiaimp.options[cmb_tipologiaimp.selectedIndex()].value;
                         }
                    }
                    else {
                        impiantionoff = "0";
                        impiantoprimario = "0";
                        impiantsostituzione = "0";
                        impiantoupgrade = "0";
                        tipologiaimp="";
                        sostmodello=0;
                        sostserial ="";
                        sostdataimp = '';
                    }
                    
                ob_post.UpdatePanel('panelAlways');
                ob_post.ResetParams();
                var idimpianto = document.getElementById("hdn_idimpianto").value;
                ob_post.AddParam("idimpianto", idimpianto);
                ob_post.AddParam("dataimpianto", document.getElementById("tx_dataimpianto").value);
                ob_post.AddParam("databolla", document.getElementById("tx_databolla").value);
                ob_post.AddParam("idtipobolla", tipobolla);
                ob_post.AddParam("numbolla", numbolla);
                ob_post.AddParam("inviata", inviata);
                ob_post.AddParam("dataritiro", document.getElementById("tx_dataritiro").value);
                var response = ob_post.post(null, "ValidateArticolo");
               
                if (response == 'OK') {
                    
                    ob_post.ResetParams();
                    ob_post.AddParam("dataimpianto", document.getElementById("tx_dataimpianto").value);
                    ob_post.AddParam("databolla", document.getElementById("tx_databolla").value);
                    ob_post.AddParam("numbolla", numbolla);
                    ob_post.AddParam("idtipobolla", tipobolla);
                    ob_post.AddParam("creatoda", document.getElementById("hdn_creatoda").value);
                    ob_post.AddParam("ospedale", ospedale);
                    ob_post.AddParam("note", document.getElementById("tx_note").value);
                    ob_post.AddParam("inviata", inviata);
                    ob_post.AddParam("checkok", checkok);
                    ob_post.AddParam("numbollaold", numbollaold);
                    ob_post.AddParam("nota", nota);
                    ob_post.AddParam("impiantionoff", impiantionoff);
                    ob_post.AddParam("impiantoprimario", impiantoprimario);
                    ob_post.AddParam("impiantsostituzione", impiantsostituzione);
                    ob_post.AddParam("impiantoupgrade", impiantoupgrade);
                    ob_post.AddParam("ospedaledest", ospedaledest);
                    ob_post.AddParam("dataritiro", document.getElementById("tx_dataritiro").value);
                    ob_post.AddParam("revisione", revisione);
                    ob_post.AddParam("pernottamento", pernottamento);
                    ob_post.AddParam("voloaereo", voloaereo);

                    ob_post.AddParam("festivita", festivita);
                    ob_post.AddParam("sostmodello", sostmodello);
                    ob_post.AddParam("sostdataimp", sostdataimp);
                    ob_post.AddParam("sostserial", sostserial);
                    ob_post.AddParam("trasferta", trasferta);
                    ob_post.AddParam("autonomia", autonomia);
                    ob_post.AddParam("tipologiaimp", tipologiaimp);
                    response = ob_post.post(null, "SalvaScheda");
                    if (inviata == "1")
                    {
                        ElencoImpianti();
                    }
                   
                    showMessage(response);

                    document.getElementById("messaggio").innerHTML = response;
                    document.getElementById("message2").innerHTML = response;
                }
                else {
                    alert(response);
                    document.getElementById("messaggio").innerHTML = response;
                }
            }
        }
        
        function CheckLogin()
        {
            usr = $('#txtUser').val();
            pwd = $('#txtPassword').val();
            nota = $('#tx_nota').val();
           $('#ktErrorMessage').hide();
                console.log('nota'+nota);
            if (usr == "" || pwd=="" || nota == "")
            {
                $('#ktErrorMessage').show();
                $('#ktErrorMessage').val('Compilare tutti i campi');
            }
            else
            {
                console.log(usr);
                 ob_post.ResetParams();
                ob_post.AddParam("usr", usr);
                ob_post.AddParam("pwd", pwd);
                response = ob_post.post(null, "CheckLogin", EndCheckLogin);
               
            }
            
        }
        
        function EndCheckLogin(response)
        {
              console.log('response:'+response);
             
             if (response == "OK")
            {
                $('#hdn_checkok').val('true');
                closeFlyout('fllogin');
                SalvaScheda(1);
                showMessage('Scheda salvata con successo');
                $('#hdn_checkok').val('false');
            }
            else
            {
                $('#ktErrorMessage').show();
                $('#ktErrorMessage').val(response);
            }
        }
        
        function AggiungiFotoBolla() {
            showFlyout('flImg');
        }
</script>
    <form id="form1" runat="server" >
    <% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
     <Scripts>
            <asp:ScriptReference Path="~/jquery/functionDiv.js" />
  </Scripts>
    </asp:ScriptManager>
      <asp:HiddenField ID="hdn_idimpianto" runat="server" Value="" />
       <asp:HiddenField ID="hdn_idutente" runat="server" Value="" />
      <asp:HiddenField ID="hdn_databolla" runat="server" Value="" />
      <asp:HiddenField ID="hdn_creatoda" runat="server" Value="" />
      <asp:HiddenField ID="hdn_annobolla" runat="server" Value="" />
      <asp:HiddenField ID="hdn_tipobolla" runat="server" Value="" />
       <asp:HiddenField ID="hdn_numbolla" runat="server" Value="" />
       <asp:HiddenField ID="hdn_checkok" runat="server" Value="false" />
       <% ut.drawMenu22();%>

    <div class="container">
        <div class="content">
             <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
        <Triggers> 
            <asp:AsyncPostBackTrigger ControlID="cmb_tipobolla" /> 
             <asp:AsyncPostBackTrigger ControlID="cmb_citta" />
        </Triggers> 
        <ContentTemplate> 
            <asp:Panel ID="pnSchedaImpianto" runat="server">
                <section class="pb-12">
                    <div class="bg-white tabInsertENG">
                        <section class="w-100 p-12 pb-12">
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto">
                                    <div class="form-outline">
                                        <span id="message" class="messageAction" runat="server"></span>

                                        <% if (Session["RUOLOAPP"].ToString() == "1" & Request.QueryString["idimpianto"] != null)
                                            { %><!--<a href="showfilePdf.aspx">showfilePdf.aspx</a>
                                        <input type="button" class="btn" id="bt_modImpianto" onclick="window.location.href='fms_schedampiantocrm.aspx?idimpianto=<%=Request.QueryString["idimpianto"].ToString() %>&modamm=true'" value="Forza Modifiche2" /><a href="showfilePdf.aspx">showfilePdf.aspx</a>
                                        --><%} %>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="w-100 p-12 pb-12">
                             <div class="row mb-12 tabFMS">
                                   <h4>Documento di Trasporto </h4>
                             </div>
                            <div class="row mb-6 trLBLENG border">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">Tipo Bolla:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="lbl_tipobolla" runat="server"></asp:Label>
                                        <ej:ComboBox ID="cmb_tipobolla" CssClass="form-control" runat="server" 
                                            DataTextField="descrizione" DataValueField="idbolla" AllowCustom="false" OnValueSelect="cmb_tipobolla1_ValueSelect"
                                            DataSourceID="sdsBolla" AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare un tipo di bolla" >
                                        </ej:ComboBox>
                                    </div>
                                </div>
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Data Bolla:</label>

                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="lbl_databolla" runat="server" Visible="false"></asp:Label>
                                        <ej:DatePicker ID="tx_databolla" runat="server"   DateFormat="dd/MM/yyyy" CssClass="form-control required"/>
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Numero Bolla:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="lbl_numerobolla" runat="server"></asp:Label>
                                        <asp:TextBox ID="tx_utentebolla" runat="server" Width="50px" Text=""></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Data impianto:</label>

                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="lbl_dataimpianto" runat="server"></asp:Label>
                                         <ej:DatePicker ID="tx_dataimpianto" runat="server"   DateFormat="dd/MM/yyyy" CssClass="form-control required"/>
                                      
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Citt&agrave;:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="lbl_citta1" runat="server"></asp:Label>
                                         <ej:ComboBox ID="cmb_citta" CssClass="form-control" runat="server" 
                                             DataTextField="descrizione" DataValueField="descrizione" AllowCustom="false" OnValueSelect="cmb_citta_ValueSelect"
                                             DataSourceID="sdsCitta" AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare una Citt&agrave;" >
                                         </ej:ComboBox>
                                     
                                    </div>
                                </div>
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Ospedale:</label>


                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <oajax:CallbackPanel ID="updOspedali" runat="server" RenderMethod="Always">
                                            <Content>
                                                <asp:Label ID="lbl_ospedale" runat="server"></asp:Label>
                                                <ej:ComboBox ID="ddl_ospedale" CssClass="form-control" runat="server" 
    DataTextField="descrizione" DataValueField="idospedale" AllowCustom="false" OnValueSelect="cmb_tipobolla1_ValueSelect"
    DataSourceID="sdsOspedali" AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare un Ospedale" >
</ej:ComboBox>
                                               
                                            </Content>
                                            <Loading Style="width: 300px; height: 70px;">
                                                <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center">
                                                            <img alt="" src="../resources/graphics/loading.gif">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </Loading>
                                        </oajax:CallbackPanel>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Destinazione Citt&agrave;:</label>


                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <asp:Label ID="lbl_citta2" runat="server"></asp:Label>
                                        <ej:ComboBox ID="cmb_cittadest" CssClass="form-control" runat="server" 
                                        DataTextField="descrizione" DataValueField="descrizione" AllowCustom="false" OnValueSelect="cmb_cittadest_ValueSelect"
                                        DataSourceID="sdsCitta" AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare una Citt&agrave;"></ej:ComboBox>

                                    </div>
                                </div>
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Destinazione Ospedale:</label>


                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <oajax:CallbackPanel ID="updOspedaliDest" runat="server" RenderMethod="Always">
                                            <Content>
                                                <asp:Label ID="lbl_ospedale2" runat="server"></asp:Label>
                                                <ej:ComboBox ID="ddl_ospedaledest" CssClass="form-control" runat="server" 
                                                    DataTextField="descrizione" DataValueField="idospedale" AllowCustom="false"  OnValueSelect="ddl_ospedaledest_ValueSelect"
                                                    DataSourceID="sdsOspedaliDest" AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare un Ospedale" ></ej:ComboBox>
                                               
                                            </Content>
                                            <Loading Style="width: 300px; height: 70px;">
                                                <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center">
                                                            <img src="../resources/graphics/loading.gif">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </Loading>
                                        </oajax:CallbackPanel>

                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Indicare se è un impianto:</label>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="form-outline">
                                        <asp:Label ID="lbl_impianto" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_primario" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_upgrade" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_sostituzione" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_autonomia" runat="server"></asp:Label>

                                        <obout:OboutCheckBox ID="ck_impianto" runat="server" Text="Impianto SI/NO">
                                            <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                                        </obout:OboutCheckBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <obout:OboutCheckBox ID="ck_primario" runat="server" Text="Primario">
                                    <ClientSideEvents />
                                </obout:OboutCheckBox>
                                        <obout:OboutCheckBox ID="ck_upgrade" runat="server" Text="Upgrade">
                                            <ClientSideEvents />
                                        </obout:OboutCheckBox>
                                        <obout:OboutCheckBox ID="ck_sostituzione" runat="server" Text="Sostituzione">
                                            <ClientSideEvents OnCheckedChanged="onCheckedChanged2" />
                                        </obout:OboutCheckBox>
                                        <asp:Label ID="lbl_autonomiac" runat="server"></asp:Label>
                                        <obout:OboutCheckBox ID="ck_autonomia" runat="server" Text="Autonomia">
                                            <ClientSideEvents />
                                        </obout:OboutCheckBox>

                                    </div>
                                </div>

                            </div>
                            <div class="row mb-8 trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Prodotto Sostituito:</label>
                                    </div>
                                </div>
                                <div class="col-auto ">
                                    <div class="form-outline mb-auto">
                                        <table 
                                            id="tabsostituzione" runat="server">
                                            <tr class="trInsertStjude">
                                                <td class="tdLBLENG" style="background: #133D53; color: #fff">Data Sostituzione:
                                                </td>
                                                <td class="tdDATENG">
                                                    <asp:Label ID="lbl_sostdataimp" runat="server"></asp:Label>
                                                    <asp:TextBox ID="tx_sostdataimp" runat="server" Width="100px" Text=""></asp:TextBox>
                                                    <obout:Calendar ID="Calendar5" runat="server" CultureName="it-IT" StyleFolder="../resources/theme/calendar/graphite"
                                                        ShowMonthSelector="true" MonthSelectorType="HtmlList" DateFormat="dd/MM/yyyy"
                                                        DatePickerMode="true" TextBoxId="tx_sostdataimp" Columns="2" DatePickerImagePath="../resources/theme/calendar/orbitz/icon2.gif" />
                                                </td>
                                            </tr>
                                            <tr class="trInsertStjude">
                                                <td class="" style="background: #133D53; color: #fff">Prodotto:
                                                </td>

                                                <td class="">
                                                    <asp:Label ID="lbl_sostmodello" runat="server"></asp:Label>
                                                    <obout:ComboBox FolderStyle="../styles/plain" runat="server" AppendDataBoundItems="true"
                                                        ID="cmb_sostmodello" Width="250" AllowCustomText="false" AllowEdit="false" EnableVirtualScrolling="true"
                                                        EmptyText="Selezionare un Modello" Height="300" DataSourceID="sdsProdotti" DataTextField="descrizione" DataValueField="idprodotto">
                                                        <HeaderTemplate>
                                                            <div class="header c1">
                                                                Prodotti
                                                            </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="itemComboBox">
                                                                <%# Eval("descrizione")%>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Displaying
                                            <%# Container.ItemsCount %>
                                            items.
                                                        </FooterTemplate>
                                                    </obout:ComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="" style="background: #133D53; color: #fff">Seriale:
                                                </td>
                                                <td class="">
                                                    <asp:Label ID="lbl_sostserial" runat="server"></asp:Label>
                                                    <asp:TextBox ID="tx_sostserial" runat="server" Width="100px" Text=""></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="" style="background: #133D53; color: #fff">CODICE 	Seriale:
                                                </td>
                                                <td class="">
                                                    <asp:Label ID="lbl_gandserial" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="lbl_tipimp" Text="Tipologia Impianto" runat="server"></asp:Label>

                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <asp:Label ID="lbl_tipologiaimp" Text="" runat="server"></asp:Label>

                                        <ej:ComboBox ID="cmb_tipologiaimp" CssClass="form-control" runat="server" 
                                             AllowCustom="false"   DataTextField="Impianto" DataValueField="Text" 
                                             AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare un Tipo di Impianto" >
                                             
                                           </ej:ComboBox>
                                    </div>
                                </div>
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Data ritiro:</label>

                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <asp:Label ID="lbl_dataritiro" runat="server"></asp:Label>

                                           <ej:DatePicker ID="tx_dataritiro" runat="server"   DateFormat="dd/MM/yyyy" CssClass="form-control required"/>
                                      


                                      
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Proprietà bolla:</label>

                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <asp:Label ID="lbl_revisione" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_pernottamento" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_voloaereo" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_trasferta" runat="server"></asp:Label>
                                        <obout:OboutCheckBox ID="ck_revisione" runat="server" Text="Revisione">
                                            <ClientSideEvents />
                                        </obout:OboutCheckBox>
                                        <obout:OboutCheckBox ID="ck_pernottamento" runat="server" Text="Pernottamento">
                                            <ClientSideEvents />
                                        </obout:OboutCheckBox>
                                        <obout:OboutCheckBox ID="ck_voloaereo" runat="server" Text="Volo aereo">
                                            <ClientSideEvents />
                                        </obout:OboutCheckBox>

                                        <obout:OboutCheckBox ID="ck_trasferta" runat="server" Text="Trasferta">
                                            <ClientSideEvents />
                                        </obout:OboutCheckBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">

                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Note:</label>

                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline">
                                        <asp:Label ID="lbl_note" runat="server"></asp:Label>
                                        <asp:TextBox ID="tx_note" TextMode="MultiLine" Rows="3" runat="server" Width="700px" Text=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">Utente:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:Label ID="txt_creatoda" ForeColor="Blue" runat="server" Width="250px"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </section>
                <asp:Panel ID="pn_materiale2" runat="server">
                    <section class="pb-12">
                        <div class="bg-white border rounded-5 tabInsertENG">
                            <h2>Materiale</h2>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">Modello:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">

                                        <ej:ComboBox ID="ddl_prod" CssClass="form-control" runat="server" 
     AllowCustom="false"   DataTextField="descrizione" DataValueField="idprodotto"  DataSourceID="sdsProdotti"
     AllowFiltering="false" AutoFill="false" Height="30" Width="80%" Placeholder="Selezionare un Modello" OnValueSelect="ddl_prod_ValueSelect">
     
   </ej:ComboBox>

                                    </div>
                                </div>
                            </div>
                            <div id="row_trasmettitore" runat="server" class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline ">
                                        <label class="form-label" for="cmb_tipobolla" style="margin-left: 0px;">
                                            Trasmettitore:
                                        </label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <oajax:CallbackPanel ID="updTrasmettiore" runat="server" RenderMethod="Always">
                                            <Content>
                                                <input type="hidden" id="trasmett" value="false" />
                                                <obout:ComboBox FolderStyle="../styles/plain" runat="server" AppendDataBoundItems="true"
                                                    ID="cmd_trasmettitore" Width="450" AllowCustomText="false" AllowEdit="false" EnableVirtualScrolling="true"
                                                    EmptyText="Selezionare" Height="150">
                                                    <obout:ComboBoxItem Value="NORC" Text="NORC" />
                                                    <obout:ComboBoxItem Value="BYOD" Text="BYOD" />
                                                    <obout:ComboBoxItem Value="MTX" Text="MTX" />
                                                    <obout:ComboBoxItem Value="MCI" Text="MCI" />
                                                </obout:ComboBox>
                                            </Content>
                                        </oajax:CallbackPanel>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">Causale:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <oajax:CallbackPanel ID="UpdCasc" runat="server" RenderMethod="Always">
                                            <Content>
                                                <ej:ComboBox ID="ddl_causale" CssClass="form-control" runat="server" 
     AllowCustom="false"   DataTextField="descrizione" DataValueField="idcausale" DataSourceID="sdsCausali" 
     AllowFiltering="false" AutoFill="false" Height="30" Width="100%" Placeholder="Selezionare una causale" >
     
   </ej:ComboBox>
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
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">
                                            Qta:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:TextBox ID="txt_qta" runat="server" Text="1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_qta"
                                            Display="None" ErrorMessage="Inserire una Qta" ValidationGroup="prodotto"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">
                                            S/N - LOTTO:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:TextBox ID="tx_snlotto" runat="server" Width="250px" Text=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">
                                            Data Scadenza:
                                        </label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <ej:DatePicker ID="tx_datascadenza" runat="server"   DateFormat="dd/MM/yyyy" CssClass="form-control required"/>
                                      

                                     
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">
                                            Field Action:
                                        </label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:TextBox ID="txt_fieldaction" runat="server" TextMode="MultiLine" Width="95%" Rows="3"
                                            Text=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border trLBLENG">
                                <div class="col-auto tdLBLENG">
                                    <div class="form-outline">
                                        <label class="form-label" for="cmb_tipobolla">
                                            Descrizione dei Beni:</label>
                                    </div>
                                </div>
                                <div class="col-auto tdDATENG">
                                    <div class="form-outline ">
                                        <asp:TextBox ID="txt_descrizione" runat="server" TextMode="MultiLine" Width="95%" Rows="3"
                                            Text=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-6 border ">
                                <div class="col-auto ">
                                    <div class="form-outline">
                                        <input type="button" class="btn" onclick="AggiungiArticolo()" id="btn_aggiungi" runat="server"
                                            value="Aggiungi" />
                                        <input type="button" class="btnred" onclick="EliminaArticolo()" id="btn_elimina" runat="server"
                                            value="Elimina Articolo" />
                                    </div>
                                </div>
                            </div>

                        </div>

                    </section>

                </asp:Panel>
                <section class="pb-12 horiz-scrollable">
                    <div class="row mb-12 tabFMS">
                          <h4>Articoli </h4>
                    </div>
                    <div class="bg-white tabInsertENG rowelenco">
                        <section class="w-100 p-12 pb-12" style="margin-left: 10px;">
                            <div class="row mb-12 horiz-scrollable">
                                <div class="rowelenco">
                                    <asp:Label ID="lbl_materiale2" runat="server"></asp:Label>
                                    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
                                        FolderStyle="../resources/theme/OboutGrid/style_5" FolderLocalization="../localization"
                                        Width="100%" OnRebind="RebindGrid" AllowAddingRecords="false" GenerateRecordIds="true"
                                        AllowGrouping="false" AllowFiltering="false" AllowSorting="false" Language="it">
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
                                </div>
                            </div>
                            <div class="row mb-12">
                                <div class="col-auto ">
                                    <div class="form-outline">
                                        <p style="margin-top: 15px;">
                                            <% if (Request.QueryString["modamm"] != null)
                                                { %>
                                            <input type="button" class="btn" onclick="SalvaScheda(1)" id="btn_salva" value="Salva Modifiche " runat="server" />
                                            <% }
                                                else
                                                { %>
                                            <input type="button" class="btn" onclick="SalvaScheda(0)" id="Button2" value="Salva Bozza" runat="server" />
                                            <input type="button" class="btn" onclick="SalvaScheda(1)" id="btn_chiudi" value="Invia e Chiudi" runat="server" />

                                            <% if (Request.QueryString["idimpianto"] != null)
                                                {%><br />
                                            <br />
                                            <asp:Label ID="lbl_messagepdf" runat="server" Text="Pdf non presente" ForeColor="Red"></asp:Label>
                                            <asp:ImageButton ID="ImageButton1" Style="cursor: pointer;" runat="server" ImageUrl="~/resources/graphics/pdf.png" OnClick="ImageButton1_Click" Width="50px" Height="50px" />

                                            <%
                                                    }
                                                } %>
                                        </p>

                                        <% if (Request.QueryString["modamm"] != null && Session["IDUTENTE"].ToString() == "61")
                                            { %>

                                        <div class="upload">

                                            <b>Seleziona un file da caricare, questo sostituirà la bolla</b>

                                            <ej:UploadBox ID="Upload1" runat="server" SaveUrl="SaveFileCrm.ashx" AutoUpload="false"></ej:UploadBox>

                                        </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-12">
                                <div class="col-auto ">
                                    <div class="form-outline">
                                        <asp:Label ID="message2" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <oajax:CallbackPanel runat="server" ID="panelAlways" RenderMethod="Always">
                                <Content>
                                    <div id="messaggio" style="padding: 4px; width: 100%; margin-top: 100px; background-color: #006C56; color: White; font-weight: bold;"></div>
                                </Content>
                                <Loading Style="width: 300px; height: 70px;">
                                    <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">
                                                <img src="../resources/graphics/loading.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </Loading>
                            </oajax:CallbackPanel>


                        </section>
                    </div>
                </section>

            </asp:Panel>
              </ContentTemplate> 
    </asp:UpdatePanel> 
        </div>
    </div>
     <obout:Flyout ID="flImg" ClearType="true" runat="server" FlyingEffect="NONE" zIndex="99999"
        AttachTo="message2" Position="TOP_LEFT" PageOpacity="30" OpenEvent="NONE" CloseEvent="NONE">
        <div id="IMG" class="boxloginscheda" >
            <div class="dashboard_block" id="IMGContent">
                <div class="ktBlock" id="imgbody" >
                
                    <h2 class="dashboard_block_handle">    <div class="dashboard_block_rightrepeat_top">
                    </div>
                    <div class="dashboard_block_rightrepeat_bottom">
                    </div>
                    <div class="dashboard_block_leftrepeat_top">
                    </div>
                    <div class="dashboard_block_leftrepeat_bottom">
                    </div>
                    <div class="dashboard_block_icons">
                        &nbsp;
                    </div>
                    <h2 class="dashboard_block_handle">
                        Immagine Bolla</h2>
                    <div class="dashboard_block_body" >
                       
                          <asp:Label ID="lbl_numerobolla2" runat="server"></asp:Label>
                          <input type="button"  class="btn" value="Chiudi" onclick="closeFlyout('flImg');" />
                    </div>
                    <div class="dashboard_block_topleft">
                    </div>
                    <div class="dashboard_block_toprepeat" id="TopImg">
                    </div>
                    <div class="dashboard_block_topright">
                    </div>
                    <div class="dashboard_block_bottomleft">
                    </div>
                    <div class="dashboard_block_bottomrepeat" id="BotImg">
                    </div>
                    <div class="dashboard_block_bottomright">
                    </div>
                </div>
            </div>
        </div>
    </obout:Flyout>
    <obout:Flyout ID="fllogin" ClearType="true" runat="server" IsModal="true" PageColor="Black" PageOpacity="30" FlyingEffect="NONE" zIndex="99999"
        AttachTo="message2" Position="MIDDLE_CENTER" OpenEvent="NONE" CloseEvent="NONE">
        <div id="Div1" class="boxloginscheda">
                    <h2 class="dashboard_block_handle">
                         Hai modificato il numero di bolla inserisci utente e password per confermare il cambio</h2>
                         <div id="loginbox_outer">
                                <div id="loginbox">
                                    <div id="formbox">
                                        <div id="ktErrorMessage" class="ktErrorMessage" style="display:none;"><span>Attenzione! Utente o Password errate.</span></div>   
                                        <p class="ktErrorMessage">
                                        Nota:
                                        <textarea type="text" row="1" id="tx_nota"></textarea>
                                          </p>
                                        <label for="username">
                                            Codice utente</label>
                                        <input type="text" id="txtUser"  value="" />
		                        <label for="password">
                                            Password</label>
		                        <input type="password" id="txtPassword"   value="" />
                                        <div class="form_actions">
		                          <input type="button" value="Annulla" onclick="closeFlyout('fllogin')"  />
		                       <input type="button" value="Conferma" onclick="CheckLogin()"  />
                                        </div>
                                    </div>
                                    <div id="bottomspacer"></div>
                                    <div class="floatClear"></div>
                                </div>
                            </div>
               
        </div>
    </obout:Flyout>
    <script>
     function closeFlyout(nomeFlyout){
        
        switch(nomeFlyout)
        {
             case "flImg":
                    <%=flImg.getClientID() %>.Close();  
                     break;
              case "fllogin":
                    <%=fllogin.getClientID() %>.Close();  
             break;
        }
    }
    
    function showFlyout(nomeFlyout){
        
        switch(nomeFlyout)
        {
             case "flImg":
                    <%=flImg.getClientID() %>.Open();  
                     break;
             case "fllogin":
                    console.log(nomeFlyout);
                    <%=fllogin.getClientID()%>.Open();  
             break;
        }
        }
        $('#row_trasmettitore').hide();
    </script>
    
    <asp:SqlDataSource ID="sdsCitta" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="select distinct trim(upper(citta)) as descrizione from ospedali where trim(citta) != '' and disabilitato = 0 and af_crm like '%crm%'  order by 1"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsOspedali" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>" OnSelecting="OspedaliSelecting"
        SelectCommand="select idospedale,  concat(trim(upper(ospedale)),' - ',customernumber) as descrizione from ospedali where trim(ospedale) != ''  and disabilitato = 0  #citta# order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>"> 
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="sdsOspedaliDest" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>" OnSelecting="OspedaliSelectingDest"
        SelectCommand="select idospedale,  concat(trim(upper(ospedale)),' - ',customernumber) as descrizione from ospedali where trim(ospedale) != ''  and disabilitato = 0  #cittadest# order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>"> 
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="sdsBolla" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="select * from type_bolla where idbolla  in (1,2,3) order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCausali" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="select idcausale, upper(descrizione) as descrizione from causali where #causali# order by 2"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>" OnSelecting="causaleSelecting">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsProdotti" runat="server" ConnectionString="<%$ ConnectionStrings:stjudeConnectionString %>"
        SelectCommand="SELECT distinct titolo as descrizione,idprodotto as idprodotto  FROM prodotti  order by 1"
        ProviderName="<%$ ConnectionStrings:stjudeConnectionString.ProviderName %>"> 
    </asp:SqlDataSource>
       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="fms_schedampiantocrm"
        SelectMethod="GetTabItems"></asp:ObjectDataSource>
        
        <ucFooter:footer runat="server"  /> 


    </form>
</body>
</html>
