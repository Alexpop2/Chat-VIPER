//
//  DialogsInteractor.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

class DialogsInteractor {
    private var interactorOutput: DialogsInteractorOutput!
    private var dataSource = [Dialog]()
}

extension DialogsInteractor: DialogsInteractorInput {
    var output: DialogsInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func getDialogs() {
        let dialogFactory = DialogFactory()
        dataSource = dialogFactory.fakeDialogs(number: 30)
        interactorOutput.recieved(dialogs: dataSource)
    }
    
    func updateChat(chat: Dialog) {
        guard let chatIndex = dataSource.firstIndex( where: {$0.id == chat.id} ) else {
            return
        }
        dataSource.remove(at: chatIndex)
        dataSource.append(chat)
        dataSource.sort { $0.messages.last?.date ?? Date() > $1.messages.last?.date ?? Date() }
        interactorOutput.recieved(dialogs: dataSource)
    }
}
