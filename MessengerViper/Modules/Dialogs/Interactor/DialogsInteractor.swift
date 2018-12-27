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
        
    }
    
    
}
