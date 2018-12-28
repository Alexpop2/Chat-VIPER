import Foundation

class ChatsPresenter {
    private var presenterOutput: ChatsPresenterOutput!
    private weak var view: ChatsViewInput!
    private var interactor: ChatsInteractorInput!
}

extension ChatsPresenter: ChatsPresenterInput {
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

}
