" Système de templates
au bufNewFile *.html 0r~/.vim/templates/xhtml.html

" Copier (le gv c'est pour remettre le sélection)
map <C-c> "+y

" Couper
map <C-x> "+x

" Coller
map <C-p> "+gP

" Aller dans le répertoire du fichier édité.
function! ChangeToFileDirectory()
    if bufname("") !~ "^ftp://" " C'est impératif d'avoir un fichier local !
        lcd %:p:h
    endif
endfunction

map ,fd :call ChangeToFileDirectory()<CR>


cabbrev scp !scp % erouzel@dedibox:/var/www/coopformat/%
cabbrev scppsychasoc !scp % erouzel@dedibox:/var/www/psychasoc/%

let mapleader = ","

" Quitte en sauvegardant la session courantemap
map ,q :mks!\|qa<CR>

" Ouvrir un fichier dans l'arborescence courante
if has("unix")
    map ,t :tabe <C-R>=expand("%:h") . "/" <CR>
else
   map ,t :tabe <C-R>=expand("%:h") . "\" <CR>
endif

" Raccourcis HTML
function! RemplacerAccentsHTML ()
    exec "g/é/s//\\&eacute;/g | g/è/s//\\&egrave;/g | g/ê/s//\\&ecirc;/g | g/à/s//\\&agrave;/g | g/ç/s//\\&ccedil;/g"
endfunction
    
