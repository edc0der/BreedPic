//
//  User.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/11/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

class User: Codable {
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
}

class Picture: Codable {
    var large, medium, thumbnail: String?
}
