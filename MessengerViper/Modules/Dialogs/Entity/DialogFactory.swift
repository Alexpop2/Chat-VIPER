import Foundation
import Fakery

class DialogFactory {
    func fakeDialogs(number: Int) -> [Dialog] {
        var outArray = [Dialog]()
        let faker = Faker(locale: "ru")
        let chatFactory = ChatFactory()
        for _ in 0..<number {
            let user = User(id: faker.number.randomInt(),
                            name: faker.name.firstName() + " " + faker.name.lastName())
            let messages = chatFactory.fakeUserMessages(number: faker.number.randomInt(min: 10, max: 20),
                                            user: user)
            let chat = Dialog(id: faker.number.randomInt(), user: user, messages: messages)
            outArray.append(chat)
        }
        outArray.sort { $0.messages.last?.date ?? Date() > $1.messages.last?.date ?? Date() }
        return outArray
    }
}
