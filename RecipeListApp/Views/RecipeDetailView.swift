//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 15/06/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                  
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("6", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .frame(minWidth: 120, maxWidth: 180)
                }
                .pickerStyle(.segmented)
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("- " + RecipeModel.getPostion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
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
