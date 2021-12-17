<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_reg.aspx.cs" Inherits="Emp_reg" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student registration</title>



    
       <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/atlantis.css">
    <link rel="stylesheet" href="../assets/css/demo.css">
    <link href="../assets/css/fonts.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Oswald&display=swap" rel="stylesheet" />
    <style>


          fieldset {
            border: 1px solid blue;
            padding: .35em .625em .75em;
            margin-bottom: 10px;
            padding-bottom: 0.5em;
            padding-bottom: 2px;
            
        }

        legend {
            width: initial;
            
            padding: 0px 10px;
            margin: 0;
            font-size: 12px;
            font-weight: bold;
            color: #003FF7;
            text-transform: uppercase;
            /*background-color: #FFFF00;*/
            border: 1px solid #ddd;
        }



        body {
            background-color: #EECDA3;
            
        }
        .row {

            font-size:20px;
           
            
            
           
        }
        .tab {
            tab-size:5;
        }

         .newbtn {
            color: #fff;
           
            
            border-radius: 50px;
            margin-left:150px;
            margin-right:130px;
            padding: 5px 0px;
            
            text-transform: uppercase;
            background: #094ea2;
            display: inline-block;
            -webkit-transition: all 0.3s ease-out;
            -moz-transition: all 0.3s ease-out;
            -ms-transition: all 0.3s ease-out;
            -o-transition: all 0.3s ease-out;
            transition: all 0.3s ease-out;
            border: none;
            cursor: pointer;
            outline: none;
        }
        .txtbox {
            padding:0px;
            padding:0px;
            padding-left: 10px;
            margin-left:350px;
            text-align:center;
           
        }
        .row {
           
            text-align:center;
         
        }
        .dropdown {
            width:260px;
            height:35PX;
            margin-left:174px;
            text-align  :center;
        }
       
        .st {
            padding-right:1050px;
            margin-left:170px;
        }
       .tbl{
           border:4px solid black;
           width:750px;
           height:900px;
           margin:auto;
           background-color:azure;
           margin-top:60px;
       }

    </style>
   

</head>
<body>
    <div class="tbl">
    <form id="form1" runat="server">


        <div>
            <h1 style="text-align:center;" class="fs-title PT20" style="color: white; background-color:transparent ; "><b><span style="color: black; ">Employee Registration Form</span></b></h1>

        </div>
        <br />

           <div class="row">
               
                       
                            
                             <asp:Label ID="LabelName" cssclass="st" runat="server" ForeColor="black" Style="display: inline-block;">Employee Name </asp:Label>
                                <asp:TextBox ID="txtEmpName" runat="server" placeholder="Enter Name" class="txtbox"></asp:TextBox>
                         
                       
                            <asp:Label ID="LabelEmail" cssclass="st" runat="server" ForeColor="black" Style="display: block;">Email</asp:Label>
                         
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" class="txtbox"></asp:TextBox>
                                                 
                            <asp:Label ID="LabelAddress" cssclass="st" runat="server" ForeColor="black" Style="display: block;">Address</asp:Label>
                                    
                              <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter Address" class="txtbox"></asp:TextBox>
                                  
               </div>
         



          <div class="row">
                       
                            <asp:Label ID="Labelphone" cssclass="st" runat="server" ForeColor="black" Style="display: block;">Phone no</asp:Label>                                                                                    
                                <asp:TextBox ID="txtPhoneno" runat="server" placeholder="Phone no" class="txtbox" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                            
                                           
                            <asp:Label ID="Labelage" cssclass="st" runat="server" ForeColor="black" Style="display: block;">Age</asp:Label>
                                <asp:TextBox ID="txtAge" runat="server" placeholder="Enter Age" class="txtbox" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                           
              <asp:Label ID="LabelClass" cssclass="st" runat="server" ForeColor="black" Style="display: block;">Select Dept</asp:Label>
                 <div class="dropdown">  
            <asp:DropDownList ID="DropDownList1"  CssClass="dropdown" runat="server" >  
             
          
            
        </asp:DropDownList>  
        </div> 

                        
              </div>
        
        
        
        <br />
        <br />

        
          <div class="newbtn">
                            <div class="col-md-12">
                                <div class="text-center">
                                    <asp:Button ID="btnregister"  runat="server" onclick="btnregister_Click" CssClass="newbtn" Text="Register"  ClientIDMode="Static" OnClientClick="return validateFields();" />
                                   
                                </div>
                            </div>
                        </div>
      
               <br />
        <br />



          <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <h5 style="color:blue"><b>Registered Students</b></h5>
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EmployeeName" HeaderText=" Employee Name " />
                                 <asp:BoundField DataField="Email" HeaderText="Email " />
                                 <asp:BoundField DataField="Address" HeaderText="Address" />
                                 <asp:BoundField DataField="phoneno" HeaderText="phone no" />
                                 <asp:BoundField DataField="age" HeaderText="age" />
                              <asp:BoundField DataField="DepartmentName" HeaderText="DeptName" />
                                
                                
                               <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true"  />
                                <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />

                                </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

    </form>
        </div>
</body>
</html>

 <script>
     function validateDec(el, evt) {
         var charCode = (evt.which) ? evt.which : event.keyCode;
         var number = el.value.split('.');
         if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
             return false;
         }
         //just one dot (thanks ddlab)
         if (number.length > 1 && charCode == 46) {
             return false;
         }
         //get the carat position
         var caratPos = getSelectionStart(el);
         var dotPos = el.value.indexOf(".");
         if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
             return false;
         }
         return true;
     }

     function OnlyNumbers(event) {
         var e = event || evt; // for trans-browser compatibility
         var charCode = e.which || e.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
             return false;

         return true;
     }

     function validateFields() {
         var msg = "";

         if (document.getElementById('<%=txtEmpName.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Employee Name. \n";
            }
            <%--if (document.getElementById('<%=txts_HSN_SAC.ClientID%>').value.trim() == "") {
                msg = msg + "Enter HSN/ SAC. \n";

            }--%>
            if (document.getElementById('<%=txtEmail.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Email Id. \n";
            }
            if (document.getElementById('<%=txtAddress.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Address. \n";
            }
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnregister.ClientID%>').value.trim() == "Register") {
                    if (confirm("Do you really want to Submit Details.?")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
                <%--else if (document.getElementById('<%=btnSubmit.ClientID%>').value.trim() == "MODIFY") {
                    if (confirm("Do you really want to Modify Details.?")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }--%>
            }
        }
    </script>
