/**
 * 
 */
document.write('<h1>Hello TonyWoo</h1>3333');
var $=require("../../node_modules/jquery/dist/jquery.min.js");

//**加载css*//
require("../css/index.css");
var stuJson=require("json!./stu.json");
//var stuJson=require("./stu.json");

var txt='my name is '+stuJson.name;

$('#myid').html('hello world!!!'+'<P>'+txt+'</P>');

define(["json!./stu.json"],function(){
    console.log("log日志:"+txt);
})