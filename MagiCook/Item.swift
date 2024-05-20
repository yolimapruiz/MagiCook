//
//  Item.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 17/05/24.
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
