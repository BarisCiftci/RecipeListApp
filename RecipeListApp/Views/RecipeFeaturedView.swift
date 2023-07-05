//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 26/06/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    var shadowColor = Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5)
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Futured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .fontWidth(.condensed)
                .bold()
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        
                        if model.recipes[index].featured {
                            
                            Button {
                                self.isDetailViewShowing = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(25)
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(.plain)
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: shadowColor, radius: 5, x: 5, y: 5)
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading) {
                Text("Preparetion time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding(.leading)
            .fontWidth(.condensed)
        }
        .onAppear {
            setFeaturedIndex()
        }
        
    }
    
    func setFeaturedIndex() {
       var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured == true
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
        
    }
}
