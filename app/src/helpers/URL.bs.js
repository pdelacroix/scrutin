// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Js_array from "rescript/lib/es6/js_array.js";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as ReactNative from "react-native";

function currentHash(param) {
  if (ReactNative.Platform.OS === "web") {
    return window.location.hash;
  } else {
    return "";
  }
}

function arrayToList(a) {
  var _i = a.length - 1 | 0;
  var _res = /* [] */0;
  while(true) {
    var res = _res;
    var i = _i;
    if (i < 0) {
      return res;
    }
    _res = {
      hd: Belt_Array.getExn(a, i),
      tl: res
    };
    _i = i - 1 | 0;
    continue ;
  };
}

function getAndThen(f) {
  ReactNative.Linking.getInitialURL().then(function (res) {
        var sUrl = new URL(Belt_Option.getWithDefault(res === null ? undefined : Caml_option.some(res), "")).pathname;
        var sUrl$1 = Js_string.sliceToEnd(1, sUrl);
        var match = sUrl$1[sUrl$1.length - 1 | 0];
        var sUrl$2 = match === "/" ? Js_string.slice(0, -1, sUrl$1) : sUrl$1;
        return Curry._1(f, arrayToList(Js_array.filter((function (item) {
                              return item.length !== 0;
                            }), Js_string.split("/", sUrl$2))));
      });
}

var _setUrlPathname = (function(pathname) { window.history.pushState({}, null, pathname); });

function setUrlPathname(str) {
  if (ReactNative.Platform.OS === "web") {
    return _setUrlPathname(str);
  }
  
}

function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}
;

function getSearchParameter(name) {
  return (getParameterByName(name));
}

export {
  currentHash ,
  arrayToList ,
  getAndThen ,
  _setUrlPathname ,
  setUrlPathname ,
  getSearchParameter ,
}
/*  Not a pure module */
