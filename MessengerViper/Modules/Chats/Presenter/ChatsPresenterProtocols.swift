import Foundation
import MessageInputBar

protocol ChatsPresenterInput: class {
    var output: ChatsPresenterOutput { get set }
    var viewInput: ChatsViewInput { get set }
    var interactorInput: ChatsInteractorInput { get set }
    func insertMessage(inputBar: MessageInputBar)
}

protocol ChatsPresenterOutput: class {
    func updateChat(chat: Dialog)
}
