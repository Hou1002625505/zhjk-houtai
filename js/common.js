/**
 * 服务器地址
 */
var  service_ip= 'http://test.physicalclub.com/crm';
//var service_ip='http://crm.physicalclub.com';

var formatDates = function (date) {
    var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? '0' + m : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
    var   hour=date.getHours();
    hour = hour < 10 ? ('0' + hour) : hour;  
    var   minute=date.getMinutes();
    minute = minute < 10 ? ('0' + minute) : minute;  
    var   second=date.getSeconds();
    second = second < 10 ? ('0' + second) : second;  
    return y + '-' + m + '-' + d +" "+hour+":"+minute+":"+second;
};

function formatDate(value,row, index){
	var newDate = new Date(value);
	var time = formatDates(newDate); 
	return time;
};


function formatValid(value,row,index){//
	if(value){
		return "启用";
	}else{
		return "<font color='red'>禁用</font>";
	}
};

function formatRelust(value,row,index){//
	if(value){
		return "成功";
	}else{
		return "<font color='red'>失败</font>";
	}
};

/**
 * 身份证验证
 * @param code 身份证号
 * @param cannull 非空验证 true 不验证 false 验证
 * @returns {Boolean}
 */
function IdentityCodeValid(code,cannull) { 
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;
    
    if (!cannull) {
		if (code == null || code == "" || code == undefined) {
			$.messager.alert('提示', "证件号码不能为空", 'info');
			return false; 
		}
	}
    
    if (!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)) {
        tip = "身份证号格式错误";
        pass = false;
    } else if (!city[code.substr(0,2)]) {
        tip = "地址编码错误";
        pass = false;
    } else {
        //18位身份证需要验证最后一位校验位
        if(code.length == 18){
            code = code.split('');
            //∑(ai×Wi)(mod 11)
            //加权因子
            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
            //校验位
            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++)
            {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if(parity[sum % 11] != code[17]){
                tip = "校验位错误";
                pass =false;
            }
        }
    }
    
    if(!pass){
    	$.messager.alert('提示', tip, 'info');
    }
    return pass;
}

/**
 * 手机号码验证
 * @param mobile 手机号
 * @param cannull 非空验证 true 不验证 false 验证
 * @returns {Boolean}
 */
function checkPhone(mobile,cannull){ 
	if (!cannull) {
		if (mobile == null || mobile == "" || mobile == undefined) {
			$.messager.alert('提示', "手机号码不能为空", 'info');
			return false; 
		}
	}
	
	if(!(/^1[34578]\d{9}$/.test(mobile))){ 
		$.messager.alert('提示', "手机号码格式不正确", 'info');
		return false; 
	}
	return true;
}
/**
 * 当前日期 上一个月
 * @param date
 * @returns {String}
 */
function getPreMonth(date) {
    var arr = date.split('-');
    var year = arr[0]; //获取当前日期的年份
    var month = arr[1]; //获取当前日期的月份
    var day = arr[2]; //获取当前日期的日
    var days = new Date(year, month, 0);
    days = days.getDate(); //获取当前日期中月的天数
    var year2 = year;
    var month2 = parseInt(month) - 1;
    if (month2 == 0) {
        year2 = parseInt(year2) - 1;
        month2 = 12;
    }
    var day2 = day;
    var days2 = new Date(year2, month2, 0);
    days2 = days2.getDate();
    if (day2 > days2) {
        day2 = days2;
    }
    if (month2 < 10) {
        month2 = '0' + month2;
    }
    var t2 = year2 + '-' + month2 + '-' + day2;
    return t2;
}

//图片路径
var ImgUrl= 'http://localhost:8081/crm/images/';