import jsffi

import jsNode

type
    Net* = ref NetObj
    NetObj {.importc.} = object of JsRoot

    NetSocket* = ref NetSocketObj
    NetSocketObj {.importc.} = object of JsRoot

var net*:Net = require("net").to(Net)

proc createConnection*(net:Net, port:cint, host:cstring, cb:proc():void):NetSocket {.importcpp.}
proc destroy*(s:NetSocket):void {.importcpp.}
proc write*(s:NetSocket, data:cstring):void {.importcpp.}
proc onData*(s:NetSocket, listener:(proc(data:Buffer):void)):NetSocket
    {.importcpp: "#.on(\"data\",@)", discardable.}
proc onClose*(s:NetSocket, listener:(proc(hadError:bool):void)):NetSocket
    {.importcpp: "#.on(\"close\",@)", discardable.}