//
//  PostController.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/7/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import CloudKit
import UIKit

class PostController {
    
    static let shared = PostController()
    
    var posts: [Post] = []
    
    var publicDB = CKContainer.default().publicCloudDatabase
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<String, PostError>) -> Void) {
        
        let post = Post(image: image, caption: caption)
        
        let record = CKRecord(post: post)
        
        publicDB.save(record) { (record, error) in
            if let error = error {
                print("***Error*** in Function: \(#function)\n\nError: \(error)\n\nDescription: \(error.localizedDescription)")
                return completion(.failure(.recordError))
            }
            
            guard let record = record,
                  let post = Post(ckRecord: record) else { return completion(.failure(.unableToUnwrap)) }
            
            self.posts.append(post)
            completion(.success("Successfully created post."))
        }
    }
    
    func fetchAllPosts() {
        
    }
    
    func updatePost() {
        
    }
    
    func deletePost() {
        
    }
    
}

