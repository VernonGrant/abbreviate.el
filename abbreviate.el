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
(defvar abbr-abbreviations
  `((abbreviate . abbr)
    (absolute . abs)
    (action . act)
    (active . act)
    (actual . act)
    (address . addr)
    (allocate . alloc)
    (alternate . alt)
    (alternative . alt)
    (application . app)
    (argument . arg)
    (array . arr)
    (attribute . attr)
    (authenticate . auth)
    (authentication . auth)
    (average . avg)
    (background . bg)
    (battery . bat)
    (binary . bin)
    (boolean . bool)
    (break . brk)
    (buffer . buf)
    (button . btn)
    (calculate . calc)
    (callback . cb)
    (certificate . cert)
    (channel . ch)
    (character . char)
    (checksum . csum)
    (circle . circ)
    (clear . clr)
    (collection . coll)
    (column . col)
    (comercial . com)
    (command . cmd)
    (common . com)
    (communication . com)
    (compare . cmp)
    (concatenate . concat)
    (concatenation . concat)
    (configuration . cfg)
    (configuration . conf)
    (configuration . config)
    (connection . conn)
    (context . ctx)
    (continue . cont)
    (control . ctrl)
    (conversation . conv)
    (coordinate . coord)
    (copy . cpy)
    (cosines . cos)
    (counter . cnt)
    (current . cur)
    (database . db)
    (debug . dbg)
    (decimal . dec)
    (decrease . dec)
    (default . def)
    (define . def)
    (delete . del)
    (delta . dt)
    (descriptor . dsc)
    (destination . dest)
    (development . dev)
    (device . dev)
    (difference . diff)
    (directory . dir)
    (disable . dis)
    (display . disp)
    (document . doc)
    (driver . drv)
    (enable . ena)
    (environment . env)
    (equal . eq)
    (error . err)
    (event . ev)
    (expression . expr)
    (generate . gen)
    (hardware . hw)
    (header . hdr)
    (height . h)
    (hexadecimal . hex)
    (horizontal . hor)
    (identifier . id)
    (image . img)
    (include . inc)
    (increase . inc)
    (index . idx)
    (information . info)
    (initialize . init)
    (integer . int)
    (integer . int)
    (interface . iface)
    (language . lng)
    (latitude . lat)
    (length . len)
    (less . le)
    (library . lib)
    (longitude . long)
    (manager . mng)
    (mathematics . math)
    (maximum . max)
    (memory . mem)
    (message . msg)
    (microcontroller . mcu)
    (middle . mid)
    (minimum . min)
    (miscellaneous . misc)
    (modulo . mod)
    (network . net)
    (no . n)
    (number . num)
    (number . num)
    (object . obj)
    (operating . op)
    (operation . op)
    (order . ord)
    (parameter . param)
    (picture . pic)
    (pixel . px)
    (pointer . ptr)
    (pointer . ptr)
    (position . pos)
    (power . pwr)
    (prediction . pred)
    (preference . pref)
    (previous . prev)
    (process . proc)
    (profiler . prof)
    (query . qry)
    (radius . rad)
    (random . rand)
    (range . rng)
    (receive . recv)
    (rectangle . rect)
    (remove . rmv)
    (requested . req)
    (required . req)
    (response . res)
    (result . res)
    (return . ret)
    (revision . rev)
    (selected . sel)
    (selection . sel)
    (semaphore . sem)
    (sequence . seq)
    (signed . sgd)
    (sine . sin)
    (source . src)
    (square . sqr)
    (squared . sqr)
    (standard . std)
    (statistics . stat)
    (string . str)
    (synchronize . sync)
    (temperature . temp)
    (temporary . temp)
    (temporary . tmp)
    (text . txt)
    (timer . tmr)
    (timestamp . ts)
    (toggle . tgl)
    (user . usr)
    (value . v)
    (value . val)
    (variable . var)
    (version . v)
    (vertical . vert)
    (width . w)
    (window . win)
    (yes . y))
  "All possible abbreviate, abbreviations.")

;;;;;;;;;;;;;;;;;;;
;; Functionality ;;
;;;;;;;;;;;;;;;;;;;

(defun abbr-abbreviate-word-at-point ()
  "Abbreviates the word at point, if abbreviation is available."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (when bounds
      (let ((word (word-at-point))
            (word-sym (intern (downcase (word-at-point)))))
        (let ((abbr (alist-get word-sym abbr-abbreviations)))
          (when abbr
            (let ((abbr-processed (cond
                                   ;; Is uppercase.
                                   ((string= (upcase word) word)
                                    (upcase (symbol-name abbr)))
                                   ;; Is capitalized.
                                   ((string= (capitalize word) word)
                                    (capitalize (symbol-name abbr)))
                                   ;; Maybe lowercase.
                                   (t (downcase (symbol-name abbr))))))
              (delete-region (car bounds) (cdr bounds))
              (insert abbr-processed)
              (message "Abbreviated!")))))))
  (forward-to-word 1))

(provide 'abbreviate)

;;; abbreviate.el ends here
