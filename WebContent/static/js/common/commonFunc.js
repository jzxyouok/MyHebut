/*=======================================*/
/*	通用js                               */
/*	@author hx                           */
/*	2015年10月2日13:19:03                */
/*=======================================*/

/**
 * 将form表单序列化为json对象
 */
$.fn.serializeObject = function() {     
    var a,o,h,i,e;  
    a=this.serializeArray();  
    o={};  
    h=o.hasOwnProperty;  
    for(i=0;i<a.length;i++){  
        e=a[i];  
        if(!h.call(o,e.name)){  
            o[e.name]=e.value;  
        }  
    }  
    return o;     
}; 