//
//  AddActivity.swift
//  Growth
//
//  Created by Michela D'Avino on 25/03/24.
//

import SwiftUI

struct AddActivity: View {
    
    @State var textFieldText : String = ""
    
    func saveButtonPressed(){
        
    }

    var body: some View {
        NavigationView{
            
            VStack{
                
                TextField("Type something here..", text: $textFieldText)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(12)
                    .shadow(radius: 0.5)
                    .padding(.horizontal, 10)
                
                
                Button(action:  saveButtonPressed, label: {
                    
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                            .padding(.horizontal, 10)
                            .padding(.vertical)
                    
                })
            }
        }
    }
}

#Preview {
    AddActivity()
}
