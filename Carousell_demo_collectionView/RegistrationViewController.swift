//
//  RegistrationViewController.swift
//  Carousell_demo_collectionView
//
//  Created by WuKwok Ho on 7/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //將pageCollectionViewCell加個名，同collectionView關聯
    private let pageCellReuseIdentifier = "pageCellReuseIdentifier"
    
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!

    @IBOutlet weak var registrationPage: UIPageControl!
    
    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    
    let pages = [["image": "p8", "title":"How're you?", "description": "Good morning"],["image": "p9", "title":"How're you?", "description": "Good morning"],["image": "p7", "title":"How're you?", "description": "Good morning"],["image": "p6", "title":"How're you?", "description": "Good morning"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //將colletionViewcell註冊去呢個collectionView入面
        self.tutorialCollectionView.registerNib(UINib(nibName: "PageCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: pageCellReuseIdentifier)
        
        self.layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height-148)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.pages.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pageCellReuseIdentifier, forIndexPath: indexPath) as! PageCollectionViewCell
        
        //return integer of how many item in the array(pages)
        let page = pages[indexPath.item]
        cell.pageImageView.image = UIImage(named: page["image"]!)
        cell.titleLabel.text = page["title"]
        print(page["title"])
        cell.descriptionLabel.text = page["description"]
        print("helle")
        // Configure the cell
        
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
