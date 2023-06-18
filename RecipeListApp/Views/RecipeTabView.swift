//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Baris Ciftci on 18/06/2023.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView() {
                Text("Ratings")
                .tabItem {
                    
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Rating")
                        
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List View")
                        
                    }
                }
        }
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
