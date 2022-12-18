//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 17.12.2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUpload = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                // dismiss the screen
                self.didUpload = true
            } else {
                // show error msg to user
                print("[UploadTweetViewModel] too lazy to display it...")
            }
        }
    }
}
