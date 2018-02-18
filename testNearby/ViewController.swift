//
//  ViewController.swift
//  testNearby
//
//  Created by Sahil Dhawan on 29/01/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import UIKit
import Cards
import FSPagerView

class ViewController: UIViewController {
    
    @IBOutlet weak var collecionView : UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout : UICollectionViewFlowLayout!
    
    
    @IBOutlet weak var pagerView : FSPagerView! {
        didSet {
            let nearbyNib = UINib(nibName: "NearbyFeedViewCell", bundle: nil)
            pagerView.register(nearbyNib, forCellWithReuseIdentifier: "cell")
            pagerView.delegate = self
            pagerView.dataSource = self
            pagerView.transformer = FSPagerViewTransformer(type: .linear)
            pagerView.backgroundColor = UIColor.clear
            let width : CGFloat = 180.0
            pagerView.interitemSpacing = 20.0
            pagerView.itemSize = CGSize(width: width, height: 225.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collecionView.delegate = self
        collecionView.dataSource = self
        collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 100, 0, 100)
        collectionViewFlowLayout.itemSize = CGSize(width: 180, height: 225)
        collecionView.showsHorizontalScrollIndicator = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : FSPagerViewDelegate {
    
}

extension ViewController : FSPagerViewDataSource {
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 10
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index) as! NearbyFeedViewCell
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        cell.feedCardArticle.shouldPresent(detailViewController, from: self)
        return cell
    }
}

extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        cell.cardArticle.shouldPresent(detailViewController, from: self)
        return cell
    }
}
