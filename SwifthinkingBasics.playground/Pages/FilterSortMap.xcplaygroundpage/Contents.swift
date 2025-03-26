import Foundation

struct DatabaseUser {
    let name: String
    let isPremium: Bool
    let order: Int
}

var allUsers: [DatabaseUser] = [
    DatabaseUser(name: "John", isPremium: false, order: 3),
    DatabaseUser(name: "LRS", isPremium: true, order: 1),
    DatabaseUser(name: "Alice", isPremium: false, order: 2),
    DatabaseUser(name: "Bob", isPremium: false, order: 4),
    DatabaseUser(name: "David", isPremium: true, order: 5),
]

// Version 0
var allPremiumUsers0: [DatabaseUser] = []
for user in allUsers {
    if user.isPremium {
        allPremiumUsers0.append(user)
    }
}
print(allPremiumUsers0)

// Version 1
var allPremiumUsers1: [DatabaseUser] = allUsers.filter { user in
    if user.isPremium {
        return true
    }
    return false
}
print(allPremiumUsers1)

// Version 2
var allPremiumUsers2: [DatabaseUser] = allUsers.filter { user in
    user.isPremium
}
print(allPremiumUsers2)

// Version 3 - Short expression
var allPremiumUsers3: [DatabaseUser] = allUsers.filter { $0.isPremium }
print(allPremiumUsers3)

// Version 4 - Short expression
var allPremiumUsers4: [DatabaseUser] = allUsers.filter(\.isPremium)
print(allPremiumUsers4)


// --------- Sort ------- //
// Version 1
var orderedUsers: [DatabaseUser] = allUsers.sorted { user1, user2 in
    return user1.order < user2.order
}
print("User ordered: \(orderedUsers)")

// Version 2 - Short Expresion, Using: by
var orderedUsers2: [DatabaseUser] = allUsers.sorted(by: { $0.order < $1.order })
print("User ordered 2: \(orderedUsers2)")

// Version 3 - Short expression
var orderedUsers3: [DatabaseUser] = allUsers.sorted { $0.order < $1.order }
print("User ordered 3: \(orderedUsers3)")


// --------- Sort ------- //
// Version 1
var userNames: [String] = allUsers.map { user in
    return user.name
}
print("Nomes 1: \(userNames)")

// Version 2
var UserNames2: [String] = allUsers.map { $0.name }
print("Nomes 2: \(UserNames2)")
// Version 3
var userNames3: [String] = allUsers.map(\.name)
print("Nomes 3: \(userNames3)")
