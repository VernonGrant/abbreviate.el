# Abbreviate.el

**Abbreviates the word at point, using a predefined list of common programming
abbreviations.** I made this Emacs package because I always forgot certain
abbreviations, and sometimes the abbreviations I choose to use, difference
between projects. This basically solves both these problems.

![Abbreviate.el Demo](https://raw.githubusercontent.com/VernonGrant/abbreviate.el/main/img/demo.gif)

## Manual installation

Clone this repository locally, and add the load path to your `.emacs`:

```lisp
(add-to-list 'load-path "/path/to/abbreviate.el/folder/")
(require 'abbreviate)

(global-set-key (kbd "C-c C-a") 'abbr-abbreviate-word-at-point)

;; Notes:
;; On Windows, use this path format:
;; (add-to-list 'load-path "C:\\Users\\your-name\\path\\to\\abbreviate.el\\folder\\")
```

## Usage

Basically just move your cursor to the word you want to abbreviate, and press
your defined keybinding, that calls `abbr-abbreviate-word-at-point`.

## Contributions

You can help by contributing more abbreviations by adding them to the predefined
list `abbr-abbreviations` inside the `abbreviate.el` file. The current available
abbreviations are:

```lisp
;; The format is
;; (word . abbreviation)

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
```

I took these abbreviations from the from [Abbreviations in program
codes](https://github.com/kisvegabor/abbreviations-in-code).
