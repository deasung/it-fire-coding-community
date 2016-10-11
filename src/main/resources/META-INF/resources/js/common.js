var spinner = {

    spinner : null,

    start : function() {

        var opts = {
            lines: 11 // The number of lines to draw
            , length: 20 // The length of each line
            , width: 10 // The line thickness
            , radius: 21 // The radius of the inner circle
            , scale: 1 // Scales overall size of the spinner
            , corners: 1 // Corner roundness (0..1)
            , color: '#000' // #rgb or #rrggbb or array of colors
            , opacity: 0.25 // Opacity of the lines
            , rotate: 0 // The rotation offset
            , direction: 1 // 1: clockwise, -1: counterclockwise
            , speed: 1 // Rounds per second
            , trail: 60 // Afterglow percentage
            , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
            , zIndex: 2e9 // The z-index (defaults to 2000000000)
            , className: 'spinner' // The CSS class to assign to the spinner
            , top: '50%' // Top position relative to parent
            , left: '50%' // Left position relative to parent
            , shadow: false // Whether to render a shadow
            , hwaccel: false // Whether to use hardware acceleration
            , position: 'absolute' // Element positioning
        };

        var target = document.getElementById('SpinnerBox');
        spinner.spinner = new Spinner(opts).spin(target);
    },

    stop : function() {
        spinner.spinner.stop();
    }


}

var commonAjax = {
    url : "",
    type: "GET",
    dataType: "json",
    data: null,
    async: true, // true 비동기 , fasle 동기
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    ajaxDefaultCall : function (callback) {
        $.ajax({
            type: this.type,
            url: this.url,
            dataType: this.dataType,
            data: this.data,
            async: this.async,
            contentType: this.contentType,
            // Fetch the stored token from localStorage and set in the header
            success: callback,
            error:function(request,status,error){
                console.log(request);
                console.log(status);
                console.log(error);
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

            }

        });
    },
    ajaxCall : function (callback) {
        $.ajax({
            type: this.type,
            url: this.url,
            dataType: this.dataType,
            data: this.data,
            async: this.async,
            contentType: this.contentType,
            // Fetch the stored token from localStorage and set in the header
            headers: {"Authorization": "Bearer " + localStorage.getItem('it-authenticationToken')},
            success: callback,
            error:function(request,status,error){
                console.log(request);
                console.log(status);
                console.log(error);
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        });
    }
}


//로그인체크(로컬스토리지 값이 있는지 없는지 여부로 체크) true : 로그인됨 , false : 로그인상태가 아님
function loginCheck() {

    //localStorage.setItem("it-authenticationToken", data.id_token);
    var jwt_token = localStorage.getItem('it-authenticationToken');

    if(isEmpty(jwt_token) != true) {
        return true;
    } else {
        return false;
    }

}



//로그아웃
function logout() {

    commonAjax.url = "/api/user/logout";
    commonAjax.type = "GET";
    commonAjax.ajaxDefaultCall(function() {
        localStorage.clear();
        location.href = "/";
    });
}

//앞,뒤 공백제거
function trim(str)
{
    return str.replace(/(^\s*)|(\s*$)/gi, "");
}


/**
 * Null Checker
 * @param value
 * @returns {boolean}
 */
function isEmpty(value) {
    if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
        return true
    }else{
        return false
    }
}


/**
 * 임시로 준비중팝업
 */
function preparing(msg) {

    if(isEmpty(msg)) {
        alert("준비중입니다.");
    } else {
        alert(msg);
    }


}