" Abbréviations pour CSS
iabbrev csssec /*******************************<CR>____<CR>/<CR>

" Abbréviations pour php
iabbrev phpcode <?php ____;?>
iabbrev phpdump echo "<pre>";var_dump(____);echo "</pre>";
iabbrev phpfe foreach(____ as $k => $val)<CR>{<CR>}<CR>
iabbrev phpfcn $node = eZFunctionHandler::execute('content','node', array('node_id' => ____));

" Abbréviations pour eZ Publish
iabbrev ezfcn {def $noeud = fetch(content, node, hash( node_id, ____)}
iabbrev ezavg {attribute_view_gui attribute=____}
iabbrev ezats {____ \| attribute(show)}
iabbrev ezfe {foreach ____ as $k => $val}<CR><CR>{/foreach}
imap <C-W> <ESC>?____<CR>cw
syntax match Error / ____ /

set laststatus=2
set statusline=%f\ %1*%m%*%10l/%2*%L%*%6c%V
"set statusline=%F%m\ %r\ Line:%l\/%L,%c\ %p%%
"set statusline=%f\ %1*%m%*%10l/%2*%L%*%6c%V\ \ %{strftime('%H:%M')}

" Ouvrir feuille de style
map <S-S> :vsp design/psychasoc/stylesheets/psychasoc.css<CR>:vertical resize -20<CR>

" Quitter fichier
map <C-S-Q> :q<CR>

" Ouvrir memo raccourcis vi
map <C-S-A> :vsp ~/notes/virac<CR>:vertical resize -40<CR>

" Prise de notes
map <C-N> :vsp ~/notes/buffer.memo<CR>

" Edition rapide .vimrc
map <C-B> :vsp ~/.vimrc<CR>

" Mise à jour rapide .vimrc
map <C-H> :source ~/.vimrc<CR>

" Vider les caches ez Publish
map <C-G> :!php bin/php/ezcache.php --clear-all<CR><CR>

" Correction du copier-coller
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

nnoremap <F6> :set nonu<Enter>:set mouse=c<Enter>
nnoremap <F7> :set nu<Enter>:set mouse=a<Enter>
nnoremap <F8> :set hlsearch!<cr>:set hlsearch?<cr>

" Mets en commentaire
"map <F9> <Leader>c
"imap <F9> <esc><F9>

" vmap g :<C-U>!firefox "http://www.google.fr/search?hl=fr&q=<cword>&btnG=Recherche+Google&meta=" >& /dev/null<CR><CR>
vmap w :<C-U>!firefox "http://fr.wikipedia.org/wiki/<cword>" >& /dev/null<CR><CR>
vmap e :<C-U>!firefox "http://ez.no/doc/content/advancedsearch?&SearchText=<cword>" >& /dev/null<CR><CR>
vmap h :<C-U>!firefox "http://fr3.php.net/manual-lookup.php?pattern=<cword>&lang=fr" >& /dev/null<CR><CR>
vmap r :<C-U>!rgrep <cword> *<CR>
vmap n :<C-U>!find . -name <cword><CR>

" Tabulations avec la touche tab en mode commande et visuel
vnoremap <TAB> >
nnoremap <TAB> >>
vnoremap <S-TAB> <
nnoremap <S-TAB> <<

" Sélectionner un mot en mode visuel
" map <C-W> viw 

" Changer d'onglet
map <A-Up> gT
map <A-Down> gt

" Saute une ligne en mode commande
map <CR> o<ESC>

"Complétion du nom de fichier à la BASH quand on fait ':e [Tab]'
set wildmode=longest:list,list:full

" Permet le shift-insert fonctionnel comme dans les Xterm
map! <S-Insert> <MiddleMouse>

" Copier-coller en utilisant le registre a
vmap <Leader>c "ay
map <Leader>v "ap
imap <C-V> <ESC>"api

" Deplace la ligne courante vers le bas
nmap <C-j> :move .+1<CR>
" Deplace la ligne courante vers le haut
nmap <C-k> :move .-2<CR>

" Tout sÃ©lÃ©ctionner (window$'s style)
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G

" Converts file format to/from unix
"command Unixformat :set ff=unix
"command Dosformat :set ff=dos

" Annuler aka Undo (window$'s style)
inoremap <C-Z> <C-O>u
noremap <C-Z> u

" Shift-Fleche pour selectionner un bloc
map <S-Up> vk
vmap <S-Up> k
map <S-Down> vj
vmap <S-Down> j
map <S-Right> v
vmap <S-Right> l
map <S-Left> v
vmap <S-Left> h

" Fait clignoter l'Ã©cran lors d'une erreur de saisie, de commande etc...
set visualbell

" Rend la ligne de commande de 2 lignes plus grande
" set ch=2

" On ignore la casse des caractÃ¨res dans les recherches de chaÃ®nes.
set ignorecase

" No ignorecase if Uppercase chars in search
set scs

set nu
set expandtab
set smarttab autoindent

set nocompatible                " pas compatibilité avec vi

" priorité faible pour les fichiers avec les extensions
" suivantes lors du complètement
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=500                 " 250 lignes dans l'historique
set ruler                       " affiche la position du curseur en bas
set sm                          " jump to matches during entering the pattern
 
set formatoptions=tcroqn        " indentation
set cin
set textwidth=0                 " pas de coupure de ligne par défaut
set backspace=2
set ts=4                        " tabulation sur 4 caractères
set sw=4                        " fixe à 4 le nombre d'espaces de l'indentation
 
set dir=~/tmp                   " fichier temporaire dans ~/tmp (il faut qu'il existe !)
set nobackup                    " fichier backup désactivé
set backupdir=~/bak
set autowrite
 
set incsearch                   " recherche au fur et à mesure
 
syntax on                       " coloration syntaxique
set background=dark             " fond noir par défaut
set mouse=a

" Améliore l'affichage en disant à vim que nous utilisons un terminal rapide
set ttyfast

""""" viminfo """""
" '1000     nombre de fichiers dont il faut conserver les marques
" f1        active l'enregistrement des marques
" \"500     nombre de lignes à enregistrer pour chaque registre
" :500      mémoriser 500 lignes pour chaque registre
" n[file]   fichier viminfo
" set viminfo='1000,f1,\"500,:500,/50,n~/.vim/global.viminfo

filetype plugin on
filetype indent on
