//
//  FruitView.swift
//  SwiftUI_Form_2
//
//  Created by Ivan Ivanov on 26.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import SwiftUI

struct FruitDetailView: View {
    
    @Binding var fruitVM: FruitViewModel
    
    var body: some View {
        VStack {
            VStack {
                
                Text(self.fruitVM.fruit)
                    .font(.custom("Arial", size: 200))
                    .padding()
                
                TextField("Enter the fruit's name...", text: self.$fruitVM.name)
                    .padding(20)
                
                Button("Submit") {
                    self.fruitVM.showModel.toggle() // toggle bool and return to the main screen
                }.padding()
                
            }
        }
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruitVM: .constant(FruitViewModel()))
    }
}
