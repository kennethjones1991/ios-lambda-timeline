//
//  Post.swift
//  LambdaTimeline
//
//  Created by Spencer Curtis on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum MediaType {
    case image(UIImage)
    case video(URL)
}

class Post: Equatable {
    
    let mediaType: MediaType
    let frameCap: UIImage?
    let author: String
    let timestamp: Date
    var comments: [Comment]
    var ratio: CGFloat?
    var id: String?
    
    var title: String? {
        return comments.first?.text
    }
    
    init(title: String, mediaType: MediaType, frameCap: UIImage? = nil, ratio: CGFloat?, author: String, timestamp: Date = Date()) {
        self.mediaType = mediaType
        self.frameCap = frameCap
        self.ratio = ratio
        self.author = author
        self.comments = [Comment(text: title, author: author)]
        self.timestamp = timestamp
        self.id = UUID().uuidString
    }
    
    static func ==(lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
