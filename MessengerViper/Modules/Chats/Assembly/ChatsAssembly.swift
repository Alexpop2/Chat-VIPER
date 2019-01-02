import UIKit

class ChatsAssembly {
    func build(viewController: ChatsViewController) -> ChatsPresenterInput? {
        let presenter = ChatsPresenter()
        let interactor = ChatsInteractor()
        
        viewController.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = viewController
        interactor.output = presenter
        
        return presenter
    }
}
