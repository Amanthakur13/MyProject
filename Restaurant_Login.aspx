<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Restaurant_Login.aspx.cs" Inherits="Restaurant_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Login</title>
    <style>
        .login {
            border: 4px solid black;
            height: 500px;
            width: 400px;
            margin: 0 auto;
            margin-top: 250px;
        }

        body {
            background-image: url('https://static.vecteezy.com/system/resources/previews/001/948/406/large_2x/wood-table-top-for-display-with-blurred-restaurant-background-free-photo.jpg');
            /*background-repeat:no-repeat;*/
            width: 100%;
            height: 100vh;
        }

        .st {
            text-align: center;
            font-size: 50px;
            margin-top: 20px;
        }

        .boxset {
            text-align: center;
            margin-top: 100px;
        }

        .txtbox {
            padding: 11px;
            /*padding-right:50px;
            padding-left:20px;*/
        }

        .btn {
            text-align: center;
            margin-top: 35px;
        }

        .newbtn {
            font-size: 25px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:Label ID="LblMsg" class="danger" runat="server" ForeColor="Red"></asp:Label>
        <div class="login">

            <asp:Label ID="Labellogin" CssClass="st" runat="server" ForeColor="black" Style="display: block;"><b>Login</b></asp:Label>
            <hr />
            <div class="boxset">
                <hr />
                <asp:TextBox ID="txt_UserName" runat="server" placeholder="Enter User Name" class="txtbox"></asp:TextBox>
                <hr />
                <asp:TextBox ID="txt_Password" runat="server" placeholder="Enter Password" class="txtbox" TextMode="Password"></asp:TextBox>
                <hr />
            </div>

            <div class="btn">
                <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" CssClass="newbtn" Text="Login" ClientIDMode="Static" OnClientClick="return validateFields();" />

            </div>

        </div>
    </form>
</body>
</html>


<script>


    function validateFields() {
        var msg = "";

        if (document.getElementById('<%=txt_UserName.ClientID%>').value.trim() == "") {
              msg = msg + "Please Enter User Name. \n";
          }

          if (document.getElementById('<%=txt_Password.ClientID%>').value.trim() == "") {
              msg = msg + "Please Enter Password. \n";
          }


          if (msg != "") {
              alert(msg);
              return false
          }
          else {
              if (document.getElementById('<%=btn_Login.ClientID%>').value.trim() == "Register") {
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
