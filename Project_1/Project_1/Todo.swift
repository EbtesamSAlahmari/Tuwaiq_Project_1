//
//  Task.swift
//  Project_1
//
//  Created by Ebtesam Alahmari on 21/10/2021.
//

import Foundation

class Todo:CustomStringConvertible {
    var name:String
    var todoDescription:String
    var deadline:Date?
    var status:String = ""
    var creationDate:Date
    var deadlineString:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        if deadline != nil {
            return dateFormatter.string(from: deadline!)
        }else {
            return "nil"
        }
    }
    var description: String {
        return "\(name),\(todoDescription),\(deadlineString) \(status)"
    }
    
    init(_ name:String,_ description:String,_ deadlineString:String){
        self.name = name
        self.todoDescription = description
        self.deadline = stringToDate(deadlineString)
        self.creationDate = Date()
    }
    
    init(_ name:String,_ description:String){
        self.name = name
        self.todoDescription = description
        self.deadline = nil
        self.creationDate = Date()
    }
}
