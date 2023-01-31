//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 29.01.23.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
