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
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Futured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .fontWidth(.condensed)
                .bold()
            
            GeometryReader { geo in
                TabView {
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        
                        if model.recipes[index].featured {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                
                                VStack(spacing: 0) {
                                    Image("lasagna")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text("Lasagna")
                                        .padding(5)
                                    
                                }
                            }
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
                Text("1 hr")
                Text("Highlights")
                    .font(.headline)
                Text("Healty, hearty")
            }
            .padding(.leading)
        }
        
    }
}

