

import * as Caml_option from "melange/lib/es6/caml_option.mjs";
import * as ReactNative from "react-native";
import * as Text$ReactNative from "../components/Text.bs.js";
import * as View$ReactNative from "../components/View.bs.js";
import * as Image$ReactNative from "../components/Image.bs.js";
import * as FlatList$ReactNative from "../components/FlatList.bs.js";
import * as ScrollView$ReactNative from "../components/ScrollView.bs.js";
import * as SectionList$ReactNative from "../components/SectionList.bs.js";

var Animation = {};

function ValueAnimations(Val) {
  var Decay = {};
  var Spring = {};
  var Timing = {};
  return {
          Decay: Decay,
          Spring: Spring,
          Timing: Timing
        };
}

var Interpolation = {};

function interpolate(prim0, prim1) {
  return prim0.interpolate(prim1);
}

var ValueOperations = {
  interpolate: interpolate
};

function ValueMethods(Val) {
  var Decay = {};
  var Spring = {};
  var Timing = {};
  return {
          Decay: Decay,
          Spring: Spring,
          Timing: Timing
        };
}

var Decay = {};

var Spring = {};

var Timing = {};

var Value = {
  Decay: Decay,
  Spring: Spring,
  Timing: Timing,
  interpolate: interpolate
};

var Decay$1 = {};

var Spring$1 = {};

var Timing$1 = {};

var ValueXY = {
  Decay: Decay$1,
  Spring: Spring$1,
  Timing: Timing$1
};

var Decay$2 = {};

var Spring$2 = {};

var Timing$2 = {};

var Color = {
  Decay: Decay$2,
  Spring: Spring$2,
  Timing: Timing$2
};

function timing(prim0, prim1) {
  return ReactNative.Animated.timing(prim0, prim1);
}

function spring(prim0, prim1) {
  return ReactNative.Animated.spring(prim0, prim1);
}

function decay(prim0, prim1) {
  return ReactNative.Animated.decay(prim0, prim1);
}

function start(prim0, prim1, prim2) {
  prim0.start(prim1 !== undefined ? Caml_option.valFromOption(prim1) : undefined);
}

function stop(prim) {
  prim.stop();
}

function reset(prim) {
  prim.reset();
}

var StyleProp = {};

var make = ReactNative.Animated.createAnimatedComponent(ReactNative.FlatList);

var FlatList = {
  make: make
};

var make$1 = ReactNative.Animated.createAnimatedComponent(ReactNative.Image);

var $$Image = {
  Source: Image$ReactNative.Source,
  ImageLoadEvent: Image$ReactNative.ImageLoadEvent,
  $$ErrorEvent: Image$ReactNative.$$ErrorEvent,
  $$ProgressEvent: Image$ReactNative.$$ProgressEvent,
  make: make$1
};

var make$2 = ReactNative.Animated.createAnimatedComponent(ReactNative.ScrollView);

var ScrollView = {
  make: make$2
};

var make$3 = ReactNative.Animated.createAnimatedComponent(ReactNative.SectionList);

var SectionList = {
  make: make$3
};

var make$4 = ReactNative.Animated.createAnimatedComponent(ReactNative.Text);

var $$Text = {
  make: make$4
};

var make$5 = ReactNative.Animated.createAnimatedComponent(ReactNative.View);

var View = {
  View: View$ReactNative.View,
  make: make$5
};

export {
  Animation ,
  ValueAnimations ,
  Interpolation ,
  ValueOperations ,
  ValueMethods ,
  Value ,
  ValueXY ,
  Color ,
  timing ,
  spring ,
  decay ,
  start ,
  stop ,
  reset ,
  StyleProp ,
  FlatList ,
  $$Image ,
  ScrollView ,
  SectionList ,
  $$Text ,
  View ,
}
/* make Not a pure module */
