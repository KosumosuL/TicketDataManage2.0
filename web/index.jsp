<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="2-6">
  <link rel="icon" href="icon/ticket.ico">
  <title>工作票数据管理系统</title>
  <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
<div class="navbar-wrapper">
  <div class="container">

    <nav class="navbar navbar-inverse navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">工作票数据管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">总览</a></li>
            <li><a href="login.jsp">登录</a></li>
            <li><a href="register.jsp">注册</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">用户</li>
                <li><a href=".adminManage">查看</a></li>
                <li><a href="forget.jsp">修改密码</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">工作票</li>
                <li><a href=".userManage">查看</a></li>
                <li><a href=".filterStatis">统计分析</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>

  </div>
</div>


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="first-slide" src="bkimg/0.jpg" alt="First slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>用户管理</h1>
          <p>支持管理员对用户的各种操作</p>
          <p><a class="btn btn-lg btn-primary" href=".adminManage" role="button">进入</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="second-slide" src="bkimg/1.png" alt="Second slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>工作票管理</h1>
          <p>支持用户对工作票的各种操作</p>
          <p><a class="btn btn-lg btn-primary" href=".userManage" role="button">进入</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="third-slide" src="bkimg/2.jpg" alt="Third slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>统计分析</h1>
          <p>处理、分析工作票数据</p>
          <p><a class="btn btn-lg btn-primary" href=".filterStatis" role="button">进入</a></p>
        </div>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- /.carousel -->

<div class="container marketing">

  <!-- Three columns of text below the carousel -->
  <div class="row">
    <div class="col-lg-4">
      <img class="img-circle" src="bkimg/3.jpg" alt="Generic placeholder image" width="140" height="140">
      <h2>用户管理</h2>
      <p>管理员管理用户</p>
      <p><a class="btn btn-default" href=".adminManage" role="button">进入 &raquo;</a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4">
      <img class="img-circle" src="bkimg/4.jpg" alt="Generic placeholder image" width="140" height="140">
      <h2>工作票管理</h2>
      <p>用户管理工作票数据</p>
      <p><a class="btn btn-default" href=".userManage" role="button">进入 &raquo;</a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4">
      <img class="img-circle" src="bkimg/5.jpg" alt="Generic placeholder image" width="140" height="140">
      <h2>统计分析</h2>
      <p>处理、分析工作票数据</p>
      <p><a class="btn btn-default" href=".filterStatis" role="button">进入 &raquo;</a></p>
    </div><!-- /.col-lg-4 -->
  </div><!-- /.row -->


  <!-- START THE FEATURETTES -->

  <hr class="featurette-divider">

  <div class="row featurette">
    <div class="col-md-7">
      <h2 class="featurette-heading">用户管理 <span class="text-muted">方便快捷</span></h2>
      <p class="lead">支持管理员对用户的新增、删除、信息修改、权限分配等功能</p>
    </div>
    <div class="col-md-5">
      <img class="featurette-image img-responsive center-block" src="bkimg/6.jpg" alt="Generic placeholder image">
    </div>
  </div>

  <hr class="featurette-divider">

  <div class="row featurette">
    <div class="col-md-7 col-md-push-5">
      <h2 class="featurette-heading">工作票管理 <span class="text-muted">功能强大</span></h2>
      <p class="lead">支持用户对工作票的查看、修改、删除、新增、查询和导入导出功能</p>
    </div>
    <div class="col-md-5 col-md-pull-7">
      <img class="featurette-image img-responsive center-block" src="bkimg/7.jpg" alt="Generic placeholder image">
    </div>
  </div>

  <hr class="featurette-divider">

  <div class="row featurette">
    <div class="col-md-7">
      <h2 class="featurette-heading">统计分析 <span class="text-muted">必不可少</span></h2>
      <p class="lead">根据用户需求处理、分析工作票数据并可视化结果</p>
    </div>
    <div class="col-md-5">
      <img class="featurette-image img-responsive center-block" src="bkimg/8.jpg" alt="Generic placeholder image">
    </div>
  </div>

  <hr class="featurette-divider">
  <!-- FOOTER -->
  <footer>
    <p class="pull-right"><a href="#">回到顶部</a></p>
    <p><span class="glyphicon glyphicon-hand-right " aria-hidden="true"></span> 2-6组</p>
  </footer>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
