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
        List(model.recipes) { r in
            
            HStack(spacing: 20) {
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(12)
                Text(r.name)
            }
            
        }
        .listStyle(.plain)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
