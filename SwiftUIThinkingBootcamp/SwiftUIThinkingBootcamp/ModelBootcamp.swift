//
//  ModelBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 04/04/25.
//

import SwiftUI

// To put on array from users, should be hashable, because put :Identifiable protocol and provide UUID as value.
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let emoji: String
    let displayName: String
    let username: String
    let followeCount: Int
    let isVerified: Bool
}

struct ModelBootcamp: View {
    
    // MARK: PROPERTIES
    @State var users: [UserModel] = [
        //"Leo", "Peter", "John", "Mary", "David"
        UserModel(emoji: "😃", displayName: "Leo", username: "lrsnts", followeCount: 100, isVerified: true),
        UserModel(emoji: "😎", displayName: "Peter", username: "peteron", followeCount: 55, isVerified: false),
        UserModel(emoji: "😉", displayName: "John", username: "jhonj", followeCount: 355, isVerified: true),
        UserModel(emoji: "👩‍⚖️", displayName: "Mary", username: "marym", followeCount: 25, isVerified: false),
        UserModel(emoji: "😃", displayName: "David", username: "davidk", followeCount: 15, isVerified: false),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .fill(Color("AdaptiveColor"))
                            .frame(width: 32, height: 32)
                            .overlay(Text(user.emoji))
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.body)
                                .foregroundStyle(.primary)
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        if user.isVerified {
                            VerifiedBadgeView()
                        }
                        VStack {
                            Text("\(user.followeCount)")
                                .font(.body)
                                .foregroundStyle(.primary)
                            
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

struct VerifiedBadgeView: View {
    var body: some View {
        Image(systemName: "checkmark.seal.fill").foregroundStyle(.blue)
    }
}

// MARK: PREVIEW
#Preview {
    ModelBootcamp()
}
