//
//  Dialog.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

struct Dialog {
    let id: Int
    let user: User
    var messages: [UserMessage]
    
    var prettyDescription: String {
        return user.name + " " + (messages.last?.text ?? "")
    }
}

extension Dialog: DialogTableViewCellModel {
    var userName: String {
        return user.name
    }
    
    var lastMessageTitle: String {
        return messages.last?.text ?? ""
    }
    
    // TODO: - Сконвертировать в нормальный формат
    
    var lastMessageDatePrettyPrinted: String {
        guard let messageDate = messages.last?.date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        if(Calendar.current.isDateInToday(messageDate)) {
            dateFormatter.dateFormat = "HH:mm"
        }
        else {
            dateFormatter.dateFormat = "dd.MM"
        }
        
        return dateFormatter.string(from: messageDate)
    }
    
    
}
