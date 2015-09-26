//Objects, messages between objects

"Hello IO" print

Vehicle := Object clone
Vehicle name := "VCar"
Vehicle name = "VCCar"
Vehicle slotNames
Vehicle type //Default slot

Car := Vehicle clone

ferrari := Car clone
ferrari slotNames //No slots
Ferrari := Car clone //Uppercase indicate a type
Ferrari getSlot("type")

method() type //Block type
Car drive := method("Running" println)
ferrari drive //Running

Lobby //List all the named objects

names := list("Vincent", "Jerry", "Tom")
names size
names append("Ted")

list(1,2,3) average
list(1,2,3) sum
list(1,2,3) prepend(0)
list() isEmpty

person := Map clone
person atPut("name", "Vincent")
person at("name")
person asObject //transform map as plain object
person asList //list(list("name","Vincent"))
person keys
person size

true or false
true and 0 //true
true proto
false clone //false
nil clone //nil

//Singleton
Calendar := Object clone
Calendar clone := Calendar //Override the clone method 
cal1 := Calendar clone
cal2 := Calendar clone
cal1 == cal2