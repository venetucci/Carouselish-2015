//
//  ViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/11/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = imageView.bounds.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

