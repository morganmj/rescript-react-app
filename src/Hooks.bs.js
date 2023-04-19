// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Rxjs from "@nobleai/rescript-rxjs/src/Rxjs.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

function useObservableValue(source, initialValue) {
  var match = React.useState(function () {
        return initialValue;
      });
  var setValue = match[1];
  React.useEffect((function () {
          var subscription = source.subscribe(Rxjs.Observer.make((function (x) {
                      return Curry._1(setValue, (function (param) {
                                    return x;
                                  }));
                    }), (function (err) {
                      console.error(err);
                      
                    }), undefined, undefined));
          return (function (param) {
                    subscription.unsubscribe();
                    
                  });
        }), [
        source,
        setValue
      ]);
  return match[0];
}

export {
  useObservableValue ,
  
}
/* Rxjs Not a pure module */
