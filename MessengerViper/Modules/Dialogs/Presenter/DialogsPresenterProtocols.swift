//
//  DialogsPresenterProtocols.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

protocol DialogsPresenterInput: class {
    var output: DialogsPresenterOutput { get set }
    var viewInput: DialogsViewInput { get set }
    var interactorInput: DialogsInteractorInput { get set }
}

protocol DialogsPresenterOutput: class {
    func selected(dialog: Dialog)
}
