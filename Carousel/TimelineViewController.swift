//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/13/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImage.frame.size 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
