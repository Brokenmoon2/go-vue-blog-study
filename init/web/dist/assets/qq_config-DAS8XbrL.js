import{_ as o}from"./gvb_config.vue_vue_type_style_index_0_lang-DJJDRmuE.js";import{d as s,o as l,c as n,w as t,e as c,f as i,r as m}from"./index-C_OMfqPK.js";import"./settings_api-CrrBrsAM.js";const h=s({__name:"qq_config",setup(d){const a=[{label:"appID",field:"app_id",rules:[{required:!0,message:"请输入appID"}],placeholder:"appID"},{label:"appKey",iptType:"password",field:"key",rules:[{required:!0,message:"请输入appKey"}],placeholder:"appKey"},{label:"回调地址",field:"redirect",rules:[{required:!0,message:"请输入回调地址"}],placeholder:"回调地址"}],p=[{title:"appID，appKey",abs:"QQ互联中去申请",content:`
<p>先去qq互联（<a href="https://connect.qq.com/" target="_blank">https://connect.qq.com/</a>）进行实名认证</p>
<p>然后创建一个网站应用，等待审核</p>
<p>审核成功之后，就会有app ID，APP Key</p>
<p>
<img src="https://image.fengfengzhidao.com/pic/20230930170351.png" alt="">
</p>
`},{title:"回调地址",abs:"qq登录成功之后，回调的地址",content:""}];return(q,e)=>{const r=m("a-alert");return l(),n(o,{title:"QQ配置",name:"qq","left-width":45,"right-with":55,"label-span":4,"wrapper-span":20,column:a,"help-data":p},{alert:t(()=>[c(r,{style:{"margin-top":"20px"}},{default:t(()=>e[0]||(e[0]=[i("配置qq代登录之后，登录页面点击qq才会有反应")])),_:1})]),_:1})}}});export{h as default};
