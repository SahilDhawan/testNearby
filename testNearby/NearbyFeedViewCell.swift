//
//  NearbyFeedViewCell.swift
//  SO
//
//  Created by Sahil Dhawan on 15/02/18.
//  Copyright © 2018 So Delhi. All rights reserved.
//

import Foundation
import UIKit
import FSPagerView
import Cards

class NearbyFeedViewCell : FSPagerViewCell {
    @IBOutlet weak var feedTitleLabel : UILabel!
    @IBOutlet weak var feedCardArticle : CardArticle!
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        feedCardArticle.title = ""
        feedCardArticle.subtitle = ""
        feedCardArticle.category = ""
    }
}
