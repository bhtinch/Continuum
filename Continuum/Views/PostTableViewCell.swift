//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/2/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    var post: Post? {
        didSet {
            if let post = post {
                updateViews(post: post)
            }
        }
    }
    
    func updateViews(post: Post) {
        postImageView.image = post.photo
        captionTextLabel.text = post.caption
        
        let commentCount = post.comments.count
        commentCountLabel.text = "Comments: \(commentCount)"
    }
    
}
