// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Dimension from "./helpers/Dimension.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as ReactNative from "react-native";
import * as Webapi__Fetch from "rescript-webapi/src/Webapi/Webapi__Fetch.bs.js";

function post(url, json) {
  var headers = {
    "Content-Type": "application/json"
  };
  var body = JSON.stringify(json);
  return fetch(url, Webapi__Fetch.RequestInit.make(/* Post */2, Caml_option.some(headers), Caml_option.some(body), undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined)(undefined));
}

var styles = ReactNative.StyleSheet.create({
      title: {
        color: "black",
        fontSize: 20.0,
        textAlign: "center"
      },
      subtitle: {
        textAlign: "center"
      },
      separator: {
        height: 20.0
      },
      row: {
        flexDirection: "row",
        padding: 10.0
      },
      col: {
        flex: 1.0,
        padding: 5.0
      },
      smallButton: {
        height: 15.0
      },
      "margin-x": {
        marginLeft: 15.0,
        marginRight: 15.0
      },
      "pad-left": {
        marginLeft: 40.0
      },
      modal: {
        backgroundColor: "white",
        margin: 10.0,
        padding: 10.0
      },
      layout: ReactNative.Platform.OS === "web" && Dimension.width(undefined) > 800 ? ({
            alignSelf: "center",
            width: 800.0
          }) : ({}),
      center: {
        alignSelf: "center"
      },
      green: {
        color: "green"
      },
      red: {
        color: "red"
      }
    });

function X$Row(Props) {
  var children = Props.children;
  return React.createElement(ReactNative.View, {
              style: styles.row,
              children: children
            });
}

var Row = {
  make: X$Row
};

function X$Col(Props) {
  var children = Props.children;
  return React.createElement(ReactNative.View, {
              style: styles.col,
              children: children
            });
}

var Col = {
  make: X$Col
};

var SegmentedButtons = {};

function ev($$event) {
  return $$event.target.value;
}

function prevent(f, e) {
  e.preventDefault();
  return Curry._1(f, e);
}

var isKeyEnter = (function(key) { return key.key == "Enter" });

export {
  post ,
  styles ,
  Row ,
  Col ,
  SegmentedButtons ,
  ev ,
  prevent ,
  isKeyEnter ,
}
/* styles Not a pure module */