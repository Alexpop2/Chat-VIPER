import Foundation

protocol ChatsInteractorInput: class {
    var output: ChatsInteractorOutput { get set }
    func insertMessage(_ message: UserMessage)
    func initChat(chat: Dialog)
}

protocol ChatsInteractorOutput: class {
    func updateChat(chat: Dialog)
}
