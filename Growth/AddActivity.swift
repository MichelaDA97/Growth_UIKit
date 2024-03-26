//
//  AddActivity.swift
//  Growth
//
//  Created by Michela D'Avino on 25/03/24.
//

import SwiftUI

struct AddActivity: View {
    
    @State var textFieldText : String = ""
    
   
    
    @Environment(\.presentationMode) var presentationMode
    
    func saveButtonPressed(){
        // Controlla se il campo di testo non è vuoto prima di salvare l'attività
        guard !textFieldText.isEmpty else {
                  return
              }
        
        //salva
        let newActivity = Activities(text: textFieldText)
       // Activities.sampleActivity.append(newActivity)
        
        // Chiudi la modalità di presentazione dopo aver salvato l'attività
        presentationMode.wrappedValue.dismiss()
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
                
                
                Button(action: saveButtonPressed, label: {
                    
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
        
        Spacer(minLength: 500)
    }
}

#Preview {
    AddActivity()
}
