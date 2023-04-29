//
//  Show.swift
//  Domain
//
//  Created by thanos kottaridis on 14/3/23.
//

import Foundation

public struct Movie: Codable, Identifiable {
    
    public let id: Int?
    public let url: String?
    public let name: String?
    public let type: String?
    public let language: String?
    public let genres: [String]?
    public let image: Image?
    public let summary: String?
    
    public init(
        id: Int? = nil,
        url: String? = nil,
        name: String? = nil,
        type: String? = nil,
        language: String? = nil,
        genres: [String]? = nil,
        image: Image? = nil,
        summary: String? = nil
    ) {
        self.id = id
        self.url = url
        self.name = name
        self.type = type
        self.language = language
        self.genres = genres
        self.image = image
        self.summary = summary
    }
}

public struct Image: Codable, Equatable {
    public let medium: URL?
    public let original: URL?

    public init(medium: URL?, original: URL?) {
        self.medium = medium
        self.original = original
    }
}
