import UIKit

class ChatsViewController: UIViewController {
    private var presenter: ChatsPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ChatsViewController: ChatsViewInput {
    var presenterInput: ChatsPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

extension ChatsViewController {
}
