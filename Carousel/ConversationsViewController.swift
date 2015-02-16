//
//  ConversationsViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/14/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBackPopViewController(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
