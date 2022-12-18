//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 15.12.2022.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    NavigationLink {
                        ProfileView(user: user)
                    }label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            HStack {
                Button {
                    // goes here the action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // goes here the action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didlike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    HStack {
                        Text(String(viewModel.tweet.likes))
                            .font(.subheadline)
                        
                        Image(systemName: viewModel.tweet.didlike ?? false ? "heart.fill" : "heart")
                            .font(.subheadline)
                            .foregroundColor(viewModel.tweet.didlike ?? false ? .red : .gray)
                    }
                }
            
                Spacer()
                
                Button {
                    // goes here the action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal)
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweet: Tweet(caption: "test tweet",
//                                  timestamp: "" as Timestamp,
//                                  uid: "",
//                                  likes: 99))
//    }
//}
