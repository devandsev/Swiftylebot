//
//  Errors.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 02/12/2017.
//

import Foundation

public enum TelegramError {
    case localError(String)
    case serverError(APIError)
}
