if g:env =~ 'WINDOWS'
    if executable("PowerShell")
        set shell=PowerShell
        set shellcmdflag="-ExecutionPolicy RemoteSigned -Command"
        set shellquote=\"
        set shellxquote=" "
    endif
endif
