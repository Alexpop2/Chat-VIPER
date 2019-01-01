import Foundation

class ChatsInteractor {
    private var interactorOutput: ChatsInteractorOutput!
    private var chat: Dialog?
}

extension ChatsInteractor: ChatsInteractorInput {
    func initChat(chat: Dialog) {
        self.chat = chat
    }
    
    func insertMessage(_ message: UserMessage) {
        chat?.messages.append(message)
        guard let chatUnwrapped = chat else {
            return
        }
        interactorOutput.updateChat(chat: chatUnwrapped)
    }
    
    var output: ChatsInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
}
