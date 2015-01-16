var express = require('express'),
    passport = require('passport'),
    passport_sina = require('passport-sina');

passport.serializeUser(function(user, callback) {
    callback(null, user);
});

passport.deserializeUser(function(obj, callback) {
    callback(null, obj);
});

passport.use(new passport_sina(require('./secrets'),
    function(accessToken, refreshToken, profile, callback) {
        console.log('auth success, accessToken:', accessToken, 'refreshToken:', refreshToken, 'profile:', profile);
        process.nextTick(function () {
            return callback(null, profile);
        });
    })
);

var app = express();
app.use(require('morgan')('dev'));
// required for `state` support
app.use(require('cookie-session')({ secret: 'a keyboard cat' }));
// initialize for express
app.use(passport.initialize());
// passport session for express
app.use(passport.session());

if ('development' === app.get('env')) {
    app.use(require('errorhandler')());
}

// routes
app.get('/', function(req, res) {
    if (req.isAuthenticated()) {
        res.json(req.user);
    } else {
        res.send('<a href="/auth/sina">login</a>');
    }
});
app.get('/logout', function(req, res) {
    req.session = null;
    res.redirect('/');
});
// Auth
app.get('/auth/sina', passport.authenticate('sina'));
// Verify Auth
app.get('/auth/sina/callback', function (req, res, next) {
    console.log('callback, query:', req.query);
    next();
});
app.get('/auth/sina/callback', passport.authenticate('sina', {
    successRedirect: '/auth/sina/success',
    failureRedirect: '/auth/sina/fail'
}));

app.get('/auth/sina/success', function (req, res, next) {
    console.log('success, query:', req.query, 'user:', req.user);
    res.send('<p>success</p><a href="/">home</a><p>' + JSON.stringify(req.user) + '</p>');
});

app.get('/auth/sina/fail', function (req, res, next) {
    console.log('fail, query:', req.query);
    res.send('<p>fail</p><a href="/">home</a>');
});

app.get('/fanservice/verify', function (req, res, next) {
    console.log('fanservice verify, query:', req.query);
    res.send(req.query.echostr);
});

var server = app.listen(parseInt(process.env.NODE_PORT, 10) || 3000, function() {
  console.log('Listening on port %d', server.address().port);
});
