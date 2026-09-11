//: [Previous](@previous)

import Foundation

/*
 Pavunraj
 Linkedin - www.linkedin.com/in/pavunraj-experienced-ios-dev
 Email id - pavunrajtech@gmail.com
 WhatsApp - +91 9578634446
 
 
 // Facade
 
 Simplifies the usage of compplex types

 */


// Method 1


class A {
    func printA() {
        print("Class A")
    }
}


class B {
    func printB() {
        print("Class B")
    }
}

class C {
    func printC() {
        print("Class C")
    }
}


class CombineClass {
    
    var instanceA: A
    var instanceB: B
    var instanceC: C
    
    init() {
        self.instanceA = A()
        self.instanceB = B()
        self.instanceC = C()
    }
    
    
    func getValue() {
        instanceA.printA()
        instanceB.printB()
        instanceC.printC()
    }
    
    
}


let classFacade = CombineClass()
classFacade.getValue()



// Method 2

let textTam = "நெல்லையில் பாஜகவின் பிரச்சாரம் அனலடித்து கொண்டிருக்கிறது. அதைவிட அதிகமாக, சர்ச்சைகளும், பரபரப்புகளும் கிளம்பி கொண்டிருக்கின்றன. என்னவாம்?"

let textEng = "The BJP has released the list of 112 candidates for the upcoming Odisha assembly elections which will held alongside the Lok Sabha elections"


let speechLanguage = NLPFacade.dominantLanguage(for: textEng)
let result = NLPFacade.patsOfSpeech(for: textEng)
print(speechLanguage)
print(result)
