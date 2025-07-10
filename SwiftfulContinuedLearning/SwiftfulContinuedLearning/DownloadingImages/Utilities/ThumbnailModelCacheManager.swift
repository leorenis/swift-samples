//
//  ThumbnailModelCacheManager.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 10/07/25.
//

import Foundation
import SwiftUI

class ThumbnailModelCacheManager {
    static let instance = ThumbnailModelCacheManager()
    private init() {}
    
    var thumbnailCache: NSCache<NSString, UIImage> = {
       var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 10 * 1024 * 1024 // 10MB
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        thumbnailCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return thumbnailCache.object(forKey: key as NSString)
    }
}
