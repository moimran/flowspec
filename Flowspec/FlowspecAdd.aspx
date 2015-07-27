<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowspecAdd.aspx.cs" Inherits="Flowspec.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/tooltipster.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <script src="Scripts/jquery.tooltipster.js"></script>
    <title> FlowSpec</title>
</head>
<body>
    <div class="panel panel-info">
        <div class="panel-heading"><h2>FlowSpec</h2></div>
        <div class="panel-body">

        <form class="form-horizontal" runat="server">
            <div class="form-group" runat="server">
                <label class="control-label col-sm-2">Action:</label>
                <div>
                    <label class="radio-inline">
                        <input type="radio" name="Action" value="Add" id="show" checked="checked"/>
                        Add
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="Action" value="Remove" id="hide"/>
                        Remove
                    </label>

                </div>
            </div>
            <%--Action--%>
            <div class="form-group" id="dest">
                <label class="control-label col-sm-2">DestinationPrefix:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" runat="server" value="4.4.4.4/32" id="DestinationPrefix" placeholder="Destination address ex 1.1.1.1/32" />
                </div>
            </div>
            <%--DestinationPrefix--%>
            <div class="form-group" id="destp">
                <label class="control-label col-sm-2">DestinationPort:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" runat="server" id="DestinationPort" value="50" placeholder="Destination port valid from" name="DestinationPort" />
                </div>
            </div>
            <%--DestinationPort--%>
            <div class="form-group" id="source">
                <label class="control-label col-sm-2">SourcePrefix:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" runat="server" id="SourcePrefix" value="8.8.8.8/32" placeholder="Source address ex 1.1.1.1/32" name="SourcePrefix" />
                </div>
            </div>
            <%--SourcePrefix--%>
            <div class="form-group" id="sourcep">
                <label class="control-label col-sm-2">SourcePort:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" runat="server" value="1024" id="SourcePort" placeholder="Source port valid from" />
                </div>
            </div>
            <%--SourcePort--%>
            <div class="form-group" id="time">
                <label class="control-label col-sm-2">TTL*:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control required" runat="server" value="40" id="ttl" placeholder="Time to live in seconds" />
                </div>
            </div>
            <%--TTL--%>
            <div class="form-group">
                <label class="control-label col-sm-2">PolicyName*:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control required" runat="server" id="PolicyName" value="send" placeholder="Enter the policy name given" />
                </div>
            </div>
            <%--Policy Name--%>
            <div class="form-group">
                <label class="control-label col-sm-2">SharedAccessKey*:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control required" runat="server" id="SharedAccessKey" value="YUUMjuAclll9/FU7QnLM5E4t6W2ivhWhUpVJrc33TcY=" placeholder="Access Key " />
                </div>
            </div>
            <%--SharedAccessKey--%>
            <div class="form-group" id="hash">
                <label class="control-label col-sm-2">Hash value*:</label>
                <div class="col-sm-4">
                    <input disabled="disabled" type="text" class="form-control" runat="server" id="Hash" placeholder="Enter the hash value "/>
                </div>

            </div>
            <%--Hash value--%>
            <div class="form-group" id="proto">
                <label class="control-label col-sm-2">Protocol:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" runat="server" id="Protocol" value="6" placeholder="Protocol number" />
                </div>
            </div>
            <%--Protocol--%>
            <div class="form-group" id="ticketno">
                <label class="control-label col-sm-2">Ticket*:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control required" runat="server" id="ticket" value="5525142" placeholder="Ticket number" />
                </div>
            </div>
            <%--Ticket--%>
            <div class="form-group" runat="server" id="com">
                <label class="control-label col-sm-2">Comment:</label>
                <div class="col-sm-4">
                    <textarea class="form-control" runat="server" name="Comment" id="Comment" rows="3"></textarea>
                </div>
            </div>
            <%--Comment--%>
            <div class="form-group" runat="server" id="treat">
                <label class="control-label col-sm-2">Treatment:</label>
                <div>
                    <label class="radio-inline">
                        <input type="radio" name="Treatment" value="Discard" checked="checked" />
                        Discard
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="Treatment" value="Redirect" disabled="disabled"/>
                        Redirect
                    </label>

                </div>
            </div>
            <%--Treatment--%>
            <div class="form-group" runat="server" id="dns">
                <label class="control-label col-sm-2">DNS Lookups:</label>
                <div>
                    <label class="radio-inline">
                        <input type="radio" name="lookups" value="yes" checked="checked"/>
                        Yes
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="lookups" value="no"/>
                        No
                    </label>

                </div>
            </div>
            <%--DNS lookup--%>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input id="Button1" class="btn btn-success"  runat="server" type="button" value="Submit" />
                    <input id="Button2" class="btn btn-success"  runat="server" type="button" value="Submit" style="display:none;"/>
                </div>
            </div>
            <%-- Submit--%>
            <div>
                    <label id="lblmsg" style="color:#FF0000; font-size: 12pt"></label>
            </div>
        </form>
        </div>
        <div class="panel-footer">Firewall at the Edge</div>
    </div>
    
    <script type="text/javascript">
        function ValidateIPaddress(inputText) {
            var ipformat = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(0|32)$/;
            if (inputText.match(ipformat)) {
                return true;
            }
            else {
                alert("You have entered an invalid IP address!");
                return false;
            }
        }
        $(document).ready(function () {
            $('#DestinationPrefix').change(function () {
                if (ValidateIPaddress($(this).val()) == false)
                {
                    document.getElementById("DestinationPrefix").value = "";
                }
                
            });
            $('#SourcePrefix').change(function () {
                if (ValidateIPaddress($(this).val()) == false)
                {
                    document.getElementById("SourcePrefix").value = ""
                }
                
            });
            $('#SourcePrefix').keyup(function () {
                var txtvalue1 = $('#DestinationPrefix').val();
                var txtvalue2 = $('#SourcePrefix').val();
                if (txtvalue1 != '' && txtvalue2 != '') {
                    if (txtvalue1 == txtvalue2) {
                        alert("values are equal");
                        document.getElementById("DestinationPrefix").value = "";
                        document.getElementById("SourcePrefix").value = "";
                        
                    }
                }

            });
            $('#DestinationPrefix').keyup(function () {
                var txtvalue1 = $('#DestinationPrefix').val();
                var txtvalue2 = $('#SourcePrefix').val();
                if (txtvalue1 == txtvalue2) {
                    alert("SourcePrefix and DestinationPrefix cannot be equal");

                }
            });
            $('#DestinationPort').keydown(function (e) {
                if (e.shiftKey || e.ctrlKey || e.altKey) {
                    e.preventDefault();
                } else {
                    var key = e.keyCode;
                    if (!((key == 9) || (key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
                        e.preventDefault();
                    }
                }
            });
            $('#PolicyName').keydown(function (e) {
                if (e.shiftKey || e.ctrlKey || e.altKey) {
                    e.preventDefault();
                } else {
                    var key = e.keyCode;
                    
                    if (!((key == 9) || (key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
                        e.preventDefault();
                    }
                }
            });
            $('#Protocol').keydown(function (e) {
                if (e.shiftKey || e.ctrlKey || e.altKey) {
                    e.preventDefault();
                } else {
                    var key = e.keyCode;
                    if (!((key == 9) || (key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
                        e.preventDefault();
                    }
                }
            });
            $('#Button1').click(function (e) {
                var isValid = true;
                
                $('input[type="text"].required').each(function () {
                    if ($.trim($(this).val()) == '') {
                        isValid = false;
                        $(this).css({
                            "border": "1px solid red",
                            "background": "#FFCECE"
                        });
                    }
                    else {
                        $(this).css({
                            "border": "",
                            "background": ""
                        });
                    }
                });
                
                if (isValid == false)
                    e.preventDefault();
                else {
                    //var params = '{' + '"DestinationPrefix": "' + $('#DestinationPrefix').val()                     + '", "SourcePrefix": "' + $('#SourcePrefix').val() + '"' + '}';
                    var params = '{' + '"DestinationPrefix": "' + $('#DestinationPrefix').val()                                    + '", "SourcePrefix": "' + $('#SourcePrefix').val()                                    + '","DestinationPort": "' + $('#DestinationPort').val()                                    + '","SourcePort": "' + $('#SourcePort').val()                                    + '","PolicyName": "' + $('#PolicyName').val()                                    + '","Protocol": "' + $('#Protocol').val()                                    + '","Comment": "' + $('#Comment').val()                                    + '","Treatment": "' + $("input[name=Treatment]:checked").val()                                    + '","Action": "' + $("input[name=Action]:checked").val()                                    + '","lookups": "' + $("input[name=lookups]:checked").val()                                                                        + '","Ticket": "' + $('#ticket').val()                                    + '","Hash": "' + $('#Hash').val()                                    + '","SharedAccessKey": "' + $('#SharedAccessKey').val()                                    + '","ttl": "' + $('#ttl').val() + '"' + '}';                    alert(params)
                    $.ajax({
                        type: "POST",
                        url: '<%= ResolveUrl("flowspecadd.aspx/Add") %>',
                        data: params,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        failure: function (response) {
                            $('#lblmsg').text(respond.d);
                            alert(response.d);
                        }
                    });
                }
                    //alert('Thank you for submitting');
            });
            //-------------------------------------------------Buttno2------------------------------------------------------
            $('#Button2').click(function (f) {
                var isValid = true;
                if ($.trim($("#PolicyName").val()) == '')
                {
                    isValid = false;
                    $("#PolicyName").css({
                        "border": "1px solid red",
                        "background": "#FFCECE"
                    });

                }
                else{
                    $("#PolicyName").css({
                        "border": "",
                        "background": ""
                    });

                }
                if ($.trim($("#Hash").val()) == ''){
                    isValid = false;
                    $("#Hash").css({
                        "border": "1px solid red",
                        "background": "#FFCECE"
                    });
                }
                else{
                    $("#Hash").css({
                        "border": "",
                        "background": ""
                    });

                }
                if ($.trim($("#SharedAccessKey").val()) == ''){
                    isValid = false;
                    $("#SharedAccessKey").css({
                        "border": "1px solid red",
                        "background": "#FFCECE"
                    });
                }
                else{
                    $("#SharedAccessKey").css({
                        "border": "",
                        "background": ""
                    });

                }
                if ($.trim($("#ticket").val()) == ''){
                    isValid = false;
                    $("#ticket").css({
                        "border": "1px solid red",
                        "background": "#FFCECE"
                    });

                }
                else {
                    $("#ticket").css({
                        "border": "",
                        "background": ""
                    });
                    }

                if (isValid == false) {
                    f.preventDefault();
                }
                else {
                    //var params = '{' + '"DestinationPrefix": "' + $('#DestinationPrefix').val()                     + '", "SourcePrefix": "' + $('#SourcePrefix').val() + '"' + '}';
                    var params = '{' + '"Action": "' + $("input[name=Action]:checked").val()                                    + '","Ticket": "' + $('#ticket').val()                                    + '","Hash": "' + $('#Hash').val()                                    + '","PolicyName": "' + $('#PolicyName').val()                                    + '","SharedAccessKey": "' + $('#SharedAccessKey').val() + '"' + '}';                    alert(params)
                    $.ajax({
                        type: "POST",
                        url: '<%= ResolveUrl("flowspecadd.aspx/Remove") %>',
                        data: params,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        failure: function (response) {
                            $('#lblmsg').text(respond.d);
                            alert(response.d);
                        }
                    });
                }
            });
        });   
        function OnSuccess(response) {
            $('#lblmsg').text(response.d);
        }

    </script>  <%--Form Validation--%>
    <script>
        $(document).ready(function () {
            
            $('#DestinationPrefix').tooltipster({
                contentAsHTML: true,
                content: 'IP destination address field.Default value 0.0.0.0/0 which is any.',
                position: 'right'
            });
            $('#DestinationPort').tooltipster({
                contentAsHTML: true,
                content: 'TCP or User Datagram Protocol (UDP) destination port field.<br>\
                          In place of the numeric value, you can specify one of the<br>\
                          following text synonyms (the port numbers are also listed):<br>\
                          afs (1483), bgp (179), biff (512), bootpc (68), bootps (67),<br>\
                          cmd (514), cvspserver (2401), dhcp (67), domain (53),<br>\
                          eklogin (2105), ekshell (2106), exec (512), finger (79),<br>\
                          ftp (21), ftp-data (20), http (80), https (443), ident (113),<br>imap (143), kerberos-sec (88), klogin (543), kpasswd (761),<br>krb-prop (754), krbupdate (760), kshell (544), ldap (389),<br>\
                          login (513), mobileip-agent (434), mobilip-mn (435),<br>\
                          msdp (639), netbios-dgm (138), netbios-ns (137), netbios-ssn (139),<br>\
                          nfsd (2049), nntp (119), ntalk (518), ntp (123), pop3 (110),<br>\
                          pptp (1723), printer (515), radacct (1813), radius (1812),<br>\
                          rip (520), rkinit (2108), smtp (25), snmp (161), snmptrap (162),<br>\
                          snpp (444), socks (1080), ssh (22), sunrpc (111), syslog (514),<br>\
                          tacacs-ds (65), talk (517), telnet (23), tftp (69), timed (525),<br>\
                          who (513), xdmcp (177), zephyr-clt (2103), or zephyr-hm (2104).',
                position: 'right'
            });
            $('#SourcePrefix').tooltipster({
                contentAsHTML: true,
                content: 'IP source address field.Default value 0.0.0.0/0 which is any.',
                position: 'right'
            });
            $('#SourcePort').tooltipster({
                contentAsHTML: true,
                content: 'In place of the numeric field, you can specify one of the <br>text synonyms listed under destination-port.',
                position: 'right'
            });
            $('#ttl').tooltipster({
                contentAsHTML: true,
                content: 'Time in seconds.Default is 86400 sec.',
                position: 'right'
            });
            $('#PolicyName').tooltipster({
                contentAsHTML: true,
                content: 'Name of the policy',
                position: 'right'
            });
            $('#ticket').tooltipster({
                contentAsHTML: true,
                content: 'Enter the ticket Number',
                position: 'right'
            });

            $('#Protocol').tooltipster({
                contentAsHTML: true,
                content: 'IP protocol field. In place of the numeric value, you can specify <br>\
                          one of the following text synonyms (the field values are also listed): <br>\
                          ah, egp (8), esp (50), gre (47), icmp (1), igmp (2), ipip (4), ipv6 (41),<br>\
                          ospf (89), pim (103), rsvp (46), tcp (6), or udp (17).',
                position: 'right'
            });
            $('#SharedAccessKey').tooltipster({
                contentAsHTML: true,
                content: 'Enter the Shared Access Key',
                position: 'right'
            });
            $('#Hash').tooltipster({
                contentAsHTML: true,
                content: 'Enter the Hash Value.',
                position: 'right'
            });
        });
    </script>  <%--Tooltip code--%>
    <script>   
        $(document).ready(function () {
            $("#hide").click(function () {
                $("#com").hide(2000);
                $("#proto").hide(2000);
                $("#time").hide(2000);
                $("#dest").hide(2000);
                $("#destp").hide(2000);
                $("#source").hide(2000);
                $("#sourcep").hide(2000);
                $("#Hash").show(2000);
                $("#treat").hide(2000);
                $("#dns").hide(2000);
                $("#Button2").show(0)
                $("#Button1").hide(0)
                document.getElementById("DestinationPrefix").value = "";
                document.getElementById("SourcePrefix").value = "";
                document.getElementById("DestinationPort").value = "";
                document.getElementById("SourcePort").value = "";
                document.getElementById("PolicyName").value = "";
                document.getElementById("SharedAccessKey").value = "";
                document.getElementById("Protocol").value = "";
                document.getElementById("TTL").value = "";
                document.getElementById("ticket").value = "";
                document.getElementById("comment").value = "";
                
            });
            $("#show").click(function () {
                $("#com").show(2000);
                $("#proto").show(2000);
                $("#time").show(2000);
                $("#dest").show(2000);
                $("#destp").show(2000);
                $("#source").show(2000);
                $("#sourcep").show(2000);
                $("#treat").show(2000);
                $("#dns").show(2000);
                $("#Button2").hide(0)
                $("#Button1").show(0)
                document.getElementById("PolicyName").value = "";
                document.getElementById("SharedAccessKey").value = "";
                document.getElementById("Hash").value = "";
                document.getElementById("ticket").value = "";

            });
        });
    </script>  <%--Hide code--%>
    <script>
        $("#hide").click(function () {
             $("#Hash").attr("disabled", false);         
        });
        $("#show").click(function () {
            $("#Hash").attr("disabled", true);
        });
    </script>  <%--Hide Hash text box--%>
</body>
</html>
