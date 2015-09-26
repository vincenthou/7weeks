//Loops
loop("Haha" println)//Infinite loop
i := 1
while(i <= 10, i println; i := i + 1);
for (i, 1, 10, i println); "This show up after loops"
//Skip 2 number, it is the 4th argument, may be harmful if ignore
for (i, 1, 10, 2, i println); "This show up after loops"

//Condition
if(true, "true", "false")
if(true) then("true" println) else("false" println)

//Operator overriding
OperatorTable
OperatorTable addOperator("xor", 11) //Set priority
//Add methods for proto
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))
true xor false
true xor true

//Message
postOffice := Object clone
postOffice pkgSender := method(call sender)
mailer := Object clone
mailer deliver := method(postOffice pkgSender)
postOffice pkgTarget := method(call target)
postOffice pkgTarget
mailer recieve := method(postOffice pkgTarget)
mailer recieve //It is the postOffice object address
postOffice msgArgs := method(call message arguments)
postOffice msgName := method(call message name)
postOffice msgArgs("one", 2, :three)
postOffice msgName
//doMessage like eval
unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)

unless(1 == 2, write("One is not two"), write("One is two"))
test unless(trueLove, ("It is not" println), ("It is true", println))

Object ancestors := method(
    prototype := self proto
    if(prototype != Object,
    writeln("Slots of ", prototype type, "\n--")
    prototype slotNames foreach(slotNames, writeln(slotName))
    writeln
    prototype ancestors))

Animal := Object clone
Animal speak := method("animal speak" println)
Duck := Animal clone
Duck speak := method("duck speak" println)
Duck run := method("duck run" println)
disco := Duck clone
disco ancestors