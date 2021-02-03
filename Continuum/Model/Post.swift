//
//  Post.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/2/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var photoData: Data?
    let timestamp: Date
    let caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = self.photoData else { return nil }
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.50)
        }
    }
    
    init(timestamp: Date = Date(), caption: String, comments: [Comment] = [], photo: UIImage?) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
}   //  End of Class
