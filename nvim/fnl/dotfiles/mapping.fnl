(module dotfiles.mapping
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

;; alias function
(def map nvim.set_keymap)

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (map mode from to {:noremap true}))

(map :n ";" ":" {:noremap true})

;; Leader is space key
(set nvim.g.mapleader " ")
;; LocalLeader is the comma key
(set nvim.g.maplocalleader ",")

;; packer
(util.nnoremap :pc "PackerClean")
(util.nnoremap :pg "PackerUpdate")
(util.nnoremap :pu "PackerSync")
(util.nnoremap :pi "PackerInstall")

;; Fugitive
(util.nnoremap :gs "vertical Git")
(util.nnoremap :gw "Gwrite")
(util.nnoremap :gc "G commit")
(util.nnoremap :gp "G push")
(util.nnoremap :gb "GBrowse")
(util.nnoremap :gy ".GBrowse!")

;; vim-better-whitespace
(util.nnoremap :sw "StripWhitespace")

(util.nnoremap :f "Telescope find_files")
(util.nnoremap :<enter> "Telescope git_files")
(util.nnoremap :<leader> "Telescope buffers")
(util.nnoremap :se "Telescope live_grep")

;; open-browser.vim
(nvim.ex.command_
  "-nargs=1 Browse"
  "OpenBrowser <args>")

(map :n :gx "<plug>(openbrowser-smart-search)" {})
(map :v :gx "<plug>(openbrowser-smart-search)" {})

;; vim-sneak
(nvim.ex.map :f "<plug>Sneak_f")
(nvim.ex.map :F "<plug>Sneak_F")
(nvim.ex.map :t "<plug>Sneak_t")
(nvim.ex.map :T "<plug>Sneak_T")

;; always move by visual lines, rather than real lines
;; this is useful when 'wrap' is set.
(noremap :n :j :gj {:silent true})
(noremap :n :k :gk {:silent true})
(noremap :v :j :gj {:silent true})
(noremap :v :k :gk {:silent true})

;; Navigate between matching brackets
;; These are specifically not `noremap`s because we want to be bound to
;; whatever % is (usually a plugin, matchit / matchup).
(map :n :<tab> :% {})
(map :v :<tab> :% {})

;; edit config files
(util.nnoremap :ev "e $HOME/.config/nvim/init.lua")
(util.nnoremap :ef "e $HOME/.config/fish/config.fish")
(util.nnoremap :eg "e $HOME/.config/git/config")

(util.nnoremap :w "w")
(util.nnoremap :q "q")
(util.nnoremap :cl "close")
(util.nnoremap :ss "split")
(util.nnoremap :vs "vsplit")

;; mnemonic: "Start Repl".
;; Invokes vim-dispatch to start an nREPL client in the background (in another tab).
;; Using Dispatch! instead of Start! so we can just make sure it's running in
;; the background; no need to open another tab.
(util.nnoremap :sr "Dispatch! clj -M:repl/nrepl")

;; tab mappings
(noremap :n "]r" ":tabnext<cr>")
(noremap :n "[r" ":tabprev<cr>")
(noremap :n :<leader>tn ":tabnew<cr>")

;; Use Q to repeat last macro, rather than going into ex mode
(noremap :n :Q "@@")

;; Swap the behavior of the ^ and 0 operators
;; ^ Usually goes to the first non-whitespace character, while 0 goes to the
;; first column in the line. ^ is more useful, but harder to hit, so swap it
;; with 0
(noremap :n :0 "^")
(noremap :n :^ "0")

;; always center the screen after any movement command
(noremap :n :<C-d> "<C-d>zz")
(noremap :n :<C-f> "<C-f>zz")
(noremap :n :<C-b> "<C-b>zz")
(noremap :n :<C-u> "<C-u>zz")

(noremap :n :<leader>/ ":nohlsearch<cr>")

;; Keep the cursor in place while joining lines
(noremap :n :J "mzJ`z")

;; similar to vmap but only for visual mode - NOT select mode
;; maintains the currently visual selection between invocations of '<' and '>'
(noremap :x :< "<gv")
(noremap :x :> ">gv")

;; jk escape sequences.
(noremap :i :jk :<esc>)
(noremap :c :jk :<c-c>)
(noremap :t :jk :<c-\><c-n>)

;; vim-test mappings
(map :n :t<C-n> ":TestNearest<cr>" {:silent true})
(map :n :t<C-f> ":TestFile<cr>" {:silent true})
(map :n :t<C-s> ":TestSuite<cr>" {:silent true})
(map :n :t<C-l> ":TestLast<cr>" {:silent true})
(map :n :t<C-g> ":TestVisit<cr>" {:silent true})

;; ale mappings
;; NOTE: these mappings should be overridden if attached to an nvim-lsp capable buffer
(map :n :<leader>af ":ALEFix<cr>" {})
(map :n "[w" "<plug>(ale_previous_wrap)" {})
(map :n "]w" "<plug>(ale_next_wrap)" {})
