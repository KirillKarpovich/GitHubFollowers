//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 30.01.23.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check ypur internet connetion"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data recieved from the server is invalid. Please try again"
}
