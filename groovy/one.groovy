List list = ["Test", "Rx", "Session", "today", "ok"]
println list.findAll{ it == "Rx"}// returns list

println list.find{it == "Test"}// returns first element

println list.eachWithIndex {i, index ->
    println index + "......" + i
}
println list.reverse()
//println list.reverseEach{
//    println it
//}        