//
//  AddTextField.swift
//  Teste Observable Observed Published
//
//  Created by Edivaldo Goncalves on 3/9/21.
//

import SwiftUI

struct AddTextField: View {
    @Binding var task: String
    var addButtonTapped: () -> ()

    
    
    var body: some View {
        HStack {
            TextField("Add your next task", text: $task)
            Button<Image>(action: addButtonTapped, label: {
                Image(systemName: "plus.circle")
            })
        }
        
    }
}

struct AddTextField_Previews: PreviewProvider {
    static var previews: some View {
        AddTextField(task: Binding.constant("Hello"), addButtonTapped:{
            print("here")
        })
    }
}
