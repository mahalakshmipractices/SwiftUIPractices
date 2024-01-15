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
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                    Text(post.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Posts")
            .listStyle(PlainListStyle())
            .onAppear {
                self.postViewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    ListPostsView()
}
