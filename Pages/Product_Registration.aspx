<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Product_Registration.aspx.cs" Inherits="Pages_Product_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        abc {
            margin-top: 50px;
            border: 4px solid red;
            width: 100px;
            height: 100px;
            background-color: ActiveBorder;
        }

        .page-inner {
        }

        body {
            background-color: #ccffff;
        }

        .pname {
            font-size: 18px;
        }

        .prate {
            font-size: 18px;
        }

        .IsA {
            font-size: 18px;
        }

        .IsA {
            font-size: 25px;
        }

        .btn {
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="page-inner">

        <div class="page-header" style="font-size: 50px; margin-top: 50px; text-align: center">
            <hr />
            <h2><b>Product Details</b> </h2>
            <hr />
        </div>
        <div class="row">
            <div class="col-md-3">
                <asp:Label Text="Product Name" runat="server" class="pname" />

                <asp:TextBox ID="txt_ProductName" runat="server" placeholder="Enter Product Name" class="pname"></asp:TextBox>
            </div>
            <br />
            <div class="col-md-3">

                <asp:Label Text="Product Rate" runat="server" class="prate" />

                <asp:TextBox ID="txt_ProductRate" runat="server" placeholder="Enter Product Rate" class="pname" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>

            </div>
            <div class="col-md-3">
                <asp:Label Text="Upload Image" runat="server" class="prate" />
                <asp:FileUpload ID="FileUpload1" runat="server" />



                <%-- <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />--%>
            </div>


            <div class="col-sm-3">

                <asp:Label Text="IsActive" runat="server" Class="IsA" />
                <asp:CheckBox ID="CheckBox1" runat="server" Class="IsA" />

            </div>

        </div>
        <hr />
        <div class="btn">
            <asp:Button ID="btn_AddProduct" runat="server" CssClass="btn btn-sm btn-primary" Text="Add Product" OnClientClick="return validateFields();" OnClick="btnAddProduct_Click" />
        </div>
        <br />
        <br />
        <hr />
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <h5 style="text-align: center; color: blue"><b>PRODUCT LIST</b></h5>
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Product_Id" OnRowDeleting="GridView1_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                                <asp:BoundField DataField="Product_Price" HeaderText="Product Price" />
                                <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                                <asp:BoundField DataField="Image_Path" HeaderText="FileName" SortExpression="FileName" />

                                <%--temp.field--%>

                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="122px"
                                            Width="148px" ImageUrl='<%# Eval("Image_Path") %>' />
                                        <br />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="300px" />
                                </asp:TemplateField>




                                <%-------------------------%>
                                <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true" />
                                <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>




    </div>


    
<script>
    function OnlyNumbers(event) {
        var e = event || evt; // for trans-browser compatibility
        var charCode = e.which || e.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false; return true;
    } function validateFields() {
        var msg = ""; if (document.getElementById('<%=txt_ProductName.ClientID%>').value.trim() == "") {
        msg = msg + "Enter Product Name. \n";
    } if (document.getElementById('<%=txt_ProductRate.ClientID%>').value.trim() == "") {
    msg = msg + "Enter Product Price. \n";
}
    if (msg != "") {
        alert(msg);
        return false
    }
    else {
        if (document.getElementById('<%=btn_AddProduct.ClientID%>').value.trim() == "ADD PRODUCT") {
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

