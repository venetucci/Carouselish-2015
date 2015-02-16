//
//  ScrollViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/13/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var enterContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var welcomeFirstImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        
        
        if (page == 3) {
            UIView.animateKeyframesWithDuration(0.3, delay: 0.1, options: nil, animations: { () -> Void in
                self.enterContainer.alpha = 1
                }, completion: nil)
        }
    }
}
