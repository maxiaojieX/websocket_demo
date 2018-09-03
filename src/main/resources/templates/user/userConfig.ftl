<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="shortcut icon" href="img/SSS.ico"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/home">返回</a>
                        <a class="navbar-brand" style="float: right" id="saveForm">保存</a>
                    </div>
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <nav class="navbar navbar-default navbar-inverse navbar-fixed-bottom" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                <#--<a class="navbar-brand" href="#">最近</a>-->
                <#--<div class="test" style="position: relative;left: 27%;display: inline-block"">-->
                <#--<a class="navbar-brand" href="/friends" id="friends">好友</a>-->
                <#--</div>-->
                    <a class="navbar-brand" href="/friends" id="friends">好友</a>
                    <a class="navbar-brand" style="float: right" href="/home" >Home</a>
                </div>
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <div class="row clearfix" style="margin-top: 50px;margin-bottom: 50px; >

        <div class="col-md-12 column">

    <ul class="list-group">
        <li class="list-group-item">
            <div>
                <img src="img/${sex}" alt="..." class="img-circle my" style="width: 50px">
                <h3 style="display: inline-block;font-weight: bold"> &nbsp;${adminConfig.nickName}</h3>
            </div>
            <br>
        </li>
    </ul>
<div class="container">
    <form class="form-horizontal" action="/saveConfig" id="configForm" method="post">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="nickName" id="inputEmail3" value="${adminConfig.nickName}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">签名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="autograph" id="inputPassword3" value="${adminConfig.autograph}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword4" class="col-sm-2 control-label">欢迎语</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="welcoming" id="inputPassword4" value="${adminConfig.welcoming}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword4" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <select class="form-control" name="sex">
                    <option value="1" <#if adminConfig.sex==1>selected</#if>>男</option>
                    <option value="0" <#if adminConfig.sex==0>selected</#if>>女</option>
                </select>
            </div>
        </div>

    </form>
</div>
        </div>

    </div>

</div>
<script src="js/jQuery/jquery-2.2.3.min.js"></script>
<script src="js/layer/layer.js"></script>
<script>
    $(function () {

          $("#saveForm").click(function () {
              $.post("/saveConfig",$("#configForm").serialize()).done(function (json) {
                  if(json == "SUCCESS") {
                      layer.msg("修改成功");
                      setTimeout(function(){history.go(0)},800);
                  }else {
                      layer.msg("修改失败，请稍后再试");
                  }
              });
          });
    });
</script>
</body>
</html>