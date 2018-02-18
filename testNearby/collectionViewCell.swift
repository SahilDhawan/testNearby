//
//  collectionViewCell.swift
//  testNearby
//
//  Created by Sahil Dhawan on 29/01/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import UIKit
import Cards
import FSPagerView

class collectionViewCell : FSPagerViewCell {
    
    @IBOutlet weak var cardArticle : CardArticle!
    
    override func awakeFromNib() {
        //todo
        
        self.cardArticle.title = ""
        self.cardArticle.subtitle = ""
        self.cardArticle.category = ""
        
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        
      
       
    }
    
}
