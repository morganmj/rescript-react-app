// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function Button(Props) {
  var children = Props.children;
  var _type = Props.type;
  var style = _type ? ({
        backgroundColor: "red"
      }) : ({
        backgroundColor: "green"
      });
  return React.createElement("button", {
              className: "btn",
              style: style
            }, children);
}

var make = Button;

export {
  make ,
  
}
/* react Not a pure module */
