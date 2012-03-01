syntax clear


call lib#letdefault('g:haskell_cpp'          , 1)
call lib#letdefault('g:haskell_th'           , 1)
call lib#letdefault('g:haskell_quasi'        , 1)
call lib#letdefault('g:haskell_jmacro'       , 1)
call lib#letdefault('g:haskell_shqq'         , 1)
call lib#letdefault('g:haskell_hsp'          , 1)
call lib#letdefault('g:haskell_conceal'      , 1)
call lib#letdefault('g:haskell_conceal_wide' , 0)
call lib#letdefault('g:haskell_conceal_bad'  , 0)


call haskell#keywords(1)
call haskell#bindings()
call haskell#strings()

if g:haskell_cpp
  call haskell#cpp()
endif

if g:haskell_th
  call haskell#th()
endif

if g:haskell_quasi
  call haskell#quasi()
endif

if g:haskell_jmacro
  call haskell#jmacro()
endif

if g:haskell_shqq
  call haskell#shqq()
endif

if g:haskell_hsp
  call haskell#hsp()
endif

if g:haskell_conceal
  call haskell#conceal(g:haskell_conceal_wide, g:haskell_conceal_bad)
endif


let b:current_syntax = "haskell"
