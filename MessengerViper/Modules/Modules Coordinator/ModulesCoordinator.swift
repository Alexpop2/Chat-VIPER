//
//  ModulesCoordinator.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import UIKit

class ModulesCoordinator {
    func rootModuleController() -> UIViewController {
        let dialogsAssembly = DialogsAssembly()
        guard let dialogs = dialogsAssembly.build() else { return UIViewController() }
        dialogs.presenter.output = self
        return dialogs.controller
    }
}

extension ModulesCoordinator: DialogsPresenterOutput {
    func selected(dialog: Dialog) {
        
    }
}
