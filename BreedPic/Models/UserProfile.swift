//
//  User.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/11/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

enum PictureSize: UInt {
    case large = 128
    case medium = 72
    case small = 48
}

class BaseUserResult: Codable {
    var results: [UserProfile]?
    var info: Info?
}

class Info: Codable {
    var seed: String?
    var results, page: Int?
    var version: String?
}

class UserProfile: Codable {
    var id: ID?
    var name: Name?
    var picture: Picture?
    var gender: String?
    var email: String?
    var phone, cell: String?
    var location: Location?
    var nat: String?
    var login: Login?
    var dob, registered: String?
    var hasSeenOnboarding = false

    var favoriteBreeds = [Breed]()
    var favoritePictures = [String]()

    init(id: ID?, name: Name?, picture: Picture?, email: String?) {
        self.name = name
        self.picture = picture
        self.email = email
    }

    func hasFavoriteBreeds() -> Bool {
        return favoriteBreeds.count > 0
    }

    private enum CodingKeys: String, CodingKey {
        case id, name, picture, gender, email, phone, cell, location, nat, login, dob, registered
    }
}

class ID: Codable {
    var name: String?
    var value: String?

    init(name: String?, value: String?) {
        self.name = name
        self.value = value
    }
}

class Location: Codable {
    var street, city, state: String?
    var postcode: Int?

    private enum CodingKeys: String, CodingKey {
        case street, city, state
    }
}

class Login: Codable {
    var username, password: String?
    var sha1, sha256, salt, md5: String?
}

class Name: Codable {
    var title, first, last: String?

    init(firstName: String?, lastName: String, title: String? = nil) {
        self.title = title
        self.first = firstName
        self.last = lastName
    }
}

class Picture: Codable {
    var large, medium, thumbnail: URL?

    init(thumbnailURL: URL?, mediumURL: URL?, largeURL: URL?) {
        thumbnail = thumbnailURL
        medium = mediumURL
        large = largeURL
    }
}
