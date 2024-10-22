<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="stjude._Default" %>

<%@ Register Src="~/headerengol.ascx" TagName="header" TagPrefix="h1" %>
<%@ Register Src="~/footerengol.ascx" TagName="footer" TagPrefix="ucFooter" %>
<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Models" Assembly="Syncfusion.EJ" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
    <h1:header ID="Header2" runat="server" />
        <title>Bacheca FMS | Abbott Medical Italia srl</title>
 </head>
<body>
     <form id="form1" runat="server">
    <% FMSPortalDocLibrary.abstractUser ut = new FMSPortalDocLibrary.Utente(this.Page);%>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      <% ut.drawMenu22();%>
        <div class="container-fluid page-body-wrapper">
            <div class="row mb-12 tabFMS">
                    <h4>Dashboard</h4>
            </div>
        </div>  
       <div class="container-fluid page-body-wrapper">
                   
           <div class="row justify-content-center">
                            <div class="col-auto">
                              <table style="clear:both" class="table table-responsive"><thead>
                                <tr>
                                    <th scope="col">Per scaricare l'APP seleziona uno dei seguenti link:</th>
                                    <th scope="col"><span style="font-weight:bold"></span></th>
                                </tr>
                                   </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">FMS CRM</th>
                                    <td>  <a href="https://fmsita.abbott.com/abbottcrm/com.abbottfmsCRM3.7.apk" title="">APP FMS CRM v. 3.7</a> </td>
                                    
                                </tr>
                                <tr>
                                    <th scope="row">FMS SH</th>
                                    <td><a href="https://fmsita.abbott.com/abbottcrm/com.abbottfmsSH2.1.apk" title=""> APP FMS SH 2.1 Android</a></td>
                                </tr>
                                     <tr>
                                    <th scope="row">FMS EP</th>
                                    <td>   <a href="https://fmsita.abbott.com/abbottcrm/com.abbottfmsEP2.5.apk" title="">APP FMS EP v2.5 Android</a> </td>
                                    
                                </tr>
                                <tr>
                                    <th scope="row">FMS NMD</th>
                                    <td>   <a href="https://fmsita.abbott.com/abbottcrm/com.abbottfmsNMD3.4.2.apk" title="">APP FMS NMD v3.4.2 Android</a> </td>
                                    
                                </tr>
                                <tr>
                                    <th scope="row">INVENTARIO + KIT ABBOTT</th>
                                    <td>   <a href="https://fmsita.abbott.com/abbottcrm/com.oneabbott.crm.ims3.7.apk" title="">APP FMS IMS v3.7 Android</a> </td>
                                    
                                </tr>
                               </tbody>
                            </table>
                        </div>
                             </div>

           </div>
              
         <ucFooter:footer ID="Footer2" runat="server" />
</form>
</body>
</html>

