var exec = require('cordova/exec');

//exports.coolMethod = function (arg0, success, error) {
//    exec(success, error, 'IMMapPlugin', 'coolMethod', [arg0]);
//};

exports.openMap = function (arg0, success, error) {
    exec(success, error, "IMMapPlugin", "openMap", [arg0]);
};
