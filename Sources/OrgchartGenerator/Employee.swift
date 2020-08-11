//
//  File.swift
//  
//
//  Created by Roy Dawson on 8/10/20.
//

import Foundation

struct Employee: Encodable {
    let id: Int
    let name: String
    let supervisorId: Int
    let role: String = "Worker"
    let email: String = "example@example.com"
    let cellphone: String = "8016912838"
    let location: String = "US"
    let imageURL: String = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png"
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id = "Employee ID"
        case name = "Name"
        case supervisorId = "Supervisor ID"
        case role = "Role"
        case email = "Email"
        case cellphone = "Cellphone"
        case location = "Location"
        case imageURL = "Image URL"
    }
}
