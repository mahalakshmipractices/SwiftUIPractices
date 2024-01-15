//
//  PostRowView.swift
//  AllPractices
//
//  Created by Mahalakshmi Srinivasan on 12/01/24.
//

import SwiftUI

struct PostRowView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(post.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
            Text(post.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    let samplePost = Post(userId: 1, id: 1, title: "Sample Title", body: "Sample Body")
    PostRowView(post: samplePost)
}
