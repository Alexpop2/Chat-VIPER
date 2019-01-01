//
//  DialogsViewProtocols.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

protocol DialogsViewInput: class {
    var presenterInput: DialogsPresenterInput { get set }
    
    func updateDialogs(dialogs: [Dialog])
}
