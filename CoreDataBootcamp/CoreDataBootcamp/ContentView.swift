//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by Leo on 03/06/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    @State private var fruitText: String = ""

    @FetchRequest(
//        entity: FruitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)],
        animation: .default,
    ) private var fruits: FetchedResults<FruitEntity>

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Group {
                    TextField("Fruit", text: $fruitText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 55)
                        .background(.ultraThinMaterial)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Button {
                        addItem()
                    } label: {
                        Text("Add")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)

                Divider()
                    
                List {
                    ForEach(fruits) { fruit in
                        NavigationLink {
                            Text(fruit.name ?? "No name")
                        } label: {
                            Text(fruit.name ?? "No name")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Fruits")
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = fruitText
            saveItems()
            fruitText = ""
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { fruits[$0] }.forEach(viewContext.delete)
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
