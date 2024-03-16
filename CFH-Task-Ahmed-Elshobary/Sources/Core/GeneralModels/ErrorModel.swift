//
//  ErrorModel.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation

// MARK: - ...  Erros model

class Errors: Codable {
    var detail: String?
    var status : Int?
    var title : String?
}

class ErrorModel: Codable {
    var message: String?
}
