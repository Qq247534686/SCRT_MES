
//参数设置，若用默认值可以省略以下面代
toastr.options = {
    "closeButton": false, //是否显示关闭按钮
    "debug": false, //是否使用debug模式
    "positionClass": "toast-top-full-width",//弹出窗的位置
    "showDuration": "300",//显示的动画时间
    "hideDuration": "1000",//消失的动画时间
    "timeOut": "3000", //展现时间
    "extendedTimeOut": "1000",//加长展示时间
    "showEasing": "swing",//显示时的动画缓冲方式
    "hideEasing": "linear",//消失时的动画缓冲方式
    "showMethod": "fadeIn",//显示时的动画方式
    "hideMethod": "fadeOut" //消失时的动画方式
};
var enter_submit = function (field, e) {
    if (e.getKey() == e.ENTER) {
        submitForm();
    }
}

var submitForm = function () {
    toastr.clear();
    if (App.userName.getValue() == '' || App.userPassword.getValue() == '') {
        toastr.error("用户名密码不能为空");
        return;
    }
    //Ext.getBody().mask('正在登录', 'x-mask-loading');
    App.LoginForm.submit({
        success: function (form, action) {
           // Ext.getBody().unmask();//去除MASK 
            var isPass = Ext.util.JSON.decode(action.response.responseText).isPass
            if (isPass) {
                window.location.href = "/Home/Index";
            }
            else {
                App.userName.focus();
                App.LoginForm.reset();
                toastr.error("用户名或者密码错误");
              
            }
        
        }
    })

};
var resetForm = function () {
    App.userName.setValue('');
    App.userPassword.setValue('');
}