program collatz

integer(kind = 8), dimension(10, 2) :: resultArray
integer :: min, valLength
integer(kind = 8) :: i


resultArray = 0 !initialize all elements in array to 0

do i = 0, 4999999999_8 !iterate through all integers less than 5 billion
    valLength = sequenceLength(i)
    min = minIndex(resultArray)

    if (valLength == resultArray(min, 2)) then
        if (i < resultArray(min, 1)) then
            resultArray(min, 1) = i
            resultArray(min, 2) = valLength
        end if
    else
        if (valLength > resultArray(min, 2)) then
            resultArray(min, 1) = i
            resultArray(min, 2) = valLength
        end if
    end if

end do

call bubble_sort(resultArray)

do i = 1, 10
    print *, resultArray(i,1), " has a sequence length of ", resultArray(i,2)
end do


contains

    integer function sequenceLength(num)
        integer(kind = 8), intent(in) :: num
        integer(kind = 8) :: i
        integer :: length
        i = num
        length = 0
        do while ( i /= 1 )
           if ( mod(i,2) == 0 ) then  ! If even divide by 2
             i = i / 2
           else
             i = i * 3 + 1            ! If odd multiply by 3 and add 1
           endif
           length = length + 1                ! Increment counter
        end do
        sequenceLength = length
    end function sequenceLength

    !finds the index of the minimum element of the array
    integer function minIndex(array)
        integer(kind = 8), dimension(10,2), intent(in) :: array
        integer :: i
        minIndex = 1
        do i = 1, 10
            if (array(i, 2) == array(minIndex, 2)) then
                if (array(i,1) > array(minIndex, 1)) then
                    minIndex = i
                end if
            else
                if (array(i,2) < array(minIndex, 2)) then
                    minIndex = i
                end if
            end if
        end do
    end function minIndex

    !sorts the two-dimensional array a first by column two, then by column 1
    subroutine bubble_sort(a)
      integer(kind = 8), intent(in out), dimension(10, 2) :: a
      integer(kind = 8) :: temp1, temp2
      integer :: i, j
      logical :: swapped

      do j = 9, 1, -1
        swapped = .false.
        do i = 1, j

            if (a(i,2) == a(i+1, 2)) then
                if (a(i,1) < a(i+1, 1)) then
                    temp1 = a(i,1)
                    temp2 = a(i,2)
                    a(i,1) = a(i+1,1)
                    a(i,2) = a(i+1,2)
                    a(i+1,1) = temp1
                    a(i+1,2) = temp2
                    swapped = .true.
                end if
            else
                if (a(i,2) > a(i+1,2)) then
                    temp1 = a(i,1)
                    temp2 = a(i,2)
                    a(i,1) = a(i+1,1)
                    a(i,2) = a(i+1,2)
                    a(i+1,1) = temp1
                    a(i+1,2) = temp2
                    swapped = .true.
                end if
            end if
        end do
        if (.not. swapped) exit
      end do
    end subroutine bubble_sort


end program collatz
