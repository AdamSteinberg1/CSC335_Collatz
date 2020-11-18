program collatz

integer :: j, i, ic 
print *, "Enter the starting integer:"
read *, j 
i=j
ic=0
do while ( i /= 1 )  
   if ( mod(i,2) == 0 ) then  ! If even divide by 2
     i = i / 2
   else
     i = i * 3 + 1            ! If odd multiply by 3 and add 1
   endif
   ic = ic + 1                ! Increment counter
   print *, i
enddo
print *, "A starting value of ", j, " has ", ic, " steps."

end program collatz
