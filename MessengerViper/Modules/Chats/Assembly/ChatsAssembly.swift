import UIKit

class ChatsAssembly {
    func build() -> (controller: UIViewController, presenter: ChatsPresenterInput)? {
        let storyboard = UIStoryboard(name: "ChatsStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "kChatsNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
              let viewController = navigationVC.viewControllers.first as? ChatsViewController else { return nil }
        
        let presenter = ChatsPresenter()
        let interactor = ChatsInteractor()
        
        viewController.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = viewController
        interactor.output = presenter
        
        return (controller: navigationVC, presenter: presenter)
    }
}
