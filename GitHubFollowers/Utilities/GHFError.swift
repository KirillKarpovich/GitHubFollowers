//
//  GHFError.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 30.01.23.
//

import Foundation

enum GHFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connetion."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recieved from the server is invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user.Please try again."
    case alreadyInFavorites = "You are already favorited this user 🥰"
}
