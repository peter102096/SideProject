//
//  DataModels.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import Foundation

typealias NasaData = [NasaDatum]

// MARK: - NasaDatum
struct NasaDatum: Codable {
    let nasaDatumDescription, copyright, title: String
    let url: String
    let apodSite: String
    let date, mediaType: String
    let hdurl: String

    enum CodingKeys: String, CodingKey {
        case nasaDatumDescription = "description"
        case copyright, title, url
        case apodSite = "apod_site"
        case date
        case mediaType = "media_type"
        case hdurl
    }
}


