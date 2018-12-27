//
//  Application.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import UIKit

//сервисный объект - класс, объекты данных структуры

// MARK: - Properties

class Application {
    private let modulesCoordinator: ModulesCoordinator!
    
    init() {
        modulesCoordinator = ModulesCoordinator()
    }
}

// MARK: - Initialization

extension Application {
    func fire() -> UIViewController {
        return modulesCoordinator.rootModuleController()
    }
}
