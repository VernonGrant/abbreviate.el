# Abbreviate.el

**Abbreviates the word at point, using a predefined list of common programming
abbreviations.** I made this package because I always forget certain
abbreviations, and the abbreviations I use are inconsistent across code
bases.

![Abbreviate.el Demo](https://raw.githubusercontent.com/VernonGrant/abbreviate.el/main/img/demo.gif)

## Manual installation

Clone this repository, and add the load path to your `.emacs`:

```lisp
(add-to-list 'load-path "/path/to/abbreviate.el/folder/")
(require 'abbreviate)

;; Set the default key binding.
(global-set-key (kbd "C-c a") 'abbreviate-word-at-point)

;; Add your own abbreviations (all lowercase).
(abbreviate-insert-abbreviations '(("squared" . "sqr")
                                   ("text" . "txt")
                                   ("certificate" . "cert")
                                   ("background" . "bg")))

;; Notes:
;; On Windows, use this path format:
;; (add-to-list 'load-path "C:\\Users\\your-name\\path\\to\\abbreviate.el\\folder\\")
```

## Usage

Basically just move your cursor to the word you want to abbreviate, and press
your defined keybinding that calls `abbreviate-word-at-point`. Here a list of
the available interactive functions:

| Command                           | Description                                                       |
|-----------------------------------|-------------------------------------------------------------------|
| **abbreviate-list-appreviations** | List all available abbreviations.                                 |
| **abbreviate-word-at-point**      | Abbreviates the word at point, if it's abbreviation is available. |

You can also define your own abbreviations using the
`abbreviate-insert-abbreviations` function, inside your init files, see the
above example.

## Contributions

You can contribute by adding additional abbreviations to the predefined list
`abbreviate-abbreviations` inside the `abbreviate.el` file. The current
**default abbreviations are**:

```lisp
;; The format is
;; (word . abbreviation)

(defvar abbriviate-abbreviations
  `(
    ("absolute" . "abs")
    ("allocate" . "alloc")
    ("alternate" . "alt")
    ("alternative" . "alt")
    ("application" . "app")
    ("argument" . "arg")
    ("arguments" . "args")
    ("array" . "arr")
    ("attribute" . "attr")
    ("authenticate" . "auth")
    ("authentication" . "auth")
    ("average" . "avg")
    ("binary" . "bin")
    ("boolean" . "bool")
    ("break" . "brk")
    ("buffer" . "buf")
    ("calculate" . "calc")
    ("callback" . "cb")
    ("categories" . "cat")
    ("category" . "cat")
    ("character" . "char")
    ("checksum" . "csum")
    ("circle" . "circ")
    ("clear" . "clr")
    ("collection" . "coll")
    ("command" . "cmd")
    ("compare" . "cmp")
    ("concatenate" . "concat")
    ("concatenation" . "concat")
    ("config" . "cfg")
    ("configuration" . "conf")
    ("connection" . "conn")
    ("context" . "ctx")
    ("control" . "ctrl")
    ("conversation" . "conv")
    ("coordinate" . "coord")
    ("copy" . "cpy")
    ("cosines" . "cos")
    ("counter" . "cnt")
    ("current" . "cur")
    ("database" . "db")
    ("debug" . "dbg")
    ("decimal" . "dec")
    ("decrease" . "dec")
    ("default" . "def")
    ("define" . "def")
    ("delete" . "del")
    ("delta" . "dt")
    ("descriptor" . "dsc")
    ("destination" . "dest")
    ("development" . "dev")
    ("device" . "dev")
    ("difference" . "diff")
    ("directory" . "dir")
    ("disable" . "dis")
    ("display" . "disp")
    ("document" . "doc")
    ("driver" . "drv")
    ("enable" . "ena")
    ("environment" . "env")
    ("equal" . "eq")
    ("error" . "err")
    ("event" . "ev")
    ("expression" . "expr")
    ("generate" . "gen")
    ("hardware" . "hw")
    ("header" . "hdr")
    ("height" . "h")
    ("hexadecimal" . "hex")
    ("horizontal" . "hor")
    ("identifier" . "id")
    ("image" . "img")
    ("include" . "inc")
    ("increase" . "inc")
    ("index" . "idx")
    ("information" . "info")
    ("initialize" . "init")
    ("integer" . "int")
    ("integer" . "int")
    ("interface" . "iface")
    ("language" . "lng")
    ("latitude" . "lat")
    ("length" . "len")
    ("less" . "le")
    ("library" . "lib")
    ("longitude" . "long")
    ("manager" . "mng")
    ("mathematics" . "math")
    ("maximum" . "max")
    ("memory" . "mem")
    ("message" . "msg")
    ("microcontroller" . "mcu")
    ("middle" . "mid")
    ("minimum" . "min")
    ("miscellaneous" . "misc")
    ("modulo" . "mod")
    ("network" . "net")
    ("no" . "n")
    ("number" . "num")
    ("number" . "num")
    ("object" . "obj")
    ("operating" . "op")
    ("operation" . "op")
    ("order" . "ord")
    ("parameter" . "param")
    ("picture" . "pic")
    ("pixel" . "px")
    ("pointer" . "ptr")
    ("pointer" . "ptr")
    ("position" . "pos")
    ("power" . "pwr")
    ("prediction" . "pred")
    ("preference" . "pref")
    ("previous" . "prev")
    ("process" . "proc")
    ("profiler" . "prof")
    ("query" . "qry")
    ("radius" . "rad")
    ("random" . "rand")
    ("range" . "rng")
    ("receive" . "recv")
    ("rectangle" . "rect")
    ("remove" . "rmv")
    ("requested" . "req")
    ("required" . "req")
    ("response" . "res")
    ("result" . "res")
    ("revision" . "rev")
    ("selected" . "sel")
    ("selection" . "sel")
    ("semaphore" . "sem")
    ("sequence" . "seq")
    ("signed" . "sgd")
    ("sine" . "sin")
    ("source" . "src")
    ("square" . "sqr")
    ("squared" . "sqr")
    ("standard" . "std")
    ("statistics" . "stat")
    ("string" . "str")
    ("synchronize" . "sync")
    ("temperature" . "temp")
    ("temporary" . "temp")
    ("temporary" . "tmp")
    ("text" . "txt")
    ("timer" . "tmr")
    ("timestamp" . "ts")
    ("toggle" . "tgl")
    ("user" . "usr")
    ("value" . "v")
    ("value" . "val")
    ("variable" . "var")
    ("version" . "v")
    ("vertical" . "vert")
    ("width" . "w")
    ("window" . "win")
    ("yes" . "y")
    )
  "All possible abbreviate, abbreviations.")
```

I took these default abbreviations from: [Abbreviations in program
codes](https://github.com/kisvegabor/abbreviations-in-code).
