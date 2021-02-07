//
//  Comment.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/7/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import CloudKit

struct CommentStrings {
    static let textKey = "text"
    static let timestampKey = "timestamp"
    static let recordTypeKey = "Comment"
}

class Comment {
    let text: String
    let timestamp: Date
    let ckRecordID: CKRecord.ID
    
    init(text: String, timestamp: Date = Date(), ckRecordID: CKRecord.ID = CKRecord.ID()) {
        self.text = text
        self.timestamp = timestamp
        self.ckRecordID = ckRecordID
    }
}
