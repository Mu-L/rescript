open Webapi.Dom

let el = document->Document.createElement("strong")
let event = document->Document.createEvent("my-event")
let handleClick = _ => print_endline("asd")

let _ = Window.console(window)
let _ = Window.crypto(window)
let _ = Window.document(window)
let _ = Window.frameElement(window)
let _ = Window.frames(window)
let _ = Window.fullScreen(window)
let _ = Window.history(window)
let _ = Window.innerWidth(window)
let _ = Window.innerHeight(window)
let _ = Window.isSecureContext(window)
let _ = Window.length(window)
let _ = Window.location(window)
let _ = Window.setLocation(window, "http://reason.ml")
let _ = Window.locationbar(window)
let _ = Window.menubar(window)
let _ = Window.name(window)
let _ = Window.setName(window, "new name")
let _ = Window.navigator(window)
let _ = Window.opener(window)
let _ = Window.outerWidth(window)
let _ = Window.outerHeight(window)
let _ = Window.pageXOffset(window)
let _ = Window.pageYOffset(window)
let _ = Window.parent(window)
let _ = Window.performance(window)
let _ = Window.personalbar(window)
let _ = Window.screen(window)
let _ = Window.screenX(window)
let _ = Window.screenY(window)
let _ = Window.scrollbars(window)
let _ = Window.scrollX(window)
let _ = Window.scrollY(window)
let _ = Window.self(window)
let _ = Window.speechSynthesis(window)
let _ = Window.status(window)
let _ = Window.setStatus(window, "new status")
let _ = Window.statusbar(window)
let _ = Window.toolbar(window)
let _ = Window.top(window)
let _ = Window.window(window)

Window.alert("hello!", window)
Window.blur(window)
let idleId = Window.requestIdleCallback(_ => (), window) /* out of order */
Window.cancelIdleCallback(idleId, window)
Window.close(window)
let _ = Window.confirm("is ok?", window)
Window.focus(window)
let _ = Window.getComputedStyle(el, window)
let _ = Window.getComputedStyleWithPseudoElement(el, "hover", window)
let _ = Window.getSelection(window)
let _ = Window.matchMedia("max-height: 400", window)
let _ = Window.moveBy(10, -10, window)
let _ = Window.moveTo(120, 300, window)
let _ = Window.open_(~url="http://...", ~name="my window", ~features="menubar=yes", window)
let _ = Window.open_(~url="http://...", ~name="my window", window)
Window.postMessage(
  "my message",
  "*",
  window,
) /* Currently no way to make transferables */ /* Window.postMessageWithTransfers "my message" "*" transfers window; */
Window.print(window)
let _ = Window.prompt("type you password, please?", window)
let _ = Window.promptWithDefault("type password or use this?", "password", window)
let _ = Window.requestIdleCallbackWithOptions(_ => (), {"timeout": 1000}, window)
let _ = Window.resizeBy(10, -10, window)
let _ = Window.resizeTo(120, 300, window)
let _ = Window.scroll(0.0, 0.0, window)
let _ = Window.scrollBy(10.0, -10.0, window)
let _ = Window.scrollTo(120.5, 300.3, window)
Window.stop(window)
Window.setOnLoad(window, () => print_endline("load"))
