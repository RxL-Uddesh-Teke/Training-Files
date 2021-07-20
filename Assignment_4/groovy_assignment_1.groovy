// Question 1
import groovy.transform.InheritConstructors
//pritnln ("Q1")
class Person{
    String name;
    int age;
    String gender;
    String address;
    
    Person(String name, int age, String gender, String address){
        this.name = name
        this.age = age;
        this.gender = gender;
        this.address = address;
    }
    
    String getName(){
        return this.name;
    }
    
    int getAge(){
        return this.age;
    }
    
    String getGender(){
        return this.gender;
    }
    
    String getAddress(){
        return this.address;
    }
    
}

Person pr1 = new Person("uddesh", 22,"male","ahmednagar")
println pr1.name + pr1.age+pr1.gender+pr1.address

println pr1.getName()+pr1.getAge()+pr1.getGender()+pr1.getAddress()

//// Question 2
//
//pritnln ("=========== Q2 ===========")
@InheritConstructors
class Employee extends Person {
    int empID;
    String company;
    int salary;
    
    
    Employee(int empID, String company, int salary){
//        super.name = name;
//        super.age = age;
//        super.gender = gender;
//        super.address = address;
        this.empID = empID;
        this.company = company;
        this.salary = salary;
    }
    
    int getEmpid(){
        return this.empID;
    }
    
    String getCompany(){
        return this.company;
    }
    
    int getSalary(){
        return this.salary;
    }
    
    String toString(){
        return "${super.name} + ${super.age} + ${super.gender}  + ${super.address} + ${this.empID} + ${this.company} + ${this.salary}";
    }
}
println pr1.name

def emp = new Employee("",123, "rx", "")
//println emp.empID+emp.company+emp.salary
//println emp.getEmpid()+emp.getCompany()+emp.getSalary()


// Q3
Range r = 0..3
r.each{
    int x = Math.pow(2,it);
    for(int i = 0; i < x ; i++) print "*"
    println ""
}

//Q4*/

emp.toString()

// Q5
//def test = "" false
//def test = " " true
//def test = 0 false
//def test = 1 true
//def test = -5 true
//def test = 7-10 true
//def test = 2.3 true
//def test = 0.0 false
//def test = -0.4 true
//def test = null false
//List test = [] false
List test = new ArrayList()


if(test) {println "this is true ${test}"}
else {println "it is false ${test}"}


// Q6
class HourMinute{
    int hour
    int minute
    
}

// Q7
Range r11 = 1..10
int x = 3
r11.each{
    print " " + 3*it
}
println ""
for(int i = 1; i < 11; i++){
    print " "+x*i 
}
println ""
while(x <= 30){
    print " "+x
    x+=3
}

//Q8
List list = [1,2,3,4,5]
int x1 = 4
def print_In = {List l, def x11 -> println l.contains(x11) }

print_In(list,x1)

//Q9// Get a writer to your new file
new File( '/tmp/newfile.txt' ).withWriter { w ->

  // For each input file path
  ['/tmp/1.txt', '/tmp/2.txt', '/tmp/3.txt'].each { f ->

    // Get a reader for the input file
    new File( f ).withReader { rw ->

      // And write data from the input into the output
      w << rw << '\n'
    }
  }
}

//Q10
new File('/tmp/oddfile.txt').withWriter{w1 ->
    ['/tmp/newfile.txt'].each{f ->
        new File(f).eachLine{currentline, lineNumber ->
            if(lineNumber%2==1){
                w1 << "${lineNumber} ${currentline} \n"
                println "${lineNumber} ${currentline}"
            }
        }
    }
}

//Q11
File file = new File('/tmp/oddfile.txt')
String a = file.toString()
a.replaceAll(" ","")
println a

//Q12
def jpg_to_byte(String filePath){
    byte_file = readFile.readBinaryFile(filePath)
    return byte_file
}
