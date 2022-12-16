//
//  AuthenticationHeaderView.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 16.12.2022.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    let text: String
    let text2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // this is a trick to strecth it instead
            // of using ZStack
            HStack { Spacer() }
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(text2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeaderView(
            text: "title 1", text2: "title 2"
        )
    }
}
