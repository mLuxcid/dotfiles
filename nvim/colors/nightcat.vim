" Copyright (C) 2019-2023 Luxcid <hauntedtheorists@gmail.com>
"
" Vim script based on https://github.com/arcticicestudio/nord-vim
" Copyright (C) 2016-2019 Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-2019 Sven Greb <development@svengreb.de>

" Project: Nightcat.vim
" Repository: https://github.com/Drisk4580/nvim
" License: MIT

" TODO: Migrate to Lua

if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'nightcat'
let g:nightcat_vim_version='0.1.0'
set background=dark

let g:nightcat_bg = '#041c24'

let g:nightcat_gui = {}
let g:nightcat_gui[0]  = '#2a4242' " background

let g:nightcat_gui[1]  = '#2F2A38' " normal black
let g:nightcat_gui[2]  = '#2a4242' " medium black
let g:nightcat_gui[3]  = '#213636' " bright black

let g:nightcat_gui[4]  = '#deffe9' " foreground
let g:nightcat_gui[5]  = '#e6ffee' " normal white
let g:nightcat_gui[6]  = '#ffffff' " bright white

let g:nightcat_gui[7]  = '#3fc49e' " normal cyan
let g:nightcat_gui[8]  = '#5de3bd' " bright cyan

let g:nightcat_gui[9]  = '#39c4b8' " normal blue
let g:nightcat_gui[10] = '#4eded9' " bright blue

let g:nightcat_gui[11] = '#ad2f4e' " normal red
let g:nightcat_gui[12] = '#b83958' " bright red

let g:nightcat_gui[13] = '#9cad2a' " normal yellow
let g:nightcat_gui[14] = '#27e88b' " normal green
let g:nightcat_gui[15] = '#854d96' " normal magenta

let g:nightcat_gui[16] = '#51f5a6'

" Extended
let g:nightcat_gui[17] = '#f5d151' " normal orange
let g:nightcat_gui[18] = '#236955'
let g:nightcat_gui[19] = '#85f8bf'
let g:nightcat_gui[20] = '#041921'

let g:nightcat_gui["3_bright"] = '#2a4242'
let g:nightcat_gui_3_bright = g:nightcat_gui["3_bright"]

let g:nightcat_term = {}

let g:nightcat_term[0]  = 'NONE'
let g:nightcat_term[1]  = '0'
let g:nightcat_term[2]  = 'NONE'
let g:nightcat_term[3]  = '8'
let g:nightcat_term[4]  = 'NONE'
let g:nightcat_term[5]  = '7'
let g:nightcat_term[6]  = '15'
let g:nightcat_term[7]  = '14'
let g:nightcat_term[8]  = '6'
let g:nightcat_term[9]  = '4'
let g:nightcat_term[10] = '12'
let g:nightcat_term[11] = '1'
let g:nightcat_term[12] = '11'
let g:nightcat_term[13] = '3'
let g:nightcat_term[14] = '2'
let g:nightcat_term[15] = '5'
let g:nightcat_term[16] = 'NONE'

let g:colors_gui = g:nightcat_gui
let g:colors_term = g:nightcat_term

if !exists('g:nightcat_bold')
  let g:nightcat_bold = 1
endif

let s:bold = 'bold,'
if g:nightcat_bold == 0
  let s:bold = ''
endif

