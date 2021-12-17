<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Pages_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server" style="margin-right:100px;">


    <div class="page-inner" style="margin-left:200px;">

        <div class="page-header" style="margin-top: 50px;">
            <h1 style="text-align: center; font-style: inherit;"><b>Hotel RedFort</b> </h1>
            <h3 style="text-align: center;">Welcome Hotel Redfort</h3>
            <h4 style="text-align: center;">"Good Food,Good health"</h4>




            <%--For Order List--%>

            <div class="card" style="width: 70rem; height: 30rem; padding: 0px; background-color: aliceblue;">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 30px;"><b>Order List</b></h5>
                     
                    <h5 style="text-align:center; font-size:30px; margin-top:-45px;"> <b> Table No -  <asp:Label runat="server" style="text-align:center"  ID="lblShowTableNo" ></asp:Label></b></h5>
                    <h5 style="text-align:right; font-size:30px; margin-top:-45px;"> <b> Total Amount -  <asp:Label runat="server" style="text-align:center"  ID="lblTotalprice" ></asp:Label></b></h5>
                    <hr />

                    <div class="row">
                        <asp:Repeater ID="Repeatercart" runat="server" OnItemCommand="Repeatercart_ItemCommand">
                            <ItemTemplate>
                                <div class="col-md-3 ">
                                    <div class="card" style="width: 16rem; height: 6rem; padding: 0px;">
                                        <div class="card-body" style="background-color: #B8E4F0;">


                                            <asp:Label ID="Lbl_ProductName" runat="server" Style="font-size: 16px;" Text='<%# (Eval("Product_Name").ToString()) %>'></asp:Label>
                                            <asp:Label ID="Lbl_ProductPrice" runat="server" Style="margin-left: 30px; font-size: 16px;" Text='<%# (Eval("Product_Price").ToString()) %>'></asp:Label>
                                            <asp:Label Text="rs/-" runat="server" />

                                            <asp:Label ID="lbl_tempid" runat="server" Visible="false" Text='<%# (Eval("temp_id").ToString()) %>'></asp:Label><br />

                                            <asp:Label Text="Qty:" runat="server" />
                                            <asp:Label ID="lbl_quantity" runat="server" Visible="true" Text='<%# (Eval("Quantity").ToString()) %>'>  </asp:Label>
                                            <asp:Label ID="lbl_productid" runat="server" Visible="false" Text='<%# (Eval("Product_id").ToString()) %>'>  </asp:Label>


                                            <asp:Button ID="btn_Add" Style="background-color: aliceblue; text-align: left; margin-top: -20px; margin-left: 10px;" runat="server" OnClick="btn_Add" Text="+" CommandName="Add" UseSubmitBehavior="false" />
                                            <asp:Button ID="btn_Sub" Style="background-color: aliceblue; text-align: left; margin-top: 0px; margin-left: 15px;" runat="server" OnClick="btn_Sub" Text="-" CommandName="Sub" UseSubmitBehavior="false" />

                                            <asp:Button ID="btn_Delete" Style="background-color: ButtonFace; width: 34%; text-align: center; margin-left: 20px;" runat="server" OnClick="btn_Delete" Text="Delete" CommandName="Delete" UseSubmitBehavior="false" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>
            </div>

            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="row">
                        <div class="col-md-3">
                            <label>Name <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtd_Customername" CssClass="form-control" runat="server" placeholder="Enter Name" MaxLength="8" autocomplete="off" ClientIDMode="Static" onchange="GetNetPrice()" onkeypress="return validateDec(this,event); return AvoidSpace(event);" OnTextChanged="txt_Name_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Phoneno <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtd_Phoneno" CssClass="form-control" runat="server" placeholder="Enter No" MaxLength="8" autocomplete="off" ClientIDMode="Static" onchange="GetNetPrice()" onkeypress="return validateDec(this,event); return AvoidSpace(event);" OnTextChanged="txt_Phoneno_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Email <span style="color: red;">*</span></label>
                            <asp:TextBox ID="txtd_Email" CssClass="form-control" runat="server" placeholder="Enter No" MaxLength="8" autocomplete="off" ClientIDMode="Static" onchange="GetNetPrice()" onkeypress="return validateDec(this,event); return AvoidSpace(event);" OnTextChanged="txt_Email_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Table <span style="color: red;">*</span></label><br />
                            <asp:DropDownList ID="DropDown" runat="server" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddls_Table_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>

                        </div>

                    </div>


                </ContentTemplate>
            </asp:UpdatePanel>

            <br />
        </div>
        <br />
        <%--for table--%>

        <div class="row">
            <asp:Repeater ID="repeater_table" runat="server" OnItemCommand="Repeater_tablecommand">
                <ItemTemplate>

                    <div class="col-md-2" style="margin-right: 0px;">

                        <asp:Label ID="lbl_tableid" runat="server" Visible="false" Text='<%# (Eval("Table_id").ToString()) %>'></asp:Label>

                        <asp:Button ID="btn_Table" Style="/*background-color: ButtonFace; */ margin-top: 20px; font-size: 20px;" runat="server" OnClick="btn_Table" Text='<%# (Eval("table_Name").ToString()) %>' CommandName="Table" CommandArgument='<%# Eval("Table_id") %>' UseSubmitBehavior="false" />


                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>

        <br />

        <div class="alert alert-warning" role="alert" style="width: 1050px;">
            <b style="font-size: 25px;">Item List</b>
        </div>



        <%--for item list--%>

        <div class="row">

            <asp:Repeater ID="Repeater" runat="server" OnItemCommand="Repeater_ItemCommand">
                <ItemTemplate>

                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 310px;">
                            <img src='<%#Eval("Image_Path") %>' class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>
                                    <asp:Label ID="Lbl_ProductName" runat="server" Text='<%# (Eval("Product_Name").ToString()) %>'></asp:Label>
                                </b></h5>
                                <p class="card-text" style="font-size: 12px;">
                                    <strong>
                                        <asp:Label ID="Lbl_ProductPrice" runat="server" Text='<%# (Eval("Product_Price").ToString()) %>'></asp:Label></strong>
                                    <br />
                                    <strong>
                                        <asp:Label ID="lbl_productid" runat="server" Visible="false" Text='<%# (Eval("Product_Id").ToString()) %>'>  </asp:Label></strong>

                                </p>

                                <%--<asp:Button ID="btn_Order" runat="server" CssClass="btn btn-sm btn-primary" Text="Order" OnClientClick="return validateFields();" OnClick="btnOrder_Click" />--%>
                                <asp:Button ID="btn_Order" Style="background-color: aliceblue;" runat="server" OnClick="btn_Order" Text="Order" CommandName="Order" CommandArgument='<%# Eval("Product_ID") %>' UseSubmitBehavior="false" />
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <%--code for side bar--%>


    <section class="">
        <!-- Footer -->
        <footer class="text-center text-white" style="background-color: #0a4275;">
            <!-- Grid container -->
            <div class="container p-4 pb-0">
                <!-- Section: CTA -->
                <section class="" style="height: 20px;">
                    <p class="d-flex justify-content-center align-items-center">
                        <span class="me-3">Register for free</span>
                        <button type="button" class="btn btn-outline-light btn-rounded btn-sm">
                            Sign up!
                        </button>
                    </p>
                </section>
                <!-- Section: CTA -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                Please Visit:
      <a class="text-white" href="https://mdbootstrap.com/">HotelRedFort.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </section>

    <script>
        function addToCart() {
            alert(document.getElementById("Lbl3"));
        }
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

