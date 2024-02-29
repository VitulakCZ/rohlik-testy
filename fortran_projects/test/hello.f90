program hello
    implicit none
    character(len=*),parameter :: free='(*(g0,1x))'
    integer :: a, b, error
    character(len=1) :: input

1   write(*, free, advance="no") "Kolik rohlíků?"
    error = 1
    read (*, *, err=4) a
    
2   write(*, free, advance="no") "Kolik zaplatíš?"
    error = 2 
    read (*, *, err=4) b
    if (b >= a * 3) then
        goto 5
    endif

3   write(*, free, advance="no") "To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit:"
    error = 3
    read (*, *, err=4) input
    if (input == "Z" .or. input == "z") then
        goto 1
    elseif (input == "C" .or. input == "c") then
        goto 2
    elseif (input == "E" .or. input == "e") then
        goto 6
    else
        print free, "Jsi kokot!"
        goto 3
    endif
4   print free, "Jsi kokot!"
    if (error == 1) then
        goto 1
    elseif (error == 2) then
        goto 2
    else
        goto 3
    endif
5   print free, a
6   write(*, free, advance="no")
end program hello
