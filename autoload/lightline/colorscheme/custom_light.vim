let s:fg     = '#d5dbe5'
let s:blue   = '#3993DD'
let s:green  = '#09BC8A'
let s:purple = '#E83F6F'
let s:red1   = '#F26419'
let s:red2   = '#F26419'
let s:yellow = '#F6AE2D'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}


" Light variant
let s:bg     = '#EEEEEE'
let s:gray1  = '#696773' " 深
let s:gray2  = '#EAEAEA' " 浅
let s:gray3  = '#C9C9C9' " 中

let s:p.normal.left     = [ [ s:bg, s:blue, 'bold'], [ s:gray1, s:gray3, 'bold'] ]
let s:p.normal.middle   = [ [ s:gray1, s:gray2 ] ]
let s:p.normal.right   = [ [ s:bg, s:blue, 'bold' ], [ s:bg, s:blue, 'bold' ] ]
let s:p.normal.error   = [ [ s:gray1,   s:gray3 ] ]
let s:p.normal.warning = [ [ s:gray1, s:gray3 ] ]

let s:p.insert.left     = [ [ s:bg, s:green, 'bold' ], [ s:gray1, s:gray3, 'bold'] ]
let s:p.insert.right   = [ [ s:bg, s:green, 'bold' ], [ s:bg, s:green, 'bold' ] ]

let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
let s:p.inactive.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.inactive.right  = [ [ s:bg, s:gray3 ], [ s:bg, s:gray3 ] ]

let s:p.replace.left    = [ [ s:bg, s:red1 ], [ s:gray1, s:gray3 ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:bg, s:red1, 'bold' ] ]

let s:p.visual.left     = [ [ s:bg, s:purple ], [ s:gray1, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:purple, 'bold' ], [ s:bg, s:purple, 'bold' ] ]
" Common




let s:p.tabline.left   = [ [ s:bg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#custom_light#palette = lightline#colorscheme#fill(s:p)
