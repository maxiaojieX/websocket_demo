<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/font-awesome.css">
</head>

<body>
<#--<div id="chat" style="width: 100%;height: 500px;background-color: #999999">-->

<#--</div>-->
<#--<div>-->
    <#--请输入你的名字:<input type="text" id="name">-->
    <#--<input type="text" id="content">-->
    <#--<button id="sub">发送</button>-->
<#--</div>-->
<br><br>
<button id="test" class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">房间一</button>


<div></div>
<script src="js/jQuery/jquery-2.2.3.min.js"></script>
<script src="layui/layui.all.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>

    function go(na) {
        setTimeout(function () {
            layer.open({
                type: 2,
                title: na,
                shadeClose: true,
                shade: false,
                min: true,
                area: ['686px', '499px'],
                content: '/content?name='+na
            });
        },2000)

    }


    $("#test").click(function () {



        layer.confirm('<input type="text" id="name" name="title" lay-verify="title" autocomplete="off" placeholder="请输入昵称" class="layui-input">', {
            btn: ['确定','取消']
        }, function(){
            var na = $("#name").val();
            go(na);
//            window.parent.location.reload();
            layer.close();
        });



    });


    //***************************************************************************
//    var ws = new WebSocket("ws://119.27.161.212:8082");
//    var accountName = "匿名";
//
//    /**
//     * 接收消息
//     * @param json
//     */
//    ws.onmessage = function (json) {
//        var newMessage = json.data;
//        console.log(json.data)
//        var message1 = newMessage.substring(0,newMessage.lastIndexOf("#"));
//        var message2 = newMessage.substring(newMessage.lastIndexOf("#")+1);
//
//        var html = '<p class="text-muted">'+ message2 + ': '+ message1 +'</p>';
//        $(html).appendTo("#chat");
//
//    }
//
//    /**
//     * 按钮发送消息
//     */
//    $("#sub").click(function () {
//        var imessage = $("#content").val();
//        var name = $("#name").val();
//        if(name != null && name != "") {
//            accountName = name;
//        }
//        var websocketMessage = imessage+"#"+accountName;
//        $("#content").val("");
//        ws.send(websocketMessage);
//    });
//
//    $(document).keypress(function(e) {
//        var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
//        var imessage = $("#content").val();
//
//        if (eCode == 13 && imessage != null && imessage != ""){
//
//            var websocketMessage = imessage+"#"+accountName;
//            $("#content").val("");
//            ws.send(websocketMessage);
//
//        }
//    });

</script>
</body>
</html>
