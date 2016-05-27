//
//  Cover.swift
//  UXTVCollectionView
//
//  Created by Michael Nino Evensen on 27/05/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class Cover: UIView {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var contentView: UIView!
    
    override func awakeFromNib() {
        self.textView.textContainerInset = UIEdgeInsetsZero
        
        // preferred focus
//        self.preferredFocusedView
//        self.setNeedsFocusUpdate()
//    
//        print("awake")
    }
    
    // MARK: - Overriding canBecomeFocused()
    override func canBecomeFocused() -> Bool {
        return true
    }
    
//    override var preferredFocusedView: UIView? {
//        return self
//    }

}
