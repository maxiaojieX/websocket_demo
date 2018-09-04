<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/font-awesome.css">
</head>

<body>
<div id="chat" style="width: 100%;height: 70%;overflow-x:hidden;overflow-y:scroll">

</div>
<div id="cc" style="width: 100%;height: 8%;background-color: #eee"></div>
<div style="width: 100%;height: 20%">
    <textarea placeholder="请输入内容" id="content" class="layui-textarea"></textarea>
</div>
<div style="position: absolute;right: 5px;bottom: 5px">
    <button class="layui-btn layui-btn-normal layui-btn-radius" id="sub">发送</button>
</div>
<script src="js/jQuery/jquery-2.2.3.min.js"></script>
<script src="layui/layui.all.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>



    //***************************************************************************
    var ws = new WebSocket("ws://119.27.161.212:8082");
    var accountName = "${name}";

    /**
     * 接收消息
     * @param json
     */
    ws.onmessage = function (json) {
        var newMessage = json.data;
        console.log(json.data)
        var message1 = newMessage.substring(0,newMessage.lastIndexOf("#"));
        var message2 = newMessage.substring(newMessage.lastIndexOf("#")+1);

        var html = '<p class="text-muted">'+ message2 + ': '+ message1 +'</p>';
        $(html).appendTo("#chat");

    }

    /**
     * 按钮发送消息
     */
    $("#sub").click(function () {
        var imessage = $("#content").val();
        var name = $("#name").val();
        if(name != null && name != "") {
            accountName = name;
        }
        var websocketMessage = imessage+"#"+accountName;
        $("#content").val("");
        ws.send(websocketMessage);
    });

    $(document).keypress(function(e) {
        var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        var imessage = $("#content").val();

        if (eCode == 13 && imessage != null && imessage != ""){

            var websocketMessage = imessage+"#"+accountName;
            $("#content").val("");
            ws.send(websocketMessage);

        }
    });

</script>
</body>
</html>
