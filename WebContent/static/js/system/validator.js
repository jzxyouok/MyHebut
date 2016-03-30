/*
 * 注册检验规则
 * 个人设置检验规则
 */
$(document).ready(function() {
    $('#registerForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userName: {
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '用户名长度至少6位,至多20位'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '用户名必须是字母,数字和下划线组合'
                    }
                }
            },
		    userPass: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 16,
                        message: '密码长度至少6位,至多16位'
                    },
                    identical: {
                        field: 'confirmUserPass',
                        message: '两次输入的密码不匹配'
                    }
                }
            },
            confirmUserPass: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 16,
                        message: '密码长度至少6位,至多16位'
                    },
                    identical: {
                        field: 'userPass',
                        message: '两次输入的密码不匹配'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '请输入合法邮箱地址'
                    }
                }
            },	           
        }
    });
    
    $('#settingForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nickName: {
                validators: {
                    notEmpty: {
                        message: '昵称不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 8,
                        message: '昵称长度至少2位,至多8位'
                    },
                    regexp: {
                        regexp: /^[\u4E00-\u9FA5a-zA-Z0-9_]+$/,
                        message: '昵称必须是汉字,字母,数字和下划线组合'
	                }
                }
            },
        }
    });
    
    $('#randomForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            questionType: {
            	validators: {
                    notEmpty: {
                    	message: '请选择题目类型'
                    }
                }
            },
            sections: {
            	validators: {
                	notEmpty: {
                		  message: '请至少选择一个章节'
                	}
            	}
       	 	}
        }
    });
    
    $('#alterPassForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	 oldPass: {
                 validators: {
                     notEmpty: {
                         message: '原密码不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 16,
                         message: '密码长度至少6位,至多16位'
                     }
                 }
             },
 		    newPass: {
                 validators: {
                     notEmpty: {
                         message: '密码不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 16,
                         message: '密码长度至少6位,至多16位'
                     },
                     identical: {
                         field: 'confirmPass',
                         message: '两次输入的密码不匹配'
                     }
                 }
             },
             confirmPass: {
                 validators: {
                     notEmpty: {
                         message: '密码不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 16,
                         message: '密码长度至少6位,至多16位'
                     },
                     identical: {
                         field: 'newPass',
                         message: '两次输入的密码不匹配'
                     }
                 }
             },
        }
    });
});