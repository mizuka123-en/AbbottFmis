<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cambiopwd.aspx.cs" Inherits="stjude.cambiopwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pwd Dimenticata | Abbott Medical Italia srl</title>
    <link rel="stylesheet" href="resources/css/login.css" type="text/css" />
    <link rel="icon" href="resources/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon" />
    <link display="all" href="resources/theme/OboutTextBox/style.css" rel="stylesheet" type="text/css" />
    <link display="all" href="resources/theme/OboutButton/style.css" rel="stylesheet"  type="text/css" />
</head> 
<body>
    <form id="form1" runat="server" >
           <asp:ScriptManager ID="ScriptManager1" runat="server">
             </asp:ScriptManager>
     
              <asp:Panel ID="cambiopassword" runat="server">
                  <div id="loginbox_outer">
                      <div id="formbox2">
                          <img src="resources/graphics/abbottlogo.png" alt="Abbott Medical Italia srl" title="Abbott Medical Italia srl" class="logoimage" /><br />
                          <div id="Div1" runat="server" style="margin:10px;font-size:12px;">
                              <span>Cambio Password<br />
                                  <br />
                                  Vi ricordiamo che la password deve essere lunga tra gli 8 ed i 14 caratteri,
                                  <br />
                                  deve contenere almeno una lettera maiuscola, 
                                    un carattere speciale ed un numero.<br />
                              </span>
                          </div> 
                          <div class="form_actions">
                          <p class="ktErrorMessage">Inserire una nuova Password</p>
                          <asp:Label ID="lblpw1" for="txtPassword" runat="server">Password</asp:Label>
                          <asp:TextBox runat="server" ID="txtPassword" Style="height: 25px; width: 255px; margin: 15px" TextMode="Password"></asp:TextBox>
                          <asp:Label ID="lblpw2" for="txtPassword2" runat="server">Conferma Password</asp:Label>
                          <asp:TextBox runat="server" ID="txtPassword2" Style="height: 25px; width: 255px; margin: 15px" TextMode="Password"></asp:TextBox>
                         
                              <p>
                                  <asp:Button runat="server" ID="Button1" OnClick="Btn_Click" Text="Salva" /></p>
                              <p>
                                  <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label></p>
                          </div>
                         <p class="descriptiveText version">
                                <br />
                                Abbott FMS Portal Versione 3.0.0<br />
                                Management Software<br />
                                &copy; 2012 - 2022<br />
                                 Tutti i diritti riservati<br />
                                <a href="./PrivacyPolicy.aspx" target="_blank">Privacy Policy</a><br />
                            </p>
                      </div>
                  </div>
             </asp:Panel>
            <asp:Panel ID="panel_error" runat="server">
                 <div id="loginbox_outer">
                      <div id="formbox2">
                         <img src="resources/graphics/abbottlogo.png" runat="server" alt="Abbott Medical Italia srl" title="Abbott Medical Italia srl" class="logoimage" /><br />
                        <p><asp:Label id="lbl_error" runat="server" Text=""></asp:Label></p>
                          
                       </div></div>
                </asp:Panel>
       
    </form>
</body>
</html>
