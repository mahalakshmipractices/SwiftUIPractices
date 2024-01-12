//
//  ListPostsView.swift
//  AllPractices
//
//  Created by mahalakshmi.s46 on 2024-01-12.
//

import SwiftUI

struct ListPostsView: View {
    @ObservedObject var postViewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            List(postViewModel.post, id:\.id) { post in
                VStack {
                    Text(post.title)
                        .font(.subheadline)
                    Text(post.body)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                self.postViewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    ListPostsView()
}
