//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 15/06/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("- " + item.name)
                    }
                }
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top])
                    
                    ForEach (recipe.directions, id:\.self) { item in
                        Text("- \(item)")
                            .padding(.bottom)
                    }
                }
                
                .padding(.horizontal)
            }
         
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe
        let model =  RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
