<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="Pages_Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .heading {
            border: 2px solid black;
            height: 40px;
            width: 1000px;
            background-color: aliceblue;
        }

        .tab {
            text-align: left;
            border: 2px solid black;
            height: 330px;
            width: 1000px;
            background-color: aliceblue;
        }

        .page-inner {
            border: 1px solid black;
            height: 660px;
            width: 1073px;
            background-color: azure;
        }

        .row {
            margin-left: 10px;
        }

        .btn {
            margin-left: 1px;
        }

        .head {
            margin-right: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <div class="page-inner">
        <div class="heading" style="margin-top: 70px; text-align: center">
            <h1><b>BILLING</b></h1>
        </div>
        <div class="page-header" style="margin-top: 50px;">
        </div>
        <br />
        <div class="tab">

            <hr />
            <h1 style="margin-right: 30px; margin-left: 13px; text-align: left"><b>Product Detail</b></h1>
            <hr />

            <div class="row">
                <div class="col-md-8">
                    <label>Product Name <span style="color: red;">*</span></label>
                    <asp:DropDownList ID="ddls_ProductName" runat="server" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddls_ProductName_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>






                </div>

                <div class="col-md-3">
                    <label>Unit Price (In Rs.)<span style="color: red;">*</span></label>
                    <asp:TextBox ID="txtd_UnitPrice" CssClass="form-control" runat="server" placeholder="Enter Unit Price " MaxLength="8" autocomplete="off" ClientIDMode="Static" onchange="GetNetPrice()" onkeypress="return validateDec(this,event); return AvoidSpace(event);" OnTextChanged="txt_Price_TextChanged"></asp:TextBox>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-4">
                    <label>Quantity<span style="color: red;">*</span></label>
                    <asp:TextBox ID="txtI_Quantity" CssClass="form-control" runat="server" placeholder="Enter Quantity" MaxLength="5" autocomplete="off" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);" ClientIDMode="Static" onchange="GetNetPrice()" OnTextChanged="txt_quantity_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <label>Table <span style="color: red;">*</span></label><br />
                    <asp:DropDownList ID="DropDown" runat="server" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddls_Table_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>

                </div>



                <div class="col-md-3">

                    <label>Total (In Rs.)<span style="color: red;">*</span></label>
                    <asp:TextBox ID="txtd_Total" CssClass="form-control" runat="server" placeholder="Enter Price" MaxLength="8" autocomplete="off" onkeypress="return validateDec(this,event); return AvoidSpace(event);" ClientIDMode="Static"></asp:TextBox>


                </div>
            </div>
            <br />
            <div class="btn">
                <div class="col-md-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-sm btn-primary" Text="ADD" OnClientClick="return validateFields();" OnClick="btnAdd_Click" />

                </div>
                <hr />

            </div>



        </div>
        <br />
        <div class="card" style="margin-top: 20px; border: 1px solid black;">
            <div class="row">
                <div class="col-md-12">
                    <h3 style="text-align: center; color: blue"><b>Bill</b></h3>
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="temp_id" OnRowDeleting="GridView1_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                                <asp:BoundField DataField="Product_Price" HeaderText="Price" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Table_No" HeaderText="Table" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />

                                <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>


    </div>





</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">

    <script>


        function validateFields() {
            var msg = "";

            if (document.getElementById('<%=ddls_ProductName.ClientID%>').value.trim() == "") {
                msg = msg + "Select Product Name. \n";
            }
            <%--if (document.getElementById('<%=txts_HSN_SAC.ClientID%>').value.trim() == "") {
                msg = msg + "Enter HSN/ SAC. \n";

            }--%>
            if (document.getElementById('<%=txtd_UnitPrice.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Unit Price. \n";
            }
            if (document.getElementById('<%=txtI_Quantity.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Quantity. \n";
            }
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnAdd.ClientID%>').value.trim() == "ADD") {
                    if (confirm("Do you really want to Submit.?")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }

                else {
                    return false;
                }
            }
        }

    </script>
</asp:Content>

