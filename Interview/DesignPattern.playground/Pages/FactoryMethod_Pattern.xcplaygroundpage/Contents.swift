//: [Previous](@previous)

import Foundation
/*
 Pavunraj
 Linkedin - www.linkedin.com/in/pavunraj-experienced-ios-dev
 Email id - pavunrajtech@gmail.com
 WhatsApp - +91 9578634446

 
 
 // Factory Method
 
   Createing a interface of superclass
   Create object without exposing to caller like loose coupling

   while promoting loose coupling between the client and the document generators. Adding support for new document types becomes easier by simply implementing a new concrete creator for that document type.
 
 // Drawbacks
  - No drawbaks

*/


//MARK: - Example

protocol Document {
    func generate()
}


class PDFDocument : Document {
    
    func generate() {
        print("Geneated PDF Doc")
    }
}

class WordDocument: Document {
    
    func generate() {
        print("Geneated Word Doc")
    }
}

class ExcelDocument: Document {
    
    func generate() {
        print("Geneated Excel Doc")
    }
    
}





// create a factory method


protocol DocumentGenerator {
    
    func createDocument() -> Document
}



// Concreate creator


class PdfDocumentCreate : DocumentGenerator {
    
    func createDocument() -> Document  {
        return PDFDocument()
    }
}


class WordDocumentCreate: DocumentGenerator {
    
    func createDocument() -> Document  {
        return WordDocument()
    }
}


class ExcelGenerator: DocumentGenerator {
    func createDocument() -> Document {
        return ExcelDocument()
    }
}


class DocumentClient {
    
    var documentGenerator: DocumentGenerator
    
    init(documentGenerator: DocumentGenerator) {
        self.documentGenerator = documentGenerator
    }
    
    func generateDocument() {
        let document = documentGenerator.createDocument()
        document.generate()
    }
}

var wordDoc = DocumentClient(documentGenerator: PdfDocumentCreate())
wordDoc.generateDocument()


var wordDoc1 = DocumentClient(documentGenerator: WordDocumentCreate())
wordDoc1.generateDocument()

var wordDoc2 = DocumentClient(documentGenerator: ExcelGenerator())
wordDoc2.generateDocument()




// Example 2

protocol PrintAddress{

  func printClassAddress()
}



class A: PrintAddress {
    
    func printClassAddress() {
        print("Class A")
    }
    
   
}


class B: PrintAddress {
    
    func printClassAddress() {
        print("Class B")
    }
}


class C: PrintAddress {
    
    func printClassAddress() {
        print("Class C")
    }
}


protocol ConcreateAddress {
    
    func linkAddress() -> PrintAddress
}



class A_Adress: ConcreateAddress {
    
    func linkAddress() -> PrintAddress {
        return A()
    }
  
}

class B_Adress: ConcreateAddress {
    
    func linkAddress() -> PrintAddress {
        return B()
    }
}


// clinet


class Location {
    
    var address: ConcreateAddress
    
    init(address: ConcreateAddress) {
        self.address = address
    }
    
    func getAddress() {
        
        let detailsPrint = address.linkAddress()
        detailsPrint.printClassAddress()
    }
}


var instance = Location(address: A_Adress())
instance.getAddress()


// Example 3


// Product: Defines the interface for the documents
protocol Document1 {
    func generate()
}

// Concrete Products
class PDFDocument1: Document {
    func generate() {
        print("Generating a PDF document")
    }
}

class WordDocument1: Document {
    func generate() {
        print("Generating a Word document")
    }
}

class ExcelDocument1: Document {
    func generate() {
        print("Generating an Excel document")
    }
}

// Factory
class DocumentFactory {
    func createDocument(type: String) -> Document? {
        switch type {
        case "PDF":
            return PDFDocument()
        case "Word":
            return WordDocument()
        case "Excel":
            return ExcelDocument()
        default:
            print("Unsupported document type")
            return nil
        }
    }
}

// Client
class DocumentClient1 {
    var documentFactory: DocumentFactory
    
    init(documentFactory: DocumentFactory) {
        self.documentFactory = documentFactory
    }
    
    func generateDocument(type: String) {
        if let document = documentFactory.createDocument(type: type) {
            document.generate()
        }
    }
}

// Usage
let documentFactory = DocumentFactory()
let client = DocumentClient1(documentFactory: documentFactory)

client.generateDocument(type: "PDF")   // Output: Generating a PDF document
client.generateDocument(type: "Word")  // Output: Generating a Word document
client.generateDocument(type: "Excel") // Output: Generating an Excel document
client.generateDocument(type: "CSV")   // Output: Unsupported document type

