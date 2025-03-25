import Foundation

// Learn more:
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#For-In-Loops

for x in 0..<10 {
    print(x)
}

let myArray = ["alpha", "beta", "gamma", "delta", "epsilon"]
var mySecondArray: [String] = []
for item in myArray {
    print(item)
    if item == "gamma" {
        mySecondArray.append(item)
    }
}

print(mySecondArray)

struct LessonModel {
    let title: String
    let isFavorite: Bool
}

var allLessons: [LessonModel] = [
    LessonModel(title: "How to code in swift", isFavorite: false),
    LessonModel(title: "Basic Types", isFavorite: false),
    LessonModel(title: "Basic Operators", isFavorite: true),
    LessonModel(title: "How to use Functions", isFavorite: false),
    LessonModel(title: "How to use Structs", isFavorite: true),
]

var favoriteLessons: [LessonModel] = []

for lesson in allLessons {
    if lesson.isFavorite {
        favoriteLessons.append(lesson)
    }
}
print(favoriteLessons)

for (index, lesson) in allLessons.enumerated() {
    if (index == 1) {
        // break
        continue
    }
    print("index: \(index), lesson: \(lesson)")
}
