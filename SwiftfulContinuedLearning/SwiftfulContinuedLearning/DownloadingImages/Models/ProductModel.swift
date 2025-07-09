//
//  ProductModel.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 08/07/25.
//  Links:
//  Dummy JSON: https://dummyjson.com/products?limit=10&skip=10&select=title,price,thumbnail,price
//

import Foundation

struct ProductEnvelopeModel: Codable {
    let products: [ProductModel]
}

struct ProductModel: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Decimal
    let thumbnail: String
}

/**
 {
   "id": 11,
   "title": "Annibale Colombo Bed",
   "price": 1899.99,
   "thumbnail": "https://cdn.dummyjson.com/product-images/furniture/annibale-colombo-bed/thumbnail.webp"
 }
 */


