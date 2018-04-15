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
}

class ID: Codable {
    var name: String?
    var value: String?
}

class Location: Codable {
    var street, city, state: String?
    var postcode: Int?
}

class Login: Codable {
    var username, password: String?
    var sha1, sha256, salt, md5: String?
}

class Name: Codable {
    var title, first, last: String?

    init(firstName: String?, lastName: String, title: String? = nil) {
        if let title = title {
            self.title = title
        }
        first = firstName
        last = lastName
    }
}

//TODO: Make url
class Picture: Codable {
    var large, medium, thumbnail: String!

    init(thumbnailURL: URL?, mediumURL: URL?, largeURL: URL?) {
        thumbnail = thumbnailURL?.absoluteString
        medium = mediumURL?.absoluteString
        large = largeURL?.absoluteString
    }
}
