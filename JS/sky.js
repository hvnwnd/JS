console.log('Testtest')

function getMobileOperatingSystem() {
    var userAgent = navigator.userAgent;

    // iOS detection from: http://stackoverflow.com/a/9039885/177710
    if (/iPad|iPhone|iPod/.test(userAgent)) {
        return "iOS";
    }

    return "unknown";
}

//OC调用JS的方法列表
function alertMobile() {
    document.getElementById('mobile').innerHTML = '不带参数'
}

function alertName(msg) {
    //有一个参数
    document.getElementById('name').innerHTML = '有一个参数 :' + msg
}

function alertSendMsg(num,msg) {
    //有两个参数
    document.getElementById('msg').innerHTML = '有两个参数:' + num + ',' + msg + '!!'
}

//JS响应方法列表
function btnClick1() {
    console.log('TESTIOS 1', window.webkit.messageHandlers.showPg);


    if (window.chatInterface) {
        
        window.chatInterface.postMessage(null)
    } else {
        window.webkit.messageHandlers.chatInterface.postMessage(null)
    }
}

function btnClick2() {
    window.webkit.messageHandlers.showName.postMessage('有一个参数')
}

function btnClick3() {
    window.webkit.messageHandlers.showSendMsg.postMessage(['两个参数One', '两个参数Two'])
}

