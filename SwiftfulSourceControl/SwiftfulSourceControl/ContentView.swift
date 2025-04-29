//
//  ContentView.swift
//  SwiftfulSourceControl
//
//  Created by Leo on 28/04/25.
//

/**
 * Clone: Cpying the repo locally
 * Commit: Save ("checkpoint") on out current branch.
 * Stage: Prepare changes for a commit. (git add .)
 * Stash: Save changes for later
 * Push: Sendo local commits to remote repo
 * Pull: Fetch remote commits to local repo
 */

/**
 * Sugestion: Commit messages.
 *
 *  NEW FEATURE:
 *  [Feature] Desciption of the feature.
 *
 *  BUG NOT IN PRODUCTION:
 *  [Bug] Description of the Bug.
 *
 *  RELEASE:
 *  [Release] Description of release.
 *
 *  BUG IN PRODUCTION:
 *  [Patch] Description of patch
 *         Obs: Personal, preffer [Fix].
 *
 *  MUNDANE TASKS:
 *  [Clean] Description of changes.
 *
 */

/**
 * Stay aware abaout Git Hints
 *  E.G:
 *  hint: Updates were rejected because the remote contains work that you do not
 *  hint: have locally. This is usually caused by another repository pushing to
 *  hint: the same ref. If you want to integrate the remote changes, use
 *  hint: 'git pull' before pushing again.
 *  hint: See the 'Note about fast-forwards' in 'git push --help' for details.
 *
 * They are saying exactly what we should to do to solve differents status point from repositories: Remote and Local.
 * first: git pull
 * then: git push
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundStyle(.tint)
            Text("Git Source Control in Swift!")
                .foregroundStyle(.primary)
            
            Button("Click me") {
                // code here
            }
            RoundedRectangle(cornerRadius: 8)
                .background(.thinMaterial).opacity(0.1)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
