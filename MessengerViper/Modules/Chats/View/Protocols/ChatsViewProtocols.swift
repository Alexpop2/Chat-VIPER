import Foundation

protocol ChatsViewInput: class {
    var presenterInput: ChatsPresenterInput { get set }
    func updateChat(chat: Dialog)
}
