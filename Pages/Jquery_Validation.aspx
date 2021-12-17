<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jquery_Validation.aspx.cs" Inherits="Pages_Jquery_Validation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Practice</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
    crossorigin="anonymous">



  </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css"  />

 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lbl1" Text="Name" runat="server" />
        <asp:TextBox ID="txt1" runat="server" Text="" /> <br />
        <asp:Label ID="lbl2" Text="Pass" runat="server" />
        <asp:TextBox ID="txt2" runat="server" Text="" /><br />
        <asp:Label  ID="lbl3" Text="Email" runat="server" />
        <asp:TextBox ID="txt3" runat="server" Text="email" /><br />
        <asp:Button ID="btn" Text="Button" runat="server"  />

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js">

        </script>
        <script>
            document.getElementById('btn')
            .addEventListener('click', function () { toastr.info('button_Clicked'); })
        </script>


    </div>

        <%--another button--%>


       <%-- <asp:Panel runat="server" ID="pnlAlertBox"  style="position:absolute; top:0; > 
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">This is customize alertbox</h4>
                </div>
                <div class="modal-body">
                    This is the messages...
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-default" Text="Cancel" />
                    <asp:Button ID="btnOk" runat="server" CssClass="btn btn-primary" Text="Ok" />
                </div>
            </div>
        </div>
</asp:Panel>--%>





    </form>
</body>
<script>
    $(document).ready(function() {  
        $('#btn').click(function() {  
            var Name, pass , emailExp;  
            Name = $("#txt1").val();  
            pass = $("#txt2").val();
            EmailId = $("#txt3").val();
            emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;  
            if (Name == '' && pass == 0 &&  EmailId == '') {  
                toastr.warning("Enter All Fields");  
                return false;  
            }  
            if (Name == '') {  
                toastr.info("Please Enter Login ID");  
                return false;  
            }  
            if (pass == 0) {  
                toastr.info("Please Enter pass");  
                return false;  
            }  
            
            if (EmailId == '')  
            {  
                toastr.info("Email Id Is Required");  
                return false;  
            }  
            if (EmailId != '')  
            {  
                if (!EmailId.match(emailExp)  
                ){  
                    toastr.error("Invalid Email Id");  
                    return false;  
                }  
            }  
            return true;  
        })  
    });   
</script>
</html>
