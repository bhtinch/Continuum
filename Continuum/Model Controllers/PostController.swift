//
//  PostController.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/2/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostController {
    
    static let shared = PostController()
    
    var posts: [Post] = []
    
    func addComment(text: String, post: Post, completion: @escaping (Result<Comment, PostError>) -> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
    func createPostWith(image: UIImage, caption: String, coompletion: @escaping (Result<Post?, PostError>) -> Void) {
        let post = Post(caption: caption, photo: image)
        posts.append(post)
    }
    
    
}
