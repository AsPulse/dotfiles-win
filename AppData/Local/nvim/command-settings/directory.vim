command! Editprofile e $POSH_PROFILE
command! Editrc cd $CHEZMOI | Fern . -reveal=AppData/Local/nvim/init.vim
command! Reloadrc call s:reload()
command! Gogithub e $GHDEV
command! -nargs=1 Gorepo cd $GHDEV/<args> | Fern .

function! s:reload()
  !chezmoi apply
  call timer_start(100, { _ -> execute("source $NVIM/init.vim") })
endfunction

