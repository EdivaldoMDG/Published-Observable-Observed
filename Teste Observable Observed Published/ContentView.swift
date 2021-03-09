//
//  ContentView.swift
//  Teste Observable Observed Published
//
//  Created by Edivaldo Goncalves on 3/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var task: String = ""
    @ObservedObject var taskStore = TaskBoard()

    var body: some View {
            NavigationView {
                VStack {
                    
                    AddTextField(task:$task, addButtonTapped: {
                        if !task.isEmpty {
                            taskStore.addNewTodo(todoTask: task)
                            self.task = ""
                        }
                    }).padding()
                    
                    List{
                        ForEach(self.taskStore.newTasks) { todo in
                            Text(todo.newTodo)
                        }.onDelete(perform: taskStore.deleteTodo)
                        .onMove(perform: taskStore.editTodo)
                           
                    }
                   
                }.navigationBarTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
