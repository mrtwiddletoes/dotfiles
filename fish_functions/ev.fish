function ev --description 'Edit neovim config files'
    cd ~/.dotfiles/nvim; $EDITOR init.lua; cd -
end
