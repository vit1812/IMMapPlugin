var exec = require('cordova/exec');

exports.openMap = function () {
    exec(function(msg) {}, function(err) {}, "IMMapPlugin", "openMap", []);
};

exports.openMapWithAirportCode = function (arg0) {
    exec(function(msg) {}, function(err) {}, "IMMapPlugin", "openMapWithAirportCode", [arg0]);
};

exports.setCurrentLanguageCode = function (arg0) {
    exec(function(msg) {}, function(err) {}, "IMMapPlugin", "setCurrentLanguageCode", [arg0]);
};
