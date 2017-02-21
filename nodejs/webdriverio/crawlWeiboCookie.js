var webdriverio = require('webdriverio');

var secrets = require('./secrets');

var options = {
    desiredCapabilities: {
        browserName: 'chrome'
    }
};

var client = webdriverio.remote(options);

client
.init()
.url('http://weibo.com/login')
.waitForEnabled('[node-type="username"]', 30 * 1000)
.setValue('[node-type="username"]', secrets.username)
.setValue('[node-type="password"]', secrets.password)
.waitForVisible('.W_login_form [node-type="submitBtn"]', 30 * 1000)
.click('.W_login_form [node-type="submitBtn"]')
.waitFor('.tab_wrap', 30 * 1000)
.getCookie(function (err, cookies) {
    console.log(err, cookies);
});
