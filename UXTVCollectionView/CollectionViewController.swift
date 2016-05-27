
//
//  CollectionViewController.swift
//  UXTVCollectionView
//
//  Created by Michael Nino Evensen on 27/05/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var bounds: CGRect {
        get {
            return (self.collectionView?.bounds)!
        }
    }
    
    // cover
    var coverShouldBeInFocus = true
    var coverView: Cover?
    
    // MARK: - Apple TV Focus
    private var focusGuide: UIFocusGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Create a focus guide to fill the gap below button 2 and to the right
         of button 3.
         */
//        focusGuide = UIFocusGuide()
//        view.addLayoutGuide(focusGuide)
        
        // add cover
        self.coverView = NSBundle.mainBundle().loadNibNamed("Cover", owner: self, options: nil)[0] as? Cover
        self.collectionView?.backgroundView = self.coverView
        
        self.coverView?.preferredFocusedView
        self.coverView?.setNeedsFocusUpdate()
        
//        focusGuide.preferredFocusedView = self.coverView
        
//        print(coverView?.focused)
        
        // set inset
        self.collectionView?.contentInset.left = self.bounds.width - (self.bounds.width / 4)
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x>self.bounds.width/2 {
            self.coverView?.contentView.alpha = 0
        } else {
            self.coverView?.contentView.alpha = 1
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)

//        print(context.nextFocusedView)
        
        self.coverShouldBeInFocus = false
        
        if context.nextFocusedView==self.coverView {
            print("alright")
        }
  
//        let firstCell = self.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))

        
//        print(self.collectionView?.indexPathsForVisibleItems())
        
        
//        print(firstCell)
//
//        /*
//         Update the focus guide's `preferredFocusedView` depending on which
//         button has the focus.
//         */
//        guard let nextFocusedView = context.nextFocusedView else { return }
//////
//        focusGuide.preferredFocusedView = self.coverView
        
        
////        switch nextFocusedView {
////        case firstCell!:
////            focusGuide.preferredFocusedView = firstCell
////            
//////        case bottomLeftButton:
//////            focusGuide.preferredFocusedView = topRightButton
////            
////        default:
////            focusGuide.preferredFocusedView = nil
////        }
    }
    
    override func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return !self.coverShouldBeInFocus
    }
    
    
    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        return cell
    }

}
