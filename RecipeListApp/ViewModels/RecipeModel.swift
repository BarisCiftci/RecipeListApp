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
    
    static func getPortion(ingredient: Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // reduce fraction by greatest common divisor
            let devisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= devisor
            denominator /= devisor
            
            // Get the whole portion if numerator > denominator
            
            if numerator >= denominator {
                
                // calculated whole portion
                wholePortions = numerator / denominator
                
                // calculate the remainder
                numerator = numerator % denominator
                
                // assign to portion string
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // assign remainder as a fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit  = ingredient.unit {
           
            if wholePortions > 1 {
                // calculate appropriate suffix
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
                
            }
            
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
         
    }
}
