// JavaScript Document
//支持Enter键登录
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}

    	$(function(){
			//提交表单
			$('#submit_btn').click(function(){
				show_loading();
				var myReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮件正则
				if($('#userName').val() == ''){
					show_err_msg('用户名还没填呢！');	
					$('#userName').focus();
				}else if($('#passWord').val() == ''){
					show_err_msg('密码还没填呢！');
					$('#passWord').focus();
				}else if($('#jcaptchaCode').val() == ''){
					show_err_msg('验证码还没填呢！');
					$('#jcaptchaCode').focus();
				}else{
					//ajax提交表单，#login_form为表单的ID。 如：$('#login_form').ajaxSubmit(function(data) { ... });
					show_msg('登录成功咯！  正在为您跳转...','/');
					//$('#login_form').ajaxSubmit(function(data) { ... });
					document.getElementById("login_form").submit();
				}
			});
});
    	
    

    	function isShowCaptcha() {
    		$.ajax({
    			url : "rest/user/isShowCaptcha",
    			type : "GET",
    			dataType : "json",
    			cache : false,
    			async : false,
    			timeout : 5000,
    			success : function(json) {
    				if (1 == json) {
    					$("#co")[0].style.display = '';
    				}
    			},
    			error : function(xhr, status) {
    				//alert("errdeor");
    			}
    		});
    	}