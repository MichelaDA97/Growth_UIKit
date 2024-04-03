//
//  AddActivity.swift
//  Growth
//
//  Created by Michela D'Avino on 25/03/24.
//

import SwiftUI

struct AddActivity: View {
    
    @State var textFieldText : String = ""
    

    @State var minutes = 0
    
    @State var checking : Bool = false
    
    @State var sampleActivity: [Activities] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    var completionHandler: ((Activities) -> Void)?
    
    @State private var showingAlertTime = false
    @State private var showingAlertActivity = false
    
    func saveButtonPressed(){
        
        // Check if the text field is empty
           guard !textFieldText.isEmpty else {
               // Show an alert
               showingAlertActivity = true
               return
               
           }
           
           // Check if the duration is set to zero
           guard minutes > 0 else {
               // Show an alert
               showingAlertTime = true
               return
               
           }
           
        
        // Save the activity        
        let newActivity = Activities(text: textFieldText, minutes: minutes, isCheck: checking)
        completionHandler?(newActivity)
        
        print(newActivity)
        
        // Close the modal view by clicking the button "Save"
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        
        
        NavigationView{
            
            VStack{
                
                VStack(alignment: .leading){
                    Text("New activity:")
                    
                    TextField(" ", text: $textFieldText)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(7)
                        .shadow(radius: 0.5)
                       
                    
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                
//                VStack(alignment: .leading){
//                    Text("Add note: ")
//                    TextField("", text: $textFieldText)
//                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                        .frame(height: 150)
//                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
//                        .cornerRadius(7)
//                        .shadow(radius: 0.5)
//                }
               
              
                
                HStack{
                    
                    Text("Set duration: ")
        
                        .frame(width: 150, height: 50)
                        .padding(.trailing, 157)
        
                 
                    
                    Picker(selection: $minutes, label: Text("Set duration")) {
                        
                        ForEach(0..<120) { index in
                            
                            Text(String(format: "%02d m ", index))
                                .tag(index)
                        }
                        
                    }
                    .frame(width: 80, height: 60)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .pickerStyle(WheelPickerStyle())
                    
            
                    
                    
                    
                }
                
                
                
   
                
                Button(action: saveButtonPressed , label: {
                    
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 45)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 10)
                        .padding(.vertical)
                    
                }) 
                .alert(isPresented: $showingAlertActivity){
                    Alert(title: Text("Error"), message: Text("Please fill the activity field."), dismissButton: .default(Text("OK")))
                    
                }
                
            }

            
            
            
        }.alert(isPresented: $showingAlertTime){
            Alert(title: Text("Error"), message: Text("Please fill the duration field."), dismissButton: .default(Text("OK")))
        }

        Spacer(minLength: 100)
        
    }
    
}

#Preview {
    AddActivity()
}



