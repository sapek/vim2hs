function! vim2hs#haskell#quasi#quote() " {{{
  syntax region hsQuasi matchgroup=hsQuasiQuote
    \ start="\[\$\?\k\+|" end="|\]"
    \ keepend

  highlight! link hsQuasiQuote Delimiter
  highlight! link hsQuasi Macro
endfunction " }}}


function! vim2hs#haskell#quasi#interpolation() " {{{
  syntax region hsStringQQ matchgroup=hsStringQQuote
    \ start="\[\$\?[sq]|" end="|\]"
    \ keepend contains=@Spell

  syntax region hsP6Interpolation matchgroup=hsP6AntiQuote
    \ start="{" end="}"
    \ keepend contained contains=TOP

  syntax match hsP6Identifier
    \ "\$\k\+"
    \ contained

  syntax region hsP6QQ matchgroup=hsP6QQuote
    \ start="\[\$\?qc|" end="|\]"
    \ keepend contains=hsP6Interpolation,@Spell

  syntax region hsP6QQ matchgroup=hsP6QQuote
    \ start="\[\$\?qq|" end="|\]"
    \ keepend contains=hsP6Identifier,hsP6Interpolation,@Spell

  syntax region hsRubyInterpolation matchgroup=hsRubyAntiQuote
    \ start="#{" end="}"
    \ keepend contained contains=TOP

  syntax region hsRubyQQ matchgroup=hsRubyQQuote
    \ start="\[\$\?istr|" end="|\]"
    \ keepend contains=hsRubyInterpolation,@Spell

  highlight! link hsStringQQuote Delimiter
  highlight! link hsStringQQ String
  highlight! link hsP6QQuote Delimiter
  highlight! link hsP6QQ String
  highlight! link hsP6AntiQuote PreProc
  highlight! link hsP6Identifier Identifier
  highlight! link hsRubyQQuote Delimiter
  highlight! link hsRubyQQ String
  highlight! link hsRubyAntiQuote PreProc
endfunction " }}}


function! vim2hs#haskell#quasi#regex() " {{{
  syntax match regexSpecialChar
    \ /\\[a-zA-Z]/
    \ contained

  syntax match regexOperator
    \ "[\(]\@<![.*+?]"
    \ contained

  syntax match regexDelimiter
    \ "(\|)\|\[\|\]\|{\|}"
    \ contained

  syntax match regexStructure
    \ "(\@<=?.\|[$^]"
    \ contained

  syntax cluster regex
    \ contains=regexSpecialChar,regexOperator,
              \regexDelimiter,regexStructure

  syntax region hsRexMap matchgroup=hsRexMapQuote
    \ start="(\@<=?{" end="}\%(.*)\)\@="
    \ keepend contained contains=TOP

  syntax region hsRex matchgroup=hsRexQuote
    \ start="\[\$\?b\?rex|" end="|\]"
    \ keepend contains=@regex,hsRexMap

  syntax region hsRelit matchgroup=hsRelitQuote
    \ start="\[\$\?b\?re|" end="|\]"
    \ keepend contains=@regex

  syntax region hsRegexQQ matchgroup=hsRegexQQuote
    \ start="\[\$\?b\?rx|" end="|\]"
    \ keepend contains=@regex

  highlight! link regexSpecialChar SpecialChar
  highlight! link regexOperator Operator
  highlight! link regexDelimiter Delimiter
  highlight! link regexStructure Structure

  highlight! link hsRexQuote Delimiter
  highlight! link hsRex String
  highlight! link hsRexMapQuote PreProc

  highlight! link hsRelitQuote PreProc
  highlight! link hsRelit String

  highlight! link hsRegexQQuote PreProc
  highlight! link hsRegexQQ String
endfunction " }}}


function! vim2hs#haskell#quasi#jmacro() " {{{
  syntax include @jmacro syntax/jmacro.vim
  unlet b:current_syntax

  syntax region hsJmacroSplice matchgroup=hsJmacroAntiQuote
    \ start="`(" end=")`"
    \ keepend contained contains=TOP

  syntax region hsJmacro matchgroup=hsJmacroQuote
    \ start="\[\$\?jmacroE\?|" end="|\]"
    \ keepend contains=hsJmacroSplice,@jmacro

  highlight! link hsJmacroQuote Delimiter
  highlight! link hsJmacroAntiQuote PreProc
endfunction " }}}


function! vim2hs#haskell#quasi#shqq() " {{{
  syntax include @shell syntax/sh.vim
  unlet b:current_syntax

  syntax match hsShQQInterpolation
    \ "\$+\?\%({\k\+}\|\k\+\)"
    \ contained

  syntax region hsShQQ matchgroup=hsShQQuote
    \ start="\[\$\?shc\?|" end="|\]"
    \ keepend contains=hsShQQInterpolation,@shell

  highlight! link hsShQQuote Delimiter
  highlight! link hsShQQInterpolation Identifier
endfunction " }}}


function! vim2hs#haskell#quasi#sql() " {{{
  syntax include @sql syntax/sql.vim
  unlet b:current_syntax

  syntax region hsSQLSplice matchgroup=hsSQLSpliceQuote
    \ start="\$[si]\?(" end=")"
    \ contains=TOP

  syntax region hsSQL matchgroup=hsSQLQuote
    \ start="\[\$\?\%(sql\|sqlStmts\?\|pgsqlStmts\?\|sqlExpr\)|" end="|\]"
    \ keepend contains=hsSQLSplice,@sql

  highlight! link hsSQLQuote Delimiter
  highlight! link hsSQLSpliceQuote Preproc
endfunction " }}}