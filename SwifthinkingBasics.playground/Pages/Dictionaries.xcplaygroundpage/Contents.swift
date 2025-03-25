import Foundation

var finalFruits: [String] = ["Apple", "Orange", "Banana", "Apple"]
print(finalFruits)

var fruitSet: Set<String> = ["Apple", "Orange", "Banana", "Apple"]
print(fruitSet)

var dictionary: [String:Bool] = [
    "Apple": true,
    "Orange": false
]
print(dictionary, dictionary["Tomato"])

var anotherDictionary: [Int: String] = [
    0: "Apple",
    176: "Orange",
]

let dictValue = anotherDictionary[86] ?? "Default Value"
print(dictValue)

var anotherDictionary2: [String: String] = [ // Dictionary can have two or more values, but not more then one key.
    "abc": "Melon",
    "def": "Banana",
    "ghi": "Melon"
]
let dictValue2 = anotherDictionary2["ghi"] ?? "Default Value"
print(dictValue2)

anotherDictionary2["jkl"] = "Kiwi"
print(anotherDictionary2)

struct PostModel {
    let id: String
    let title: String
    let likeCount: Int
}

var postArray: [PostModel] = [
    PostModel(id: "abcd123", title: "Post hello blog", likeCount: 2),
    PostModel(id: "abcd456", title: "Post blog page cool", likeCount: 6),
    PostModel(id: "abcd890", title: "Post blog title", likeCount: 10),
]

if postArray.indices.contains(1) {
    let item = postArray[1]
    print(item)
}

var postDict: [String:PostModel] = [
    "abcd123": PostModel(id: "abcd123", title: "Post hello blog", likeCount: 2),
    "abcd456": PostModel(id: "abcd456", title: "Post blog page cool", likeCount: 6),
    "abcd890": PostModel(id: "abcd890", title: "Post blog title", likeCount: 10),
]

let postDictItem = postDict["abcd456"]
print(postDictItem)
