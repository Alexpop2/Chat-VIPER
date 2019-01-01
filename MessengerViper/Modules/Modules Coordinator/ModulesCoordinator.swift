//
//  ModulesCoordinator.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import UIKit

class ModulesCoordinator {
    private var dialogsPresenter: DialogsPresenterInput!
    
    func rootModuleController() -> UIViewController {
        let dialogsAssembly = DialogsAssembly()
        guard let dialogs = dialogsAssembly.build() else { return UIViewController() }
        dialogs.presenter.output = self
        dialogsPresenter = dialogs.presenter
        return dialogs.controller
    }
}

extension ModulesCoordinator: DialogsPresenterOutput {
    func selected(dialog: Dialog, chatViewController: ChatsViewController) {
        chatViewController.chat = dialog
        let chatsAssembly = ChatsAssembly()
        guard chatsAssembly.build(viewController: chatViewController) != nil else { return }
        chatViewController.presenterInput.interactorInput.initChat(chat: dialog)
        dialogsPresenter.setChatPresenterOutput(chatViewController: chatViewController)
        
    }
}
