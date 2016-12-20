set autoindent
syntax on
set nocompatible    "Añade nuevas funciones a vi
filetype off
set expandtab       "Inserta tabulaciones en lugar de espacios
set softtabstop=4

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux' "latex-suite utility

set autoindent      "Autoidentado
set cindent         "Identado para C
set smartindent     "Más autoidentado
set number          "Muestra los números de las líneas
set shiftwidth=4    "Número de espacios en lugar de tab para identación

set ruler           "Añade la barra de información
set so=7            "Número de lineas a mantener cuando se hace scroll

set ignorecase      "Ignora mayúsculas y minúsculas en las búsquedas
set incsearch       "Búsquedas incrementales
set hlsearch        "Resaltado de los resultados de búsquedas
set showmatch       "Resalta paréntesis o llaves complementarios"

color industry      "Esquema de colores oscuro
"color zazen 

"Formato de la línea de estado
set statusline=%F%m%r%h%w\ [ASCII=\%03.3b]\ [0x\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2    "Mostrar línea de estado

"Mapeado de teclas para compilación y upload del sketch Arduino
map <f5> :!scons<cr>            
map <f6> :!scons upload<cr>

"Asociación de extensión con fichero de sintaxis
au BufNewFile,BufRead *.pde setf arduino

execute pathogen#infect()
syntax on
filetype plugin indent on
cmap w!! w !sudo tee > /dev/null %
