//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 18.12.2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fecthUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
