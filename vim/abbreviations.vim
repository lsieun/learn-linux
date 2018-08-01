function! s:AbbrAsk(abbr,expansion)
    let answer = confirm("Use the abbreviation '" . a:abbr . "'?", "&Yes\n&No", 1)
    if answer == 1
        return a:expansion
    else
        return a:abbr
    endif
endfunction

iabbrev <expr> addr <SID>AbbrAsk('addr', "your full address here")

iabbrev if_main if __name__ == '__main__':<cr><tab>pass