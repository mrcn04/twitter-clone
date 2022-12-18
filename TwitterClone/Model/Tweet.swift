//
//  Tweet.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 18.12.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didlike: Bool? = false
}
