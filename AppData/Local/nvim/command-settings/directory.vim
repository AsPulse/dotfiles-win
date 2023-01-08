command! Editprofile e $POSH_PROFILE
command! Editrc cd $NVIM | Fern .  
command! Reloadrc source $NVIM/init.vim
command! Gogithub e $GHDEV
command! -nargs=1 Gorepo cd $GHDEV/<args> | Fern .
