<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<html>
  <head>
    <title>代码粘贴</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.sta                                     tic.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
var vl="a";
var vr="b";
$(document).ready(function(){
  var spotMax = 30;
  if($('div.spot').size() >= spotMax) {$(obj).hide();}
  $("input#add").click(function(){     addSpot(this, spotMax);
  });
  $('#file').change(function(){
  var selectedFile = document.getElementById("file").files[0];//获取读取的File对象
  var name = selectedFile.name;//读取选中文件的文件名
  var size=selectedFile.size;//读取选中文件的大小
   console.log("文件名:"+name+"大小："+size);
     var reader = new FileReader();//创建读取类
     reader.readAsText(selectedFile,"gb2312");//读取文件的内容，编码格式
     reader.onload = function(){
      $(mycode).val(this.result);//当读取完成之后会回调这个函数，然后此时文件的内容存储到了result中
    };

  });
});
function addSpot(obj, sm) {
vl=vl+"a";
vr=vr+"b";
$('div#spots').append(
    '<div class="spot">' +
    '<label for="name">用户增加的规则: </label>'+
    '<input type="text" class="form-control" name='+vl+'>'+
    '<label for="name">此条规则所对应的颜色: </label>'+
    '<input type="color" name='+vr+'>'+
    '<input type="button" class="remove btn-danger" value="Delete" /></div>')
  .find("input.remove").click(function(){
    $(this).parent().remove();
    $('input#add').show();
  });
  if($('div.spot').size() >= sm) {$(obj).hide();}
};
</script>
  </head>
  <body>
   <h1><p class="text-center text-primary">我们自己的代码分享工具</p></h1>
   <div class="row">
   <div class="col-md-4 col-md-offset-4">
    <form class ="form-horizontal" role="form" action="submit.jsp">
    <div class="form-group">
    <label class="control-label">name</label>
    <input type="text" class="form-control" name="name" placeholder="请输入名字"/>
    </div>
    <div class="form-group">
    <label for="name">code</label><input type="file" id="file"  value="上传文件"/>
    <textarea class="form-control" rows="12" id="mycode" name="code" ></textarea>
    </div>
    <div class="form-group">
    <input type="button" class="btn btn-primary" id="add" name="add" value="increase rules" /><br />
    </div>
    <div class="form-group">
    <div id="spots">
    </div>
    </div>
    <div class="form-group">
    <input type="submit" class="btn btn-primary" value="submit"></button>
    </div>
    </form>
   </div>
   </div>
   </body>
</html>
