program waveform
    implicit none
    integer :: n, i
    integer :: io_status, unit_num
    character(len = 100) :: line
    real, allocatable :: T(:), E1(:), E2(:), E3(:)


    open(newunit=unit_num, file = "../data/seisdata.txt", status = "old", action = "read")

    n = 0
    do
        read(unit_num, '(A)', iostat=io_status) line
        if (io_status /= 0) exit
        n = n + 1
    end do
    close(unit_num)
    allocate(T(n), E1(n), E2(n), E3(n))


    open(newunit=unit_num, file = "../data/seisdata.txt", status = "old", action = "read")
    do i = 1, n
        read(unit_num, *, iostat=io_status) T(i), E1(i), E2(i), E3(i)
        if (io_status /= 0) exit
    end do
    close(unit_num)


    print *, n

    print *, "Waveform of first 10 samples:"
    do i = 1, min(10, n)
        print *, T(i)
    end do

    do i = 1, min(10, n)
        print *, E1(i), E2(i), E3(i)
    end do



    deallocate(T, E1, E2, E3)
end program waveform