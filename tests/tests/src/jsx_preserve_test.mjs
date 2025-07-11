// Generated by ReScript, PLEASE EDIT WITH CARE

import * as JsxRuntime from "react/jsx-runtime";

function Jsx_preserve_test$Icon(props) {
  return <strong />;
}

let Icon = {
  make: Jsx_preserve_test$Icon
};

let _single_element_child = <div>
  <h1>
    {"Hello, world!"}
  </h1>
</div>;

let _multiple_element_children = <div>
  <h1>
    {"Hello, world!"}
  </h1>
  <Jsx_preserve_test$Icon />
</div>;

let _single_element_fragment = <>
  {<input />}
</>;

let _multiple_element_fragment = <>
  <input
    type={"text"}
  />
  <input
    type={"number"}
  />
</>;

let _unary_element_with_props = <input
  className={"foo"}
  type={"text"}
/>;

let _container_element_with_props_and_children = <div
  className={"foo"}
  title={"foo"}
>
  {"Hello, world!"}
</div>;

let baseProps = {
  className: "foo",
  title: "foo"
};

let newrecord = {...baseProps};

let _unary_element_with_spread_props = <input
  {...newrecord} 
  type={"text"}
/>;

let newrecord$1 = {...baseProps};

let _container_with_spread_props = <div
  {...newrecord$1} 
  title={"barry"}
  className={"barry"}
>
  {"Hello, world!"}
  <input
    type={"text"}
  />
</div>;

let baseChildren = [
  <span>
    {"Hello, world!"}
  </span>,
  <span>
    {"Hello, world!"}
  </span>
];

let _container_with_spread_children = <div
  className={"barry"}
  title={"barry"}
>
  {baseChildren}
</div>;

let newrecord$2 = {...baseProps};

let _container_with_spread_props_and_children = <div
  {...newrecord$2} 
  title={"barry"}
  className={"barry"}
>
  {baseChildren}
</div>;

let newrecord$3 = {...baseProps};

let _unary_element_with_spread_props_keyed = <input
  key={"barry-key"} 
  {...newrecord$3} 
  type={"text"}
/>;

let newrecord$4 = {...baseProps};

let _container_with_spread_props_keyed = <div
  key={"barry-key"} 
  {...newrecord$4} 
  title={"barry"}
  className={"barry"}
>
  {"Hello, world!"}
  <input
    type={"text"}
  />
</div>;

let _unary_element_with_only_spread_props = <input
  {...baseProps} />;

function QueryClientProvider(props) { return props.children }
;

let A = {};

function Jsx_preserve_test$B(props) {
  return <p>
    {"Hello, world!"}
  </p>;
}

let B = {
  make: Jsx_preserve_test$B
};

let _external_component_with_children = <QueryClientProvider>
  <strong />
  <Jsx_preserve_test$B />
</QueryClientProvider>;

function Jsx_preserve_test$MyWeirdComponent(props) {
  return <p>
    {"foo"}
    {props.MyWeirdProp}
  </p>;
}

let MyWeirdComponent = {
  make: Jsx_preserve_test$MyWeirdComponent
};

let _escaped_jsx_prop = <Jsx_preserve_test$MyWeirdComponent
  MyWeirdProp={"bar"}
/>;

let _large_component = <div
  className={"bar"}
  tabIndex={1}
  title={"foo"}
  onClick={param => {}}
  onMouseDown={param => {}}
>
  <p
    className={"bar"}
    tabIndex={1}
    title={"foo"}
    onClick={param => {}}
    onMouseDown={param => {}}
  >
    {"Hello, world!"}
  </p>
  <strong
    className={"bar"}
    tabIndex={1}
    title={"foo"}
    onClick={param => {}}
    onMouseDown={param => {}}
  >
    {"Hello, world!"}
  </strong>
  <p>
    {5}
  </p>
</div>;

function Jsx_preserve_test$ComponentWithOptionalProps(props) {
  return null;
}

let ComponentWithOptionalProps = {
  make: Jsx_preserve_test$ComponentWithOptionalProps
};

let _optional_props = <Jsx_preserve_test$ComponentWithOptionalProps
  i={1}
  s={"test"}
  element={<div />}
/>;

let _props_with_hyphen = <label
  aria-label={"close sidebar"}
  data-testid={"test"}
/>;

let React = {};

let _fragment = <Fragment>
  {"Hello, world!"}
</Fragment>;

export {
  Icon,
  _single_element_child,
  _multiple_element_children,
  _single_element_fragment,
  _multiple_element_fragment,
  _unary_element_with_props,
  _container_element_with_props_and_children,
  baseProps,
  _unary_element_with_spread_props,
  _container_with_spread_props,
  baseChildren,
  _container_with_spread_children,
  _container_with_spread_props_and_children,
  _unary_element_with_spread_props_keyed,
  _container_with_spread_props_keyed,
  _unary_element_with_only_spread_props,
  A,
  B,
  _external_component_with_children,
  MyWeirdComponent,
  _escaped_jsx_prop,
  _large_component,
  ComponentWithOptionalProps,
  _optional_props,
  _props_with_hyphen,
  React,
  _fragment,
}
/* _single_element_child Not a pure module */
