//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 18.12.2022.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.checkLikes()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didlike = true
            self.tweet.likes += 1
        }
    }
    
    func unlikeTweet() {
        guard tweet.likes > 0 else { return }
        service.unlikeTweet(tweet) {
            self.tweet.didlike = false
            self.tweet.likes -= 1
        }
    }
    
    func checkLikes() {
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didlike = true
            }
        }
    }
}
