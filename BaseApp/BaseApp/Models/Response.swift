//
//  Response.swift
//  BaseApp
//
//  Created by Shirin on 2/16/23.
//

import Foundation

struct Response<T: Codable>: Codable {
    var success: Bool
    var statusCode: Int
    var data: T?
}

struct Empty: Codable { } 
