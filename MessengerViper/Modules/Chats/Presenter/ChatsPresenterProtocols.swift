import Foundation

protocol ChatsPresenterInput: class {
    var output: ChatsPresenterOutput { get set }
    var viewInput: ChatsViewInput { get set }
    var interactorInput: ChatsInteractorInput { get set }
}

protocol ChatsPresenterOutput: class {
}
