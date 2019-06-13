<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FormularioContacto.WebForm1" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Formulario de Contacto</title>
    <style type="text/css">
        h1{ text-align: center; color: Black; }
        body{ background-color:Teal; }
        .style1
        {
            width: 65px;
        }
    .txt
    {
        border:1px solid #d1c7ac;
        color: Blue;
        padding:3px;
        margin-right:4px;
        margin-bottom:4px;
        font-family:tahoma, arial, sans-serif;
    }
    .btn
    {
        background-color:Gray;
        border:1px solid #FFFFFF;
        font-family: Arial Black;
        font-size:14px;
        text-align:center;
        height: 40px;
        width: 100px;
    }
        .style2
        {
            color: White;
            width: 65px;
        }
    </style>

</head>
<body>
<h1><strong>Formulario de Contacto con Recaptcha</strong></h1>
    <form id="form1" runat="server">
    <div>
    
        <table style=" text-align:left; margin:auto">
            <tr>
                <td class="style2">
                    <strong>Titulo:&nbsp;</strong></td>
                <td>
                    <asp:TextBox ID="txttitulo" runat="server" CssClass="txt" Width="165px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txttitulo" ErrorMessage="*Ingrese Titulo" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <strong>Nombre:</strong></td>
                <td>
                    <asp:TextBox ID="txtnombre" runat="server" CssClass="txt" Width="165px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtnombre" ErrorMessage="*Ingrese Nombre" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <strong>Correo:</strong></td>
                <td>
                    <asp:TextBox ID="txtcorreo" runat="server" CssClass="txt" Width="165px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtcorreo" ErrorMessage="*Ingrese Correo Valido" 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <strong>Mensaje:</strong></td>
                <td>
                    <asp:TextBox ID="txtmensaje" runat="server" Height="166px" TextMode="MultiLine" 
                        Width="250px" CssClass="txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtmensaje" ErrorMessage="*Ingrese Mensaje" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    </td>
                <td>
                <recaptcha:RecaptchaControl 
                ID="RecaptchaControl2" 
                runat="server" 
                PublicKey="6LcOscwSAAAAAClgCVVWUOLx-EVBWlIbUldCPzAd " 
                PrivateKey="6LcOscwSAAAAAH6wOwoy0TAFkJBlzPcrg4I6kXuE" Language=""/>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnenviar" runat="server" Text="Enviar" CssClass="btn" 
                        onclick="btnenviar_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblaviso" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
