
var XMLHttpReq;
//创建XMLHttpRequest对象
function createXMLHttpRequest(){
    if(window.XMLHttpRequest){     //其他浏览器
        XMLHttpReq = new XMLHttpRequest();
    }
    else if (window.ActiveXObject){  //IE浏览器
        try{
            XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
        }catch(e){
            try{
                XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
            }catch(e){}
        }
    }
}

//发送请求函数
function sendRequest(){
    createXMLHttpRequest();
    var XM=document.getElementById("username").value;
    var url = "ajax.jsp?XM="+XM;
    XMLHttpReq.open("GET", url, true);
    XMLHttpReq.send(null);         //发送请求
    XMLHttpReq.onreadystatechange = processResponse;     //指定响应函数
}

//处理返回信息函数
function processResponse(){
    if (XMLHttpReq.readyState == 4) {     //判断对象状态
        if (XMLHttpReq.status == 200) {      //信息已经成功返回，开始处理信息
            document.getElementById("count").innerHTML = XMLHttpReq.responseText;
        } else {      //页面不正常
            window.alert("您所请求的页面有异常。");
        }  
    }  
}