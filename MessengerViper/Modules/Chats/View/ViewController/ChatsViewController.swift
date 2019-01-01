import UIKit
import MessageKit
import MessageInputBar
import InitialsImageView
import Fakery

class ChatsViewController: MessagesViewController {
    var chat: Dialog?
    private var presenter: ChatsPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        DispatchQueue.main.async {
            self.messagesCollectionView.scrollToBottom(animated: false)
        }
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(
                                                self.keyboardNotification(notification:)),
                                               name: UIResponder
                                                .keyboardWillChangeFrameNotification,
                                               object: nil)
    }
}

extension ChatsViewController: ChatsViewInput {
    func updateChat(chat: Dialog) {
        self.chat = chat
        // Reload last section to update header/footer labels and insert a new one
        messagesCollectionView.performBatchUpdates({
            messagesCollectionView.insertSections([chat.messages.count - 1])
            if (chat.messages.count) >= 2 {
                messagesCollectionView.reloadSections([chat.messages.count - 2])
            }
        }, completion: { [weak self] _ in
            if self?.isLastSectionVisible() == true {
                self?.messagesCollectionView.scrollToBottom(animated: true)
            }
        })
    }
    
    var presenterInput: ChatsPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

// MARK: - Change avatars

extension ChatsViewController {
    func configureAvatarView(_ avatarView: AvatarView,
                             for message: MessageType,
                             at indexPath: IndexPath,
                             in messagesCollectionView: MessagesCollectionView) {
        avatarView.setImageForName(message.sender.displayName,
                                   circular: true,
                                   textAttributes: nil)
    }
}

// MARK: - Keyboard notification observer

extension ChatsViewController {
    @objc func keyboardNotification(notification: NSNotification) {
        DispatchQueue.main.async {
            self.messagesCollectionView.scrollToBottom(animated: true)
        }
    }
}

// MARK: - Insert message

extension ChatsViewController {
    func insertMessage(_ message: UserMessage) {

    }
    
    func isLastSectionVisible() -> Bool {
        
        guard (chat?.messages.isEmpty ?? false) else { return false }
        
        let lastIndexPath = IndexPath(item: 0, section: (chat?.messages.count ?? 0) - 1)
        
        return messagesCollectionView.indexPathsForVisibleItems.contains(lastIndexPath)
    }
}

// MARK: - MessagesDataSource

extension ChatsViewController: MessagesDataSource {
    func currentSender() -> Sender {
        return Sender(id: "\(SelfUser.user.id)", displayName: SelfUser.user.name)
    }
    
    func messageForItem(at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        guard let message = chat?.messages[indexPath.section] else {
            fatalError("Не найдено сообщение")
        }
        return message
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return chat?.messages.count ?? 0
    }
    
    
}

extension ChatsViewController: MessagesLayoutDelegate {
    
}

extension ChatsViewController: MessagesDisplayDelegate {
    
}

// MARK: - MessageInputBarDelegate
extension ChatsViewController: MessageInputBarDelegate {
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        presenter.insertMessage(inputBar: inputBar)
        inputBar.inputTextView.text = String()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    
}
