//
//  Response.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import Foundation

struct Response<T: Codable>: Codable {
    var success: Bool
    var statusCode: Int
    var data: T?
}

struct Empty: Codable { } 
