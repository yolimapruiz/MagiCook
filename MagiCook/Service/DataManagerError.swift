//
//  DataManagerError.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation

 enum DataManagerError: Error {
    case URLError
    case networkError
    case apiError
    case decodingError(Error)
}
