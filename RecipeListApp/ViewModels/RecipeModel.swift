//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 22/05/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of data services and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPostion(ingredient: Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
       return String(targetServings)
    }
}
