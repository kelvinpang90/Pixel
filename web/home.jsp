<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="三维动画,二维动画,创意策划,数字舞台,裸眼三维,立体投影,动画影视,特效,活动策划,广告,数字展厅,互动,交互,设计,影子舞,立体舞台,3DMapping,投影舞台,春晚舞台,数字动画,开场动画,表演视频,微电影,数字婚礼,户外活动,最牛开场舞,数字,演唱会,李宇春,舞台,影像骑士,VJ,DJ,夜场表演,酒吧投影,幻影成像,全息,虚拟现实,AR技术,全息幕,透明屏,初音演唱会,特效后期,影视制作,原创动画,世博会,多媒体,企业宣传,视频包装,投影表演,互动表演,互动游戏,汽车,发布会"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/index.css">
<title>Pixel</title>
</head>

<body class="top_bg" >
	<jsp:include page="include/top.jsp" flush="true"/>
	<div class="index_banner">
		<div class="index_banner">
		<style>
		.MainBox {
			Z-INDEX: 0;
			POSITION:relative;
			WIDTH: 100%;
			height:345px;
		}
		.MainBox .bannerBox .banner_list {
			POSITION: absolute; WIDTH: 100%; DISPLAY: none; HEIGHT: 345px; TOP: 0px; LEFT: 0px; z-index:0;
		}
		.MainBox .bannerBox .banner_list_1{
			BACKGROUND:url(../images/index_banner.jpg) center top no-repeat;
		}
		.MainBox .bannerBox .banner_list_2{
			BACKGROUND:url(../images/index_banner2.jpg) center top no-repeat;
		}
		.MainBox .bannerBox .banner_list_3{
			BACKGROUND:url(../images/index_banner3.jpg) center top no-repeat;
		}
		.banner_ico_warpper{ }
		.banner_ico_warpper ul{top:370px;left:480px;position:absolute;text-align:center;z-index:11; }
		.banner_ico_warpper ul li{background:url("../images/banner_a.jpg") no-repeat left  top; cursor:pointer;display:block;float:left;height:19px;text-indent:-9989px;width:19px; margin-right:15px; }
		.banner_ico_warpper ul li.ico_now{background:url("../images/banner_hover.jpg") no-repeat left  top; color:#FFFFFF;width:19px; height:19px; }
		
		
		</style>
		<Div style="width:1003px; position:relative; margin:0px auto; z-index:11;">
		  <DIV class=banner_ico_warpper>
			<UL class=banner_ico>
				<LI class="list_1 ico_now">1</LI>
				<LI class="list_1">2</LI>
				<LI class="list_1">3</LI>
			</UL>
		  </DIV>
		</Div>
		<DIV class=MainBox>
		  <DIV class=bannerBox>
			<DIV class="banner_list_1 banner_list" style="DISPLAY:block"></DIV>
			<DIV class="banner_list_2 banner_list" ></DIV>
			<DIV class="banner_list_3 banner_list" ></DIV>
		  </DIV>
		</DIV>
	</div>

        <SCRIPT type=text/javascript>
            $(document).ready(function() {
                var current = 0;
                var box = $('.banner_ico');
                var li = $('.banner_ico li');
                li.each(function(i){
                    $(this).data('index', i);
                });
                box.bind('mousemove',function(){		//小ico  绑定mouseover事件
                    clearInterval(autoID);		//移动到小ico列表时 清除自动图片切换
                });
                li.bind('mouseover', function(){		//小ico  绑定click事件	用来切换图片
                    var i = $(this).data('index');
                    current = i;		//定义小ico列表序号
                    $(this).addClass('ico_now');		//对应的显示下面的小文字
                    $(this).siblings().removeClass('ico_now');		//相邻的小文字消失
                    $('.banner_list').fadeOut(800).eq(i).fadeIn(800);		//大的banner图片切换
                    //p.hide().eq(i).show();		//下面相应的P链接切换
                });
                box.bind('mouseout',function(){		//小ico  绑定mouseout事件
                    autoID = setInterval(trig,4000);		//恢复图片自动切换
                });
                function trig(){	//定义图片自动切换方法
                    current = current+1 < 8 ? current+1 : 0;		//序号累加、当序号大于8时使它为0
                    li.eq(current).trigger('mouseover');	//定义模拟点击事件
                };
                var autoID = setInterval(trig,4000);		//每隔4秒调用自动点击方法


            });
        </SCRIPT>
	
<jsp:include page="include/bottom.jsp" flush="true"/>
    </div>
</body>
</html>
