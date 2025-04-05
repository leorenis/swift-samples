//
//  EnvironmentObject51Bootcamo.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/VWZ-h_N1wDk?si=IUuCJpFG2OYcmp8X

//
//  Created by Leo on 05/04/25.
//

import SwiftUI

/// A class to provide data access for our Environment.
///
class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        fillDataArray()
    }
    
    // MARK: FUNCTIONS
    
    /// fill a dataArray  with  some string data.
    ///
    /// This function fills the state data array. e.g.
    /// ```
    /// fillDataArray()
    /// ```
    ///
    /// - Warning: There is just a mock helper method. This docs have studying and training porpose.
    func fillDataArray() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "MacBook", "iPod", "Apple Watch", "Apple TV"])
    }
}

/// A class to provide data access for our fruits.
///
/// We have learned about:
/// @ObservedObject
/// @StateObject
///
/// And now:
/// @EnvironmentObject
///  - We don't have to actually pass this object around our app, instead all the views in our app automatically have access to this object, because it's in background environment.
struct EnvironmentObject51Bootcamo: View {
    
    // MARK: PROPERTIES
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        // destination: ProductDetailsView(selected: item, viewModel: viewModel),
                        destination: ProductDetailsView(selected: item),
                        label: {
                            Text(item)
                        })

                }
            }
            .navigationTitle("Apple products")
        }
        .environmentObject(viewModel)
        .tint(.mint)
    }
}

/// A  struct to provide product Details View.
///
struct ProductDetailsView: View {
    
    // MARK: PROPERTIES
    let selected: String
    /**
     * Although we're NOT using this  @ObservedObject var viewModel on this second screen, we have acces to it.
     * Except to pass to third  view ProductInfoView. This sounds like good, but if we had ten subviews in our hierarchy?
     *   - The answer is: environmentObject on struct EnvironmentObject51Bootcamo.
     *       ```
     *        NavigationStack {
     *          // all code here.
     *        }
     *       .environmentObject(viewModel)
     *       ```
     *  We don't need this anymore. All we need do is to change ProductInfoView to use a @EnvironmentObject instead @ObservedObject
     */
    // @ObservedObject var viewModel: EnvironmentViewModel
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            // Background layer
            Color("AdaptiveColor")
                .edgesIgnoringSafeArea(.all)
           
            // Foreground layer
            VStack {
                Text(selected)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(8)
                    .padding(.horizontal)
                
                NavigationLink {                // Destination
                    // ProductInfoView(viewModel: viewModel)
                    ProductInfoView()
                } label: {                      // Label
                    HStack {
                        Text("Read more")
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

/// A  struct to provide more information about product, triggered by ProductDetailsView.
///
struct ProductInfoView: View {
    // MARK: PROPERTIES
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            
            // Foreground
            ScrollView {
                VStack(alignment: .leading, spacing: 16.0) {
                    Text("Description: ")
                        .font(.headline)
                    Text("Apple products are known for their design, functionality, and security. Apple strives to create the best experience for customers by designing products that last, and by offering innovative hardware, software, and internet services.")
                        .font(.body)
                        .foregroundStyle(.primary)
                    
                    Text("See all products: ")
                        .font(.headline)
                    ForEach(viewModel.dataArray, id: \.self) { product in
                        Text(product)
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    EnvironmentObject51Bootcamo()
}
