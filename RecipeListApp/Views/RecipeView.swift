//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 22/05/2023.
//

import SwiftUI

struct RecipeView: View {
    
    // Reference the view model
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
