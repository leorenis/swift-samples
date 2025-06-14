//
//  TypeAliasBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 14/06/25.
//

import SwiftUI

// MARK: STRUCTS

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

struct TVShowModel {
    let title: String
    let director: String
    let count: Int
}

struct TypeAliasBootcamp: View {
    // MARK: PROPERTIES
    // @State private var item: MovieModel = MovieModel(title: "Movie Title", director: "Joe", count: 5)
    @State private var item: MovieModel = MovieModel(title: "TV Show Title", director: "Emily", count: 5)
    
    // MARK: BODY
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

// MARK: PREVIEW
#Preview {
    TypeAliasBootcamp()
}
