//
//  ViewController.swift
//  homeView
//
//  Created by Admin on 5/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    @IBOutlet weak var collectionItem: UICollectionView!
    @IBOutlet weak var scrollViewcolor: UIView!
    

    
    
    var nameItem: [String]!
    var imageItem: [String]!
    
    
    var pageimg: [String]!
    var first = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageimg = ["travelone", "traveltrue", "travelfor"]
        pagecontrol.currentPage = 0
        pagecontrol.numberOfPages = pageimg.count
        nameItem = ["Teafox", "Lipton", "Tocotoco", "Capuchino", "Matcha", "Dingtea"]
        imageItem = ["teafoc.png", "tealipton.png", "tocotoco.png", "teared.png", "matcha.png","tocotoco.png"]
        
        collectionItem.dataSource = self
        collectionview.dataSource = self
        
        collectionItem.delegate = self
        collectionview.delegate = self
        
        scrollview.delegate = self
        
        self.setupscrollview()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        if (!first){
            let pageScrollviewsize = scrollview.frame.size
            scrollview.contentSize = CGSize(width: pageScrollviewsize.width * CGFloat(pageimg.count), height: 0)
            for i in 0..<pageimg.count
            {
                
                let imgView = UIImageView(image: UIImage(named: pageimg[i] + ".jpg"))
                imgView.frame = CGRect(x: CGFloat(i) * scrollview.frame.size.width, y: 0, width: scrollview.frame.size.width , height: scrollview.frame.size.height)
                imgView.contentMode = .scaleAspectFit
                self.scrollview.addSubview(imgView)
                
            }
            
        }
    }
    
    func setupscrollview() {
        scrollview.layer.borderColor = UIColor.gray.cgColor
        scrollview.layer.borderWidth = 1
        scrollview.layer.cornerRadius = 10
        scrollview.clipsToBounds = true
        scrollview.layer.shadowColor = UIColor.black.cgColor
        scrollview.layer.shadowOpacity = 0.3
        scrollview.layer.shadowRadius = 1
        scrollview.layer.shadowOffset = CGSize(width: 0, height: 3)
        scrollview.layer.masksToBounds = false
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let run = scrollView.contentOffset.x / scrollView.frame.size.width
        pagecontrol.currentPage = Int(run)
    }
    
    
    @IBAction func onChange(_ sender: Any) {
        scrollview.contentOffset = CGPoint(x: CGFloat(pagecontrol.currentPage) * scrollview.frame.size.width, y: 0)
    }
    
    
    //:MARK collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameItem.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionview {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "cellhome", for: indexPath) as! CollectionViewCell
            cellA.lblnameItem.text = String(nameItem[indexPath.row])
            cellA.imgItem.image = UIImage(named: imageItem[indexPath.row])
            cellA.setupOpen.layer.borderWidth = 0.1
            cellA.setupOpen.layer.cornerRadius = 10
            cellA.viewImage.layer.borderColor = UIColor.black.cgColor
            cellA.viewImage.layer.borderWidth = 0.5
            cellA.viewImage.layer.cornerRadius = 10
            
            cellA.viewImage.layer.shadowColor = UIColor.black.cgColor
            cellA.viewImage.layer.shadowOpacity = 0.3
            cellA.viewImage.layer.shadowRadius = 1
            cellA.viewImage.layer.shadowOffset = CGSize(width: 0, height: 3)
            cellA.viewImage.layer.masksToBounds = false
            
            return cellA
        }else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "CELLItem", for: indexPath) as! clsViewItem
            cellB.imageItem.image = UIImage(named: imageItem[indexPath.row])
            cellB.layer.borderColor = UIColor.gray.cgColor
            cellB.layer.borderWidth = 2
            cellB.layer.cornerRadius = 10
            cellB.clipsToBounds = true
            
            cellB.layer.shadowColor = UIColor.black.cgColor
            cellB.layer.shadowOpacity = 0.3
            cellB.layer.shadowRadius = 1
            cellB.layer.shadowOffset = CGSize(width: 0, height: 3)
            cellB.layer.masksToBounds = false
            
            return cellB
        }
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionview {
            return 0
        }
        
        return 0
    }
    
    
}

