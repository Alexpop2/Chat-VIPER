import Foundation
import MessageInputBar
import Fakery

class ChatsPresenter {
    private var presenterOutput: ChatsPresenterOutput!
    private weak var view: ChatsViewInput!
    private var interactor: ChatsInteractorInput!
}

extension ChatsPresenter: ChatsPresenterInput {
    
    func insertMessage(inputBar: MessageInputBar) {
        let faker = Faker(locale: "ru")
        
        for component in inputBar.inputTextView.components {
            
            if let str = component as? String {
                let message = UserMessage(id: faker.number.randomInt(),
                                          text: str,
                                          date: Date(),
                                          user: SelfUser.user)
                interactor.insertMessage(message)
            }
        }
    }
    
    var output: ChatsPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: ChatsViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: ChatsInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
    
    
}

extension ChatsPresenter: ChatsInteractorOutput {
    func updateChat(chat: Dialog) {
        view.updateChat(chat: chat)
        output.updateChat(chat: chat)
    }
}
