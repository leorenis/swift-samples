import Foundation

struct Employee: EmployeeHasAName {
    let title: String
    let name: String
}

protocol EmployeeHasAName {
    let name: String
}