if !exists('g:nightcat_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:nightcat_italic = 1
  else
    let g:nightcat_italic = 0
  endif
endif

let s:italic = 'italic,'
if g:nightcat_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if ! get(g:, 'nightcat_underline', 1)
  let s:underline = 'NONE,'
endif

let s:italicize_comments = ''
if exists('g:nightcat_italic_comments')
  if g:nightcat_italic_comments == 1
    let s:italicize_comments = s:italic . s:bold
  endif
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'nightcat: warning: ' . a:msg
  echohl None
endfunction

if !exists('g:nightcat_uniform_diff_background')
  let g:nightcat_uniform_diff_background = 0
endif

if !exists('g:nightcat_cursor_line_number_background')
  let g:nightcat_cursor_line_number_background = 0
endif

if !exists('g:nightcat_cursor_line_sign_background')
  let g:nightcat_cursor_line_sign_background = 0
endif

if !exists('g:nightcat_bold_vertical_split_line')
  let g:nightcat_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg !=# ''
    exec 'hi ' . a:group . ' guifg=' . a:guifg
  endif
  if a:guibg !=# ''
    exec 'hi ' . a:group . ' guibg=' . a:guibg
  endif
  if a:ctermfg !=# ''
    exec 'hi ' . a:group . ' ctermfg=' . a:ctermfg
  endif
  if a:ctermbg !=# ''
    exec 'hi ' . a:group . ' ctermbg=' . a:ctermbg
  endif
  if a:attr !=# ''
    exec 'hi ' . a:group . ' gui=' . a:attr . ' cterm=' . substitute(a:attr, 'undercurl', s:underline, '')
  endif
  if a:guisp !=# ''
    exec 'hi ' . a:group . ' guisp=' . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi('Bold', '', '', '', '', s:bold, '')
call s:hi('Italic', '', '', '', '', s:italic, '')
call s:hi('Underline', '', '', '', '', s:underline, '')

"+--- Editor ---+
call s:hi('ColorColumn', '', g:nightcat_gui[1], 'NONE', g:nightcat_term[1], '', '')
call s:hi('Cursor', '', g:nightcat_gui[4], '', 'NONE', '', '')
call s:hi('CursorLine', '', g:nightcat_gui[18], 'NONE', g:nightcat_term[1], 'NONE', '')
call s:hi('CursorLineNC', '', g:nightcat_gui[1], 'NONE', g:nightcat_term[1], 'NONE', '')
call s:hi('Error', g:nightcat_gui[0], g:nightcat_gui[11], '', g:nightcat_term[11], '', '')
call s:hi('iCursor', g:nightcat_gui[0], g:nightcat_gui[4], '', 'NONE', '', '')
call s:hi('LineNr', g:nightcat_gui[3], '', g:nightcat_term[3], 'NONE', '', '')
call s:hi('MatchParen', g:nightcat_gui[8], g:nightcat_gui[3], g:nightcat_term[8], g:nightcat_term[3], '', '')
call s:hi('NonText', g:nightcat_gui[2], '', g:nightcat_term[3], '', '', '')
call s:hi('Normal', g:nightcat_gui[4], g:nightcat_bg, 'NONE', 'NONE', '', '')
call s:hi('NormalNC', g:nightcat_gui[4], g:nightcat_gui[20], 'NONE', 'NONE', '', '')
call s:hi('PMenu', g:nightcat_gui[4], g:nightcat_gui[2], 'NONE', g:nightcat_term[1], 'NONE', '')
call s:hi('PmenuSbar', g:nightcat_gui[4], g:nightcat_gui[2], 'NONE', g:nightcat_term[1], '', '')
call s:hi('PMenuSel', g:nightcat_gui[8], g:nightcat_gui[3], g:nightcat_term[8], g:nightcat_term[3], '', '')
call s:hi('PmenuThumb', g:nightcat_gui[8], g:nightcat_gui[3], 'NONE', g:nightcat_term[3], '', '')
call s:hi('SpecialKey', g:nightcat_gui[3], '', g:nightcat_term[3], '', '', '')
call s:hi('SpellBad', '', '', '', '', 'undercurl', '')
call s:hi('SpellCap', '', '', '', '', 'undercurl', '')
call s:hi('SpellLocal', '', '', '', '', 'undercurl', '')
call s:hi('SpellRare', '', '', '', '', 'undercurl', '')
call s:hi('Visual', '', g:nightcat_gui[2], '', g:nightcat_term[1], '', '')
call s:hi('VisualNOS', '', g:nightcat_gui[2], '', g:nightcat_term[1], '', '')
"+- Neovim Support -+
call s:hi('healthError', g:nightcat_gui[11], g:nightcat_gui[1], g:nightcat_term[11], g:nightcat_term[1], '', '')
call s:hi('healthSuccess', g:nightcat_gui[14], g:nightcat_gui[1], g:nightcat_term[14], g:nightcat_term[1], '', '')
call s:hi('healthWarning', g:nightcat_gui[13], g:nightcat_gui[1], g:nightcat_term[13], g:nightcat_term[1], '', '')
call s:hi('TermCursorNC', '', g:nightcat_gui[1], '', g:nightcat_term[1], '', '')

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [
  \   g:nightcat_gui[1],
  \   g:nightcat_gui[11],
  \   g:nightcat_gui[14],
  \   g:nightcat_gui[13],
  \   g:nightcat_gui[9],
  \   g:nightcat_gui[15],
  \   g:nightcat_gui[8],
  \   g:nightcat_gui[5],
  \   g:nightcat_gui[3],
  \   g:nightcat_gui[11],
  \   g:nightcat_gui[14],
  \   g:nightcat_gui[13],
  \   g:nightcat_gui[9],
  \   g:nightcat_gui[15],
  \   g:nightcat_gui[7],
  \   g:nightcat_gui[6]
  \ ]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = g:nightcat_gui[1]
  let g:terminal_color_1 = g:nightcat_gui[11]
  let g:terminal_color_2 = g:nightcat_gui[14]
  let g:terminal_color_3 = g:nightcat_gui[13]
  let g:terminal_color_4 = g:nightcat_gui[9]
  let g:terminal_color_5 = g:nightcat_gui[15]
  let g:terminal_color_6 = g:nightcat_gui[8]
  let g:terminal_color_7 = g:nightcat_gui[5]
  let g:terminal_color_8 = g:nightcat_gui[3]
  let g:terminal_color_9 = g:nightcat_gui[11]
  let g:terminal_color_10 = g:nightcat_gui[14]
  let g:terminal_color_11 = g:nightcat_gui[13]
  let g:terminal_color_12 = g:nightcat_gui[9]
  let g:terminal_color_13 = g:nightcat_gui[15]
  let g:terminal_color_14 = g:nightcat_gui[7]
  let g:terminal_color_15 = g:nightcat_gui[6]
endif

"+--- Gutter ---+
call s:hi('CursorColumn', '', g:nightcat_gui[1], 'NONE', g:nightcat_term[1], '', '')
if g:nightcat_cursor_line_number_background == 0
  call s:hi('CursorLineNr', g:nightcat_gui[4], '', 'NONE', '', '', '')
  call s:hi('CursorLineNrNC', g:nightcat_gui[4], '', 'NONE', '', '', '')
else
  call s:hi('CursorLineNr', g:nightcat_gui[6], g:nightcat_gui[19], 'NONE', g:nightcat_term[10], '', '')
  call s:hi('CursorLineNrNC', g:nightcat_gui[4], g:nightcat_gui[0], 'NONE', g:nightcat_term[0], '', '')
endif
call s:hi('Folded', g:nightcat_gui[3], g:nightcat_gui[1], g:nightcat_term[3], g:nightcat_term[1], s:bold, '')
call s:hi('FoldColumn', g:nightcat_gui[3], 'NONE', g:nightcat_term[3], 'NONE', '', '')
call s:hi('SignColumn', g:nightcat_gui[1], 'NONE', g:nightcat_term[1], 'NONE', '', '')

"+--- Navigation ---+
call s:hi('Directory', g:nightcat_gui[8], '', g:nightcat_term[8], 'NONE', '', '')

"+--- Prompt/Status ---+
call s:hi('EndOfBuffer', g:nightcat_gui[1], '', g:nightcat_term[1], 'NONE', '', '')
call s:hi('ErrorMsg', g:nightcat_gui[4], g:nightcat_gui[11], 'NONE', g:nightcat_term[11], '', '')
call s:hi('ModeMsg', g:nightcat_gui[4], '', '', '', '', '')
call s:hi('MoreMsg', g:nightcat_gui[4], '', '', '', '', '')
call s:hi('Question', g:nightcat_gui[4], '', 'NONE', '', '', '')
call s:hi('StatusLine', g:nightcat_gui[8], g:nightcat_gui[3], g:nightcat_term[8], g:nightcat_term[3], 'NONE', '')
call s:hi('StatusLineNC', g:nightcat_gui[4], g:nightcat_gui[3], 'NONE', g:nightcat_term[3], 'NONE', '')
call s:hi('StatusLineTerm', g:nightcat_gui[8], g:nightcat_gui[3], g:nightcat_term[8], g:nightcat_term[3], 'NONE', '')
call s:hi('StatusLineTermNC', g:nightcat_gui[4], g:nightcat_gui[3], 'NONE', g:nightcat_term[3], 'NONE', '')
call s:hi('WarningMsg', g:nightcat_gui[0], g:nightcat_gui[13], g:nightcat_term[1], g:nightcat_term[13], '', '')
call s:hi('WildMenu', g:nightcat_gui[8], g:nightcat_gui[1], g:nightcat_term[8], g:nightcat_term[1], '', '')

"+--- Search ---+
call s:hi('IncSearch', g:nightcat_gui[6], g:nightcat_gui[10], g:nightcat_term[6], g:nightcat_term[10], s:underline, '')
call s:hi('Search', g:nightcat_gui[1], g:nightcat_gui[7], g:nightcat_term[1], g:nightcat_term[8], 'NONE', '')

"+--- Tabs ---+
call s:hi('TabLine', g:nightcat_gui[4], g:nightcat_gui[1], 'NONE', g:nightcat_term[1], 'NONE', '')
call s:hi('TabLineFill', g:nightcat_gui[4], g:nightcat_gui[1], 'NONE', g:nightcat_term[1], 'NONE', '')
call s:hi('TabLineSel', g:nightcat_gui[8], g:nightcat_gui[3], g:nightcat_term[8], g:nightcat_term[3], 'NONE', '')

"+--- Window ---+
call s:hi('Title', g:nightcat_gui[4], '', 'NONE', '', 'NONE', '')

if g:nightcat_bold_vertical_split_line == 0
  call s:hi('VertSplit', g:nightcat_gui[2], '', g:nightcat_term[3], 'NONE', 'NONE', '')
else
  call s:hi('VertSplit', g:nightcat_gui[2], g:nightcat_gui[1], g:nightcat_term[3], g:nightcat_term[1], 'NONE', '')
endif

"+--- Conceal ---+
call s:hi('Conceal', g:nightcat_gui[14], g:nightcat_gui[18], 'NONE', '', '', '')

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi('Boolean', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Character', g:nightcat_gui[19], '', g:nightcat_term[14], '', '', '')
call s:hi('Comment', g:nightcat_gui["3_bright"], '', g:nightcat_term[3], '', s:italicize_comments, '')
call s:hi('Conditional', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Constant', g:nightcat_gui[4], '', 'NONE', '', '', '')
call s:hi('Define', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Delimiter', g:nightcat_gui[6], '', g:nightcat_term[6], '', '', '')
call s:hi('Exception', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Float', g:nightcat_gui[15], '', g:nightcat_term[15], '', '', '')
call s:hi('Function', g:nightcat_gui[15], '', g:nightcat_term[8], '', '', '')
call s:hi('Identifier', g:nightcat_gui[4], '', 'NONE', '', 'NONE', '')
call s:hi('Include', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Keyword', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Label', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Number', g:nightcat_gui[15], '', g:nightcat_term[15], '', '', '')
call s:hi('Operator', g:nightcat_gui[9], '', g:nightcat_term[9], '', 'NONE', '')
call s:hi('PreProc', g:nightcat_gui[9], '', g:nightcat_term[9], '', 'NONE', '')
call s:hi('Repeat', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Special', g:nightcat_gui[4], '', 'NONE', '', '', '')
call s:hi('SpecialChar', g:nightcat_gui[13], '', g:nightcat_term[13], '', '', '')
call s:hi('SpecialComment', g:nightcat_gui[8], '', g:nightcat_term[8], '', s:italicize_comments, '')
call s:hi('Statement', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('StorageClass', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('String', g:nightcat_gui[19], '', g:nightcat_term[14], '', '', '')
call s:hi('Structure', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('Tag', g:nightcat_gui[4], '', '', '', '', '')
call s:hi('Todo', g:nightcat_gui[13], 'NONE', g:nightcat_term[13], 'NONE', '', '')
call s:hi('Type', g:nightcat_gui[9], '', g:nightcat_term[9], '', 'NONE', '')
call s:hi('Typedef', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi('asciidocAttributeEntry', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')
call s:hi('asciidocAttributeList', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')
call s:hi('asciidocAttributeRef', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')
call s:hi('asciidocHLabel', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('asciidocListingBlock', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('asciidocMacroAttributes', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
call s:hi('asciidocOneLineTitle', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
call s:hi('asciidocPassthroughBlock', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
call s:hi('asciidocQuotedMonospaced', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('asciidocTriplePlusPassthrough', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi('awkCharClass', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('awkPatterns', g:nightcat_gui[9], '', g:nightcat_term[9], '', s:bold, '')
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi('cIncluded', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi('cmakeGeneratorExpression', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi('cssAttributeSelector', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('cssDefinition', g:nightcat_gui[7], '', g:nightcat_term[7], '', 'NONE', '')
call s:hi('cssIdentifier', g:nightcat_gui[7], '', g:nightcat_term[7], '', s:underline, '')
call s:hi('cssStringQ', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi('dosiniHeader', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
hi! link dosiniLabel Type

call s:hi('dtBooleanKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('dtExecKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('dtLocaleKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('dtNumericKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('dtTypeKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:nightcat_uniform_diff_background == 0
  call s:hi('DiffAdd', g:nightcat_gui[14], '', g:nightcat_term[14], 'NONE', 'inverse', '')
  call s:hi('DiffChange', g:nightcat_gui[13], '', g:nightcat_term[13], 'NONE', 'inverse', '')
  call s:hi('DiffDelete', g:nightcat_gui[11], 'black', g:nightcat_term[11], 'NONE', 'inverse', '')
  call s:hi('DiffText', g:nightcat_gui[9], '', g:nightcat_term[9], 'NONE', 'inverse', '')

  hi! NeogitCursorLine gui=nocombine
  call s:hi('NeogitDiffAdd', 'DarkBlue', g:nightcat_gui[14], '', g:nightcat_term[14], '', '')
  call s:hi('NeogitDiffAddHighlight', 'DarkBlue', g:nightcat_gui[14], '', g:nightcat_term[14], '', '')
  call s:hi('NeogitDiffDelete', 'black', g:nightcat_gui[11], '', g:nightcat_term[11], '', '')
  call s:hi('NeogitDiffDeleteHighlight', 'black', g:nightcat_gui[11], '', g:nightcat_term[11], '', '')
else
  call s:hi('DiffAdd', g:nightcat_gui[14], g:nightcat_gui[1], g:nightcat_term[14], g:nightcat_term[1], '', '')
  call s:hi('DiffChange', g:nightcat_gui[13], g:nightcat_gui[1], g:nightcat_term[13], g:nightcat_term[1], '', '')
  call s:hi('DiffDelete', g:nightcat_gui[11], g:nightcat_gui[1], g:nightcat_term[11], g:nightcat_term[1], '', '')
  call s:hi('DiffText', g:nightcat_gui[9], g:nightcat_gui[1], g:nightcat_term[9], g:nightcat_term[1], '', '')
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi('gitconfigVariable', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')

call s:hi('goBuiltins', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link goConstants Keyword

call s:hi('helpBar', g:nightcat_gui[3], '', g:nightcat_term[3], '', '', '')
call s:hi('helpHyperTextJump', g:nightcat_gui[8], '', g:nightcat_term[8], '', s:underline, '')

call s:hi('htmlArg', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('htmlLink', g:nightcat_gui[4], '', '', '', 'NONE', 'NONE')
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi('javaDocTags', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi('jsonKeyword', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')

call s:hi('lessClass', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi('markdownBlockquote', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('markdownCode', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('markdownCodeDelimiter', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('markdownFootnote', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('markdownId', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('markdownIdDeclaration', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('markdownH1', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
call s:hi('markdownLinkText', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
call s:hi('markdownUrl', g:nightcat_gui[4], '', 'NONE', '', 'NONE', '')
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi('perlPackageDecl', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')

call s:hi('phpClasses', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('phpDocTags', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi('podCmdText', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('podVerbatimLine', g:nightcat_gui[4], '', 'NONE', '', '', '')
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi('rubyConstant', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('rubySymbol', g:nightcat_gui[6], '', g:nightcat_term[6], '', s:bold, '')
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi('rustAttribute', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')
call s:hi('rustEnum', g:nightcat_gui[7], '', g:nightcat_term[7], '', s:bold, '')
call s:hi('rustMacro', g:nightcat_gui[8], '', g:nightcat_term[8], '', s:bold, '')
call s:hi('rustModPath', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('rustPanic', g:nightcat_gui[9], '', g:nightcat_term[9], '', s:bold, '')
call s:hi('rustTrait', g:nightcat_gui[7], '', g:nightcat_term[7], '', s:italic, '')
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi('sassClass', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('sassId', g:nightcat_gui[7], '', g:nightcat_term[7], '', s:underline, '')
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi('vimAugroup', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('vimMapRhs', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('vimNotation', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi('xmlAttrib', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('xmlCdataStart', g:nightcat_gui["3_bright"], '', g:nightcat_term[3], '', s:bold, '')
call s:hi('xmlNamespace', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi('yamlBlockMappingKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi('ALEWarningSign', g:nightcat_gui[13], '', g:nightcat_term[13], '', '', '')
call s:hi('ALEErrorSign' , g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
call s:hi('ALEWarning' , g:nightcat_gui[13], '', g:nightcat_term[13], '', 'undercurl', '')
call s:hi('ALEError' , g:nightcat_gui[11], '', g:nightcat_term[11], '', 'undercurl', '')

" Coc
" > neoclide/coc
call s:hi('CocWarningSign', g:nightcat_gui[13], '', g:nightcat_term[13], '', '', '')
call s:hi('CocErrorSign' , g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
call s:hi('CocInfoSign' , g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
call s:hi('CocHintSign' , g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')

" GitGutter
" > airblade/vim-gitgutter
call s:hi('GitGutterAdd', g:nightcat_gui[14], '', g:nightcat_term[14], '', '', '')
call s:hi('GitGutterChange', g:nightcat_gui[13], '', g:nightcat_term[13], '', '', '')
call s:hi('GitGutterChangeDelete', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
call s:hi('GitGutterDelete', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')

" Signify
" > mhinz/vim-signify
call s:hi('SignifySignAdd', g:nightcat_gui[14], '', g:nightcat_term[14], '', '', '')
call s:hi('SignifySignChange', g:nightcat_gui[13], '', g:nightcat_term[13], '', '', '')
call s:hi('SignifySignChangeDelete', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
call s:hi('SignifySignDelete', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')

" fugitive.vim
" > tpope/vim-fugitive
call s:hi('gitcommitDiscardedFile', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
call s:hi('gitcommitUntrackedFile', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
call s:hi('gitcommitSelectedFile', g:nightcat_gui[14], '', g:nightcat_term[14], '', '', '')

" davidhalter/jedi-vim
call s:hi('jediFunction', g:nightcat_gui[4], g:nightcat_gui[3], '', g:nightcat_term[3], '', '')
call s:hi('jediFat', g:nightcat_gui[8], g:nightcat_gui[3], g:nightcat_term[8], g:nightcat_term[3], s:underline.s:bold, '')

" NERDTree
" > scrooloose/nerdtree
call s:hi('NERDTreeExecFile', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi('plugDeleted', g:nightcat_gui[11], '', '', g:nightcat_term[11], '', '')

" vim-signature
" > kshenoy/vim-signature
call s:hi('SignatureMarkText', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi('haskellPreProc', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')
call s:hi('haskellType', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi('jsGlobalNodeObjects', g:nightcat_gui[8], '', g:nightcat_term[8], '', s:italic, '')
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi('mkdCode', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')
call s:hi('mkdFootnote', g:nightcat_gui[8], '', g:nightcat_term[8], '', '', '')
call s:hi('mkdRule', g:nightcat_gui[10], '', g:nightcat_term[10], '', '', '')
call s:hi('mkdLineBreak', g:nightcat_gui[9], '', g:nightcat_term[9], '', '', '')
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists('g:vimwiki_hl_headers') || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi('VimwikiHeader'.s:i, g:nightcat_gui[8], '', g:nightcat_term[8], '', s:bold, '')
  endfor
else
  let s:vimwiki_hcolor_guifg = [g:nightcat_gui[7], g:nightcat_gui[8], g:nightcat_gui[9], g:nightcat_gui[10], g:nightcat_gui[14], g:nightcat_gui[15]]
  let s:vimwiki_hcolor_ctermfg = [g:nightcat_term[7], g:nightcat_term[8], g:nightcat_term[9], g:nightcat_term[10], g:nightcat_term[14], g:nightcat_term[15]]
  for s:i in range(1,6)
    call s:hi('VimwikiHeader'.s:i, s:vimwiki_hcolor_guifg[s:i-1] , '', s:vimwiki_hcolor_ctermfg[s:i-1], '', s:bold, '')
  endfor
endif

call s:hi('VimwikiLink', g:nightcat_gui[8], '', g:nightcat_term[8], '', s:underline, '')
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi('yamlKey', g:nightcat_gui[7], '', g:nightcat_term[7], '', '', '')

call s:hi('GitSignsAdd', g:nightcat_gui[14], '', g:nightcat_term[14], '', '', '')
" call s:hi('GitSignsAddNr')
" call s:hi('GitSignsAddLn')

call s:hi('GitSignsChange', g:nightcat_gui[13], '', g:nightcat_term[13], '', '', '')
" call s:hi('GitSignsChangeNr')
" call s:hi('GitSignsChangeLn')

call s:hi('GitSignsDelete', g:nightcat_gui[11], '', g:nightcat_term[11], '', '', '')
" call s:hi('GitSignsDeleteNr')
" call s:hi('GitSignsDeleteLn')

call s:hi('MarkSignHL', g:nightcat_gui[16], '', 'NONE', g:nightcat_term[16], s:italic, '')
call s:hi('MarkSignNumHL', g:nightcat_gui[4], '', 'NONE', '', s:bold . s:italic, '')
