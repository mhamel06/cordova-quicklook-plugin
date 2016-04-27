cordova.define("cordova-quicklook-plugin.quicklook", function(require, exports, module) {
    var exec = require("cordova/exec"),
        channel = require("cordova/channel");

    var QuickLook = function(){

    };
    QuickLook.prototype.preview = function(path){
        exec(null, null, "QuickLookPlugin", "preview", [path]);
    };
    module.exports = new QuickLook();

});
