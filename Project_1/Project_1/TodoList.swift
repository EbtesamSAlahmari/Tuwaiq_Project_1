//
//  TodoList.swift
//  Project_1
//
//  Created by Ebtesam Alahmari on 21/10/2021.
//

import Foundation

class TodoList:CustomStringConvertible{
    
    var todoList:[Todo]
    var description: String {
        return "\(todoList)"
    }
    
    init(){
        self.todoList = []
    }
    
    func addTodo (_ list:Todo){
        self.todoList.append(list)
        print("The todo has been added")
        print()
    }
    
    func printTodoList() -> Bool{
        if todoList.isEmpty{
            print("*** your todo list is empty")
            return false
        }
        for (idx,val) in todoList.enumerated() {
            print("*** Todo number (\(idx+1)) is \(val)")
        }
        print()
        return true
    }
    
    func updateInfo(_ todoNum:Int,_ key:Int,_ value :String)  {
        todoList.map { (todo:Todo) -> Todo in
            let modifiedTodo = todoList[todoNum-1]
            switch key {
            case 1:
                modifiedTodo.name = value
            case 2:
                modifiedTodo.todoDescription = value
            case 3:
                modifiedTodo.deadline = stringToDate(value)
            default:
                print("invalid input")
            }
            print("The todo has been updated")
            print()
            return modifiedTodo
        }
        
    }
    
    func removeTodo(_ num:Int){
        if num > 0 && num <= todoList.count  {
            todoList.remove(at:num-1)
            print("The todo has been deleted")
        }else {
            print("There is no todo has number \(num)")
        }
    }
    
    func sortByNearestDate() {
        todoList = todoList.sorted(by: {$0.deadline ?? .distantPast < $1.deadline ?? .distantPast })
        printTodoList()
    }
    
    func sortByFarthestDate() {
        todoList = todoList.sorted(by: {$0.deadline ?? .distantPast > $1.deadline ?? .distantPast})
        printTodoList()
    }
    
    func sortByCreationDate() {
        todoList = todoList.sorted(by: { (todo1:Todo , todo2:Todo)->Bool in
            return todo1.creationDate < todo2.creationDate
        })
        printTodoList()
    }
    
    func check(_ num:Int) {
        guard let list = todoList[safe:num] else {return}
        list.status = "checked"
        printTodoList()
    }
    
    func unCheck(_ num:Int) {
        guard let list = todoList[safe:num] else {return}
        list.status = ""
        printTodoList()
    }
}


extension Array {
    subscript(safe index: Index) -> Element? {
        let isValidIndex = index > 0 && index <= count
        if isValidIndex {
            return self[index-1]
        }else{
            print("There is no todo has number \(index)")
            return nil
        }
    }
}

