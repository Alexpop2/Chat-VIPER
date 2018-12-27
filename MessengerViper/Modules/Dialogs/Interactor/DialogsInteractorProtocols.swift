//
//  DialogsInteractorProtocols.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

protocol DialogsInteractorInput: class {
    var output: DialogsInteractorOutput { get set }
    func getDialogs()
}

protocol DialogsInteractorOutput: class {
    func recieved(dialogs: [Dialog])
}
