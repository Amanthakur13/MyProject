<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Masterex.aspx.cs" Inherits="Masterex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <div>
    <asp:Label Text="text" runat="server" > Enter </asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" class="txtbox" ></asp:TextBox>
        <asp:Button id="btn" Text="button" runat="server"  ClientIDMode="Static" OnClientClick="return validateFields();" ></asp:Button>
        </div>

    <script>
        

        function validateFields() {
            var msg = "";

            if (document.getElementById('<%=txtEmail.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Employee Name. \n";
            }

            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btn.ClientID%>').value.trim() == "Register") {
                    if (confirm("Do you really want to Submit Details.?")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            }
        }

             </script>

</asp:Content>

  