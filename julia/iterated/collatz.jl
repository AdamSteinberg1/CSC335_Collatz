#!/usr/bin/julia
import Base.isless

#iteratively calculate the sequence length of a number
function sequenceLength(num::Int64)
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

#a custom data type that has a number and it's sequence length
struct elem
    num
    length
end

#override isless for our custom data type
function isless(a::elem, b::elem)
    if a.length == b.length
        return a.num > b.num
    else
        return a.length < b.length
    end
end

function main()
    result = fill(elem(0,0), 10)

    for i = 1:4999999999999
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
end

main()
