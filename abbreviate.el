;;; abbreviate.el --- Abbreviates the word at point  -*- lexical-binding: t -*-

;; Copyright (C) 2022 by Vernon Grant.

;; Author: Vernon Grant <vernon@ruppell.io>
;; Version: 1.0.0
;; Package-Requires: ((emacs "26.1"))
;; Keywords: abbreviate, package
;; Homepage: https://github.com/VernonGrant/abbreviate.el

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Abbreviates the word at point, using a predefined list of common programming
;; abbreviations.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;
;; Private Variables ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; These common abbreviations where takes from here:
;; https://github.com/kisvegabor/abbreviations-in-code
;; (setq-default abbriviate-abbreviations )
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
    ("double" . "dbl")
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
    ("instance" . "inst")
    ("integer" . "int")
    ("interface" . "iface")
    ("language" . "lng")
    ("latitude" . "lat")
    ("length" . "len")
    ("less" . "le")
    ("library" . "lib")
    ("location" . "loc")
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

;;;;;;;;;;;;;;;;;;;
;; Functionality ;;
;;;;;;;;;;;;;;;;;;;

(defun abbreviate-insert-abbreviations (list)
  "Append or replace existing abbreviations.
LIST: The associations lost of word, abbreviation pairs."
  (dolist (element list)
    (let ((word (downcase (car element)))
          (abbr (downcase (cdr element))))
      (if (not (assoc word abbriviate-abbreviations))
          ;; Item is not in the list, so just push it in.
          (push (cons word abbr) abbriviate-abbreviations)
        ;; Remove existing matches and add the new one.
        (progn
          (setq abbriviate-abbreviations
                (assoc-delete-all word abbriviate-abbreviations))
          (push (cons word abbr) abbriviate-abbreviations))))))

(defun abbreviate-list-abbreviations ()
  "Lists all abbreviations."
  (interactive)
  (let ((abbr-buf-name "*abbreviate*"))
    ;; Create buffer if needed.
    (get-buffer-create abbr-buf-name)
    (with-current-buffer abbr-buf-name
      ;; Disable read only and wipe buffer.
      (read-only-mode -1)
      (erase-buffer)
      ;; Print out all abbreviations.
      (dolist (element abbriviate-abbreviations)
        (insert  (concat (car element) " => " (cdr element)))
        (newline))
      ;; Sort buffer lines
      (sort-lines nil (point-min) (point-max))
      ;; Enable read only mode.
      (read-only-mode))
    ;; Switch to the buffer.
    (switch-to-buffer abbr-buf-name)))

(defun abbreviate-word-at-point ()
  "Abbreviates the word at point, if abbreviation is available."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (when bounds
      (let ((word (word-at-point 'no-properties))
            (word-down (downcase (word-at-point 'no-properties))))
        (let ((abbr (assoc-string word-down abbriviate-abbreviations)))
          (when abbr
            (let ((abbr-processed (cond
                                   ;; Is uppercase.
                                   ((string= (upcase word) word)
                                    (upcase (cdr abbr)))
                                   ;; Is capitalized.
                                   ((string= (capitalize word) word)
                                    (capitalize (cdr abbr)))
                                   ;; Maybe lowercase.
                                   (t (downcase (cdr abbr))))))
              (delete-region (car bounds) (cdr bounds))
              (insert abbr-processed)
              (message "Abbreviated!")))))))
  (forward-to-word 1))

(provide 'abbreviate)

;;; abbreviate.el ends here
