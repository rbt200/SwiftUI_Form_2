//
//  ContentView.swift
//  SwiftUI_Form_2
//
//  Created by Ivan Ivanov on 22.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var images =
        ["🍏", "🍎", "🍐", "🍊"]
    
    @State private var fruitVM: FruitViewModel = FruitViewModel()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: Text("")) {
                    
                    HStack {
                        Text("Show Previews")
                        Spacer()
                        NavigationLink(destination: Text("Dest")) {
                            Text("Always").foregroundColor(.gray)
                        }.fixedSize()
                    }
                    
                }
                
                Section(header: Text("Notification preview will be shown whether the phone is locked or unlocked.").foregroundColor(.gray).padding(10).lineLimit(nil)) {
                    
                    Text("Siri sugestions")
                    
                }
                
                Section(header: VStack(alignment: .leading) {
                    Text("Choose while apps can suggest shortcuts on the lock sceen ").padding(10).foregroundColor(.gray).lineLimit(nil)
                    Text("NOTIFICATION STYLE").padding(2)
                }) {
                    ForEach(self.images, id: \.self) { img in
                        HStack {
                            Text(img)
                                .font(.largeTitle)
                            
//                            if self.fruitVM.fruit == img {
                                Text(self.fruitVM.name)
//                            } else {
//                                Text("Notification")
//                            }
                            
                        }
                        .onTapGesture {
                            self.fruitVM.showModel.toggle()
                            self.fruitVM.fruit = img
                            // FruitView()
                        }
                    }
                    
                }
                .sheet(isPresented: self.$fruitVM.showModel) {
                    FruitDetailView(fruitVM: self.$fruitVM)
                }
            }
            
        }
        .navigationBarTitle("Notification", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
