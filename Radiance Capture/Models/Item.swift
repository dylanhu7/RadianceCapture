//
//  Item.swift
//  Radiance Capture
//
//  Created by Dylan Hu on 6/27/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
