/* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

type synthetic<'a>

module MakeEventWithType = (
  Type: {
    type t
  },
) => {
  @get external bubbles: Type.t => bool = "bubbles"
  @get external cancelable: Type.t => bool = "cancelable"
  @get external currentTarget: Type.t => {..} = "currentTarget"

  /* Should return Dom.eventTarget */
  @get external defaultPrevented: Type.t => bool = "defaultPrevented"
  @get external eventPhase: Type.t => int = "eventPhase"
  @get external isTrusted: Type.t => bool = "isTrusted"
  @get external nativeEvent: Type.t => {..} = "nativeEvent"

  /* Should return Dom.event */
  @send external preventDefault: Type.t => unit = "preventDefault"

  @send external isDefaultPrevented: Type.t => bool = "isDefaultPrevented"

  @send external stopPropagation: Type.t => unit = "stopPropagation"

  @send external isPropagationStopped: Type.t => bool = "isPropagationStopped"

  @get external target: Type.t => {..} = "target"

  /* Should return Dom.eventTarget */
  @get external timeStamp: Type.t => float = "timeStamp"
  @get external type_: Type.t => string = "type"
  @send external persist: Type.t => unit = "persist"
}

module Synthetic = {
  type tag
  type t = synthetic<tag>

  @get external bubbles: synthetic<'a> => bool = "bubbles"
  @get external cancelable: synthetic<'a> => bool = "cancelable"
  @get external currentTarget: synthetic<'a> => {..} = "currentTarget"
  /* Should return Dom.eventTarget */

  @get external defaultPrevented: synthetic<'a> => bool = "defaultPrevented"

  @get external eventPhase: synthetic<'a> => int = "eventPhase"
  @get external isTrusted: synthetic<'a> => bool = "isTrusted"
  @get external nativeEvent: synthetic<'a> => {..} = "nativeEvent"

  /* Should return Dom.event */
  @send external preventDefault: synthetic<'a> => unit = "preventDefault"

  @send external isDefaultPrevented: synthetic<'a> => bool = "isDefaultPrevented"

  @send external stopPropagation: synthetic<'a> => unit = "stopPropagation"

  @send external isPropagationStopped: synthetic<'a> => bool = "isPropagationStopped"

  @get external target: synthetic<'a> => {..} = "target"

  /* Should return Dom.eventTarget */
  @get external timeStamp: synthetic<'a> => float = "timeStamp"
  @get external type_: synthetic<'a> => string = "type"
  @send external persist: synthetic<'a> => unit = "persist"
}

/* Cast any event type to the general synthetic type. This is safe, since synthetic is more general */
external toSyntheticEvent: synthetic<'a> => Synthetic.t = "%identity"

module Clipboard = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external clipboardData: t => {..} = "clipboardData"
  /* Should return Dom.dataTransfer */
}

module Composition = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external data: t => string = "data"
}

module Keyboard = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external altKey: t => bool = "altKey"
  @get external charCode: t => int = "charCode"
  @get external ctrlKey: t => bool = "ctrlKey"

  @send external getModifierState: (t, string) => bool = "getModifierState"

  @get external key: t => string = "key"
  @get external keyCode: t => int = "keyCode"
  @get external locale: t => string = "locale"
  @get external location: t => int = "location"
  @get external metaKey: t => bool = "metaKey"
  @get external repeat: t => bool = "repeat"
  @get external shiftKey: t => bool = "shiftKey"
  @get external which: t => int = "which"
}

module Focus = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get @return(nullable) external relatedTarget: t => option<{..}> = "relatedTarget"
  /* Should return Dom.eventTarget */
}

module Form = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})
}

module Mouse = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external altKey: t => bool = "altKey"
  @get external button: t => int = "button"
  @get external buttons: t => int = "buttons"
  @get external clientX: t => int = "clientX"
  @get external clientY: t => int = "clientY"
  @get external ctrlKey: t => bool = "ctrlKey"

  @get external getModifierState: (t => string) => bool = "getModifierState"

  @get external metaKey: t => bool = "metaKey"
  @get external movementX: t => int = "movementX"
  @get external movementY: t => int = "movementY"
  @get external pageX: t => int = "pageX"
  @get external pageY: t => int = "pageY"

  @get @return(nullable) external relatedTarget: t => option<{..}> = "relatedTarget"

  /* Should return Dom.eventTarget */
  @get external screenX: t => int = "screenX"
  @get external screenY: t => int = "screenY"
  @get external shiftKey: t => bool = "shiftKey"
}

module Pointer = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  /* UIEvent */
  @get @get
  external detail: t => int = "detail"

  /* external view : t -> Dom.window = "view" */
  /* Should return DOMAbstractView/WindowProxy */

  /* MouseEvent */
  @get external screenX: t => int = "screenX"
  @get external screenY: t => int = "screenY"
  @get external clientX: t => int = "clientX"
  @get external clientY: t => int = "clientY"
  @get external pageX: t => int = "pageX"
  @get external pageY: t => int = "pageY"
  @get external movementX: t => int = "movementX"
  @get external movementY: t => int = "movementY"
  @get external ctrlKey: t => bool = "ctrlKey"
  @get external shiftKey: t => bool = "shiftKey"
  @get external altKey: t => bool = "altKey"
  @get external metaKey: t => bool = "metaKey"

  @get external getModifierState: (t => string) => bool = "getModifierState"

  @get external button: t => int = "button"
  @get external buttons: t => int = "buttons"

  @get @return(nullable) external relatedTarget: t => option<{..}> = "relatedTarget"
  /* Should return Dom.eventTarget */

  /* PointerEvent */
  /* external pointerId : t -> Dom.eventPointerId = "pointerId" [@@get] */
  @get external width: t => float = "width"
  @get external height: t => float = "height"
  @get external pressure: t => float = "pressure"
  @get external tangentialPressure: t => float = "tangentialPressure"
  @get external tiltX: t => int = "tiltX"
  @get external tiltY: t => int = "tiltY"
  @get external twist: t => int = "twist"
  @get external pointerType: t => string = "pointerType"
  @get external isPrimary: t => bool = "isPrimary"
}

module Selection = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})
}

module Touch = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external altKey: t => bool = "altKey"
  @get external changedTouches: t => {..} = "changedTouches"
  /* Should return Dom.touchList */

  @get external ctrlKey: t => bool = "ctrlKey"

  @send external getModifierState: (t => string) => bool = "getModifierState"

  @get external metaKey: t => bool = "metaKey"
  @get external shiftKey: t => bool = "shiftKey"
  @get external targetTouches: t => {..} = "targetTouches"
  /* Should return Dom.touchList */

  @get external touches: t => {..} = "touches"
  /* Should return Dom.touchList */
}

module UI = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external detail: t => int = "detail"
  /* external view : t -> Dom.window = "view" [@@get] */
  /* Should return DOMAbstractView/WindowProxy */
}

module Wheel = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external deltaMode: t => int = "deltaMode"
  @get external deltaX: t => float = "deltaX"
  @get external deltaY: t => float = "deltaY"
  @get external deltaZ: t => float = "deltaZ"
}

module Media = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})
}

module Image = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})
}

module Animation = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external animationName: t => string = "animationName"
  @get external pseudoElement: t => string = "pseudoElement"
  @get external elapsedTime: t => float = "elapsedTime"
}

module Transition = {
  type tag
  type t = synthetic<tag>

  include MakeEventWithType({type t = t})

  @get external propertyName: t => string = "propertyName"
  @get external pseudoElement: t => string = "pseudoElement"
  @get external elapsedTime: t => float = "elapsedTime"
}
