//
//  VenueModel.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation

struct VenueModelResponse: Codable {
    let meta: Meta?
    let response: ResponseData?
}

struct Meta: Codable {
    let code: Int?
    let requestId: String?
}

struct ResponseData: Codable {
    let venues: [Venue]?
    let confident: Bool?
}

struct Venue: Codable {
    let id: String?
    let name: String?
    let location: Location?
    let categories: [Category]?
    let createdAt: TimeInterval?
}

struct Location: Codable {
    let address: String?
    let lat: Double?
    let lng: Double?
    let labeledLatLngs: [LabeledLatLng]?
    let distance: Int?
    let postalCode: String?
    let cc: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
}

struct LabeledLatLng: Codable {
    let label: String?
    let lat: Double?
    let lng: Double?
}

struct Category: Codable {
    let id: String?
    let name: String?
    let pluralName: String?
    let shortName: String?
    let icon: Icon?
    let categoryCode: Int?
    let mapIcon: String?
    let primary: Bool?
}

struct Icon: Codable {
    let prefix: String?
    let suffix: String?
}
