//
//  Post.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/7/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import CloudKit
import UIKit

struct PostStrings {
    static let imageKey = "image"
    static let captionKey = "caption"
    static let timestampKey = "timestamp"
    static let commentsKey = "comments"
    static let recordTypeKey = "Post"
}

class Post {
    let image: UIImage
    let caption: String
    let timestamp: Date
    let comments: [Comment]
    let ckRecordID: CKRecord.ID
    
    init(image: UIImage, caption: String, timestamp: Date = Date(), comments: [Comment] = [], ckRecordID: CKRecord.ID = CKRecord.ID()) {
        self.image = image
        self.caption = caption
        self.timestamp = timestamp
        self.comments = comments
        self.ckRecordID = ckRecordID
    }
}

extension CKRecord {
    convenience init(post: Post) {
        self.init(recordType: PostStrings.recordTypeKey, recordID:  post.ckRecordID)
        
        self.setValuesForKeys([
            PostStrings.imageKey : post.image,
            PostStrings.captionKey : post.caption,
            PostStrings.timestampKey : post.timestamp,
            PostStrings.commentsKey : post.comments
        ])
    }
}

extension Post {
    convenience init?(ckRecord: CKRecord) {
        guard let image = ckRecord[PostStrings.imageKey] as? UIImage,
        let caption = ckRecord[PostStrings.captionKey] as? String,
        let timestamp = ckRecord[PostStrings.timestampKey] as? Date,
        let comments = ckRecord[PostStrings.commentsKey] as? [Comment] else { return nil }
      
        
        self.init(image: image, caption: caption, timestamp: timestamp, comments: comments, ckRecordID: ckRecord.recordID)
    }
}
