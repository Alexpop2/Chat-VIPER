import Foundation

class ChatsInteractor {
    private var interactorOutput: ChatsInteractorOutput!
}

extension ChatsInteractor: ChatsInteractorInput {
    var output: ChatsInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
}