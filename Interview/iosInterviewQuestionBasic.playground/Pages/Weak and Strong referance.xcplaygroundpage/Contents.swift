import UIKit

class Vechile {
    var car: Car?
    var id: String?
    
    init(car:Car?, id: String) {
        self.car = car
        self.id = id
        print("Vechile init")
    }
    
    deinit {
        print("Vechile deinit")
    }
}

class Car {
    var vechile: Vechile?
    var name: String?
    
    init(vechile: Vechile? = nil, name: String? = nil) {
        self.vechile = vechile
        self.name = name
        print("Car init")
    }
    
    deinit {
        print("Car deinit")
    }
}

var vechile: Vechile? = Vechile(car: nil, id: "1234")
var car: Car? = Car(vechile: nil, name: "5678")

vechile?.car = car
car?.vechile = vechile
vechile = nil
car = nil
