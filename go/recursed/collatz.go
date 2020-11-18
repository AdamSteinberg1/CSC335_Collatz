package main

import "fmt"
import "sort"

func sequenceLength(num int) int {
    length := 0
    for num > 1    {
        if num%2 == 0        {
            num = num / 2
        }        else        {
            num = num * 3 + 1
        }
        length += 1
    }
    return length
}

//a custom elem type that contains a num and it's sequence length
type elem struct {
    num int
    length  int
}

//compare elems first by length then by num
func compareElems(e1, e2 elem) bool {
    if e1.length == e2.length {
        return e1.num > e2.num
    }    else {
        return e1.length < e2.length
    }
}

//all these things are need to sort with the custom type elem
type byLength []elem

func (s byLength) Len() int {
    return len(s)
}
func (s byLength) Swap(i, j int) {
    s[i], s[j] = s[j], s[i]
}
func (s byLength) Less(i, j int) bool {
    return compareElems(s[i], s[j])
}

func main() {

   resultArray := make([]elem, 10)
   myNum := 9
   myElem := elem{myNum,sequenceLength(myNum)}
   fmt.Printf("%d has a length %d\n", myElem.num, myElem.length)

   resultArray[5] = elem{-1,-1}

   sort.Sort(byLength(resultArray))

   fmt.Println(resultArray)

}
