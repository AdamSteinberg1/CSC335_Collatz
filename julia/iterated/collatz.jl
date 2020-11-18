#!/usr/bin/julia
import Base.isless

function sequenceLength(num::Integer)
    length = 0
    while num > 1
        if num%2 == 0
            num = num ÷ 2
        else
            num = num * 3 + 1
        end
        length += 1
    end
    return length
end

struct elem
    num
    length
end

function isless(a::elem, b::elem)
    if a.length == b.length
        return a.num > b.num
    else
        return a.length < b.length
    end
end


result = fill(elem(0,0), 10)

for i = 1:4999999999999 #change to 4999999999999
    newElem = elem(i, sequenceLength(i))
    minIndex = argmin(result)
    if isless(result[minIndex], newElem)
        result[minIndex] = newElem
    end
end

sort!(result)

for e in result
    println("$(e.num) has a length of $(e.length)")
end
