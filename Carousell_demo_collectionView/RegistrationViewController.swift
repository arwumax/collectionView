//
//  RegistrationViewController.swift
//  Carousell_demo_collectionView
//
//  Created by WuKwok Ho on 7/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    //將pageCollectionViewCell加個名，同collectionView關聯
    private let pageCellReuseIdentifier = "pageCellReuseIdentifier"
    
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!

    @IBOutlet weak var registrationPage: UIPageControl!
    
    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    
    @IBOutlet weak var emailLoginButton: UIButton!

    
    let pages = [[Constants.image: "p8", Constants.title:"How're you?", Constants.description: "Good morning"],[Constants.image: "p9", Constants.title:"How're you?", Constants.description: "Good morning"],[Constants.image: "p7", Constants.title:"How're you?", Constants.description: "Good morning"],[Constants.image: "p6", Constants.title:"How're you?", Constants.description: "Good morning"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //將colletionViewcell註冊去呢個collectionView入面
        self.tutorialCollectionView.registerNib(UINib(nibName: "PageCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: pageCellReuseIdentifier)
        
        self.layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        
        self.registrationPage.numberOfPages = self.pages.count
        
        self.setUpLoginWithEmailButton()
    
    }
    
    private func setUpLoginWithEmailButton() {
        self.emailLoginButton.layer.cornerRadius = 5
        let whiteAndBaseline = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSBaselineOffsetAttributeName: 2]
        
        
        let buttonTitle = NSMutableAttributedString(string: "  " + "Sign up or Log in ")
        let boldEmail = NSAttributedString(string: "Email", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0)])
        
        
        
        buttonTitle.addAttributes(whiteAndBaseline, range: NSRange(location: 0,length: buttonTitle.length-1))
        
        buttonTitle.appendAttributedString(boldEmail)
        self.emailLoginButton.setAttributedTitle(buttonTitle, forState: .Normal)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNum = round(scrollView.contentOffset.x/UIScreen.mainScreen().bounds.width)
        self.registrationPage.currentPage = Int(pageNum)
        
    }
    
    @IBAction func pageChanged(sender: AnyObject) {
        let x = CGFloat(registrationPage.currentPage) * self.tutorialCollectionView.frame.size.width
        self.tutorialCollectionView.setContentOffset(CGPointMake(x, 0), animated: true)
        
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
        
        //把cell 指向pageCollectionviewCell 拎裡面既reference 例如pageImage, titleLabel
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pageCellReuseIdentifier, forIndexPath: indexPath) as! PageCollectionViewCell
        
        //return integer of how many item in the array(pages)
        let page = pages[indexPath.item]
        cell.pageImageView.image = UIImage(named: page[Constants.image]!)
        cell.titleLabel.text = page[Constants.title]
        
        cell.descriptionLabel.text = page[Constants.description]
        
        // Configure the cell
        
        //registrationPage.currentPage = indexPath.item
        
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
