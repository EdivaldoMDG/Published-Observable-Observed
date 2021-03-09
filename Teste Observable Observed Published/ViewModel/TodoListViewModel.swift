//
//  TodoListViewModel.swift
//  Teste Observable Observed Published
//
//  Created by Edivaldo Goncalves on 3/9/21.
//

import Foundation
import Combine
import SwiftUI

struct Task: Identifiable {
    var id = String()
    var newTodo = String()
}


class TaskBoard: ObservableObject {
    @Published var newTasks = [Task]()
  
    
    func addNewTodo(todoTask: String) {
        newTasks.append(Task(id: String(newTasks.count + 1), newTodo: todoTask))
    }
    
    func deleteTodo(at offsets: IndexSet){
        newTasks.remove(atOffsets: offsets)
    }
    
    func editTodo(from source: IndexSet, to destination : Int){
        newTasks.move(fromOffsets: source, toOffset: destination)
    }
}
