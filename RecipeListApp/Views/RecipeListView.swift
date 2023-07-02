//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 22/05/2023.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("All Recipes")
                        .font(.largeTitle)
                        .fontWidth(.condensed)
                        .fontWeight(.black)
                    
                }
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .cornerRadius(12)
                                    Text(r.name)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                }
                
            }
            .padding(.leading)
            .navigationBarHidden(true)
            .listStyle(.plain)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeListView()
            .environmentObject(RecipeModel())
        
    }
}
