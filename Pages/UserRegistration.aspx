<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="Pages_UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .box {
            border: 2px solid black;
            weidth: 800px;
            height: 450px;
        }

        .pname {
            font-size: 20px;
        }

        .btn {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">


    <div class="page-inner" style="background-color: grey; height: 900px; width: 1200px;">


        <div class="page-header" style="font-size: 50px; margin-top: 50px; text-align: center; background-color: aliceblue;">

            <div class="box">
                <hr />
                <h2><b>User Registration</b> </h2>
                <hr />
                <div class="col-sm-3" style="font-size: 20px; margin-top: 2px; text-align: left">
                    <asp:Label Text="User Name" runat="server" class="pname" />
                    <asp:TextBox ID="txt_UserName" runat="server" placeholder="Enter User Name" class="pname" AutoPostBack="true"></asp:TextBox>
                </div>
                <hr />
                <div class="col-sm-3" style="font-size: 20px; margin-top: 12px; text-align: left">
                    <asp:Label Text="Password" runat="server" class="pname" />
                    <asp:TextBox ID="txt_Password"  runat="server" placeholder="Enter Password" class="pname" AutoPostBack="true"></asp:TextBox>

                </div>
                <hr />
                <div class="col-sm-3" style="font-size: 30px; text-align: left; margin-top: 10px">
                    <asp:Label Text="IsActive" runat="server" Class="IsA" />
                    <asp:CheckBox ID="CheckBox1" runat="server" Class="IsA" />

                </div>
                <hr />

                <div class="btn" style="font-size: 3px; margin-top: 0px; text-align: left;">
                    <asp:Button ID="btn_Register" runat="server" CssClass="btn btn-sm btn-primary" Text="Register" OnClientClick="return validateFields();" OnClick="btnRegister_Click"  />
                </div>
            </div>

            <div class="card">
                <div class="row">
                    <div class="col-md-12">
                        <h5 style="text-align: center; color: blue"><b>USER RECORD</b></h5>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="User_Id" OnRowDeleting="GridView1_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
                                    <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                                    <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true" />
                                    <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </div>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
<script>
    function validateFields() {
     var msg = ""; if (document.getElementById('<%=txt_UserName.ClientID%>').value.trim() == "") {
         msg = msg + "Enter User Name. \n";
     } if (document.getElementById('<%=txt_Password.ClientID%>').value.trim() == "") {
    msg = msg + "Enter Password. \n";
}
     if (msg != "") {
         alert(msg);
         return false
     }
     else {
         if (document.getElementById('<%=btn_Register.ClientID%>').value.trim() == "REGISTER") {
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
