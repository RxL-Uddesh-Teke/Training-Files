package domain_2

class Person {
    String name
    int age
    Date dob
    String address
    int mobile


    static constraints = {
        name nullable: false, blank: false
        age min: 1, max: 130
        address nullable: true
    }

}
