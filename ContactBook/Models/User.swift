//
//  User.swift
//  ContactBook
//
//  Created by Anton Nikolaev on 03.12.2021.
//

import Foundation

struct User {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob: Dob?
    let registered: Registered?
    let phone: String?
    let cell: String?
    let id: ID?
    let picture: Picture?
    let nat: String?
    
    init(value: [String: Any]) {
        gender = value["gender"]  as? String
        let nameDict = value["name"] as? [String: String] ?? [:]
        name = Name(value: nameDict)
        let locationDict = value["location"] as? [String: Any] ?? [:]
        location = Location(value: locationDict)
        email = value["email"] as? String
        let loginDict = value["login"] as? [String: String] ?? [:]
        login = Login(value: loginDict)
        let dobDict = value["dob"] as? [String: Any] ?? [:]
        dob = Dob(value: dobDict)
        let regDict = value["registered"] as? [String: Any] ?? [:]
        registered = Registered(value: regDict)
        phone = value["phone"] as? String
        cell = value["cell"] as? String
        let idDict = value["id"] as? [String: String] ?? [:]
        id = ID(value: idDict)
        let picDict = value["picture"] as? [String: String] ?? [:]
        picture = Picture(value: picDict)
        nat = value["nat"] as? String
    }
    
    static func getRandomUsers(from value: Any) -> [User] {
        guard let value = value as? [String : Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { User(value: $0)}
    }
}

struct Name: Codable {
    let title, first, last: String?
    
    init(value: [String: String]) {
        title = value["title"]
        first = value["first"]
        last = value["last"]
    }
}


// MARK: - локация со вложенностями
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: Timezone?
    
    init(value: [String: Any]){
        let streerDict = value["street"] as? [String: Any] ?? [:]
        street = Street(value: streerDict)
        city = value["city"] as? String
        state = value["state"] as? String
        country = value["country"] as? String
        postcode = value["postcode"] as? Int
        let coordDict = value["coordinates"] as? [String: String] ?? [:]
        coordinates = Coordinates(value: coordDict)
        let tzDict = value["timezone"] as? [String: String] ?? [:]
        timezone = Timezone(value: tzDict)
    }
}

struct Street: Codable {
    let number: Int?
    let name: String?
    
    init(value: [String: Any]) {
        number = value["number"] as? Int
        name = value["name"] as? String
    }
}

struct Coordinates: Codable {
    let latitude, longitude: String?
    
    init(value: [String: String]) {
        latitude = value["latitude"]
        longitude = value["longitude"]
    }
}

struct Timezone: Codable {
    let offset, description: String?
    
    init(value: [String: String]) {
        offset = value["offset"]
        description = value["description"]
    }
}

// MARK: - login
struct Login: Codable {
    let uuid, username, password: String?
    let salt: String?
    let md5, sha1, sha256: String?
    
    init(value: [String: String]) {
        uuid = value["uuid"]
        username = value["username"]
        password = value["password"]
        salt = value["salt"]
        md5 = value["md5"]
        sha1 = value["sha1"]
        sha256 = value["sha256"]
    }
}

//MARK: - dob
struct Dob: Codable {
    let date: String?
    let age: Int?
    
    init(value: [String: Any]) {
        date = value["date"] as? String
        age = value["age"] as? Int
    }
}

//MARK: - registered
struct Registered: Codable {
    let date: String?
    let age: Int?
    
    init(value: [String: Any]) {
        date = value["date"] as? String
        age = value["age"] as? Int
    }
}
//MARK: - id
struct ID: Codable {
    let name: String?
    let value: String?
    
    init(value: [String: String]) {
        name = value["name"]
        self.value = value["value"]
    }
}
//MARK: - picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
    
    init(value: [String: String]) {
        large = value["large"]
        medium = value["medium"]
        thumbnail = value["thumbnail"]
    }
}

// MARK: - Constants
enum URLConstants: String {
    case randomUserAPI = "https://randomuser.me/api/"
}

enum Segues: String {
    case showContact = "ShowContact"
}
