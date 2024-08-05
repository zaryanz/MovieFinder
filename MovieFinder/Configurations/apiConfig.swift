//
//  apiConfig.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import Foundation

let env = ProcessInfo.processInfo.environment
let apiKey = env["API_KEY"] ?? ""
let baseUrl = "http://www.omdbapi.com/"
