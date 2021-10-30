//
//  main.swift
//  Project_1
//
//  Created by Ebtesam Alahmari on 21/10/2021.
//

import Foundation

print("""
 Todo app..
 New todo enter 1,
 List todos enter 2
 To end enter 0 :
 """,terminator: "")
var input = Utils.readInt()
let newTodo = TodoList()



while input != 0  {
    switch input {
    case 1:
        add()
    case 2:
        newTodo.printTodoList()
    case 3:
        if newTodo.printTodoList() {
            print("Enter a todo number that you want to delete: ",terminator: "")
            let todoNum = Utils.readInt()
            newTodo.removeTodo(todoNum)
        }
    case 4:
        update()
    case 5:
        newTodo.sortByNearestDate()
    case 6:
        newTodo.sortByFarthestDate()
    case 7:
        newTodo.sortByCreationDate()
    case 8:
        if newTodo.printTodoList() {
        print("Enter a todo number: ",terminator: "")
        let todoNum = Utils.readInt()
        newTodo.check(todoNum)
        }
    case 9:
        if newTodo.printTodoList() {
        print("Enter a todo number: ",terminator: "")
        let todoNum = Utils.readInt()
        newTodo.unCheck(todoNum)
        }
    case -1:
        break
    default:
        print("Invalid input")
        print()
    }
    print("Display the options list? Yes 1,No 0: ",terminator: "")
    input = Utils.readInt()
    if input == 1 {
        print("----------------------------------------")
        print("""
              New todo enter 1,
              List todos enter 2,
              Delete todo enter 3,
              Edit todo enter 4,
              Sort by nearest deadline enter 5,
              Sort by farthest deadline enter 6,
              Sort by creation deadline enter 7,
              To check the todo is done 8,
              To uncheck todo 9,
              To end enter 0 :
              """,terminator: "")
        input = Utils.readInt()
    }
}


func add () {
    print("Enter a name of todo: ",terminator: "")
    let todoName = Utils.readString()
    print("Enter a description of todo: ",terminator: "")
    let todoDescription = Utils.readString()
    print("Deadline of todo enter 1, if no have deadline enter 0 : ",terminator: "")
    let deadline = Utils.readInt()
    if deadline == 1 {
        print("Enter date like dd/mm/yyyy: ",terminator: "")
        let deadlineString = Utils.readString()
        newTodo.addTodo(Todo(todoName,todoDescription,deadlineString))
    }else if deadline == 0 {
        newTodo.addTodo(Todo(todoName,todoDescription))
    }else {
        print("Nothing has been saved, your input incorrect")
    }
}

func update() {
    // to check the todo is not empty
    let check = newTodo.printTodoList()
    if check {
        print("Enter a todo number that you want to change: ",terminator:"")
        let todoNum = Utils.readInt()
        if todoNum <= newTodo.todoList.count && todoNum != -1 {
            print("Change name enter 1,Change description enter 2,Change deadline enter 3 : ",terminator: "")
            let todoKey = Utils.readInt()
            if todoKey == 1 || todoKey == 2 || todoKey == 3 {
                print("Enter new value,if date enter like dd/mm/yyyy: ",terminator:"")
                let todoNewValue = Utils.readString()
                newTodo.updateInfo(todoNum, todoKey, todoNewValue)
            }else {
                print("Nothing has been updated, your input incorrect")
            }
            print("Do you want to change another? enter 1: ",terminator: "")
            let input = Utils.readInt()
            if input == 1 {
                update()
            }
        }else {
            print("There is no todo has number \(todoNum)")
        }
    }
}

func stringToDate(_ dateString:String) -> Date? {
    // Convert String to Date
    var todoDeadline = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yy"
    if let date = dateFormatter.date(from: dateString) {
        todoDeadline = date
        return todoDeadline
    }else {
        print("There was an error decoding the date, Deadline is stored as nil to edit enter 4....")
        return nil
    }
}
