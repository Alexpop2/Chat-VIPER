import Foundation

struct User {
    let id: Int
    let name: String
}

class SelfUser {
    static let user = User(id: 0, name: "Aleksey Poponin")
}
