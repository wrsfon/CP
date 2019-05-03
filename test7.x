x -> 243.
loop i -> (1,10,2)
    cmp x < 0xAF {
        show "0xAF\nis greater".
        loop j -> (1,5,1)
            x -> x + 1.
        fin.
    }.
    x -> x - 20.
fin.
show x.
 
