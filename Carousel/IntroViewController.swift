//
//  ViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/11/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!

    
    var imageViews : [UIView]?
    var yOffsets : [Float] = [-288, -156, -248, -252, -305, -297]
    var xOffsets : [Float] = [-72, 19, 4, -43, -75, 32]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func transformView(view : UIView!, atIndex index : Int, offset : Float) {
    }
    
    func updateViewTranformsWithOffset(offset : Float) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        
        scrollView.contentSize = imageView.frame.size
        
        scrollView.sendSubviewToBack(imageView)

        imageViews = [tile1, tile2, tile3, tile4, tile5, tile6]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        for (index, imageView) in enumerate(imageViews!) {
            let xoffset = xOffsets[index]
            let yoffset = yOffsets[index]
            let scale = scales[index]
            let rotation = rotations[index]
            
            var offset = Float(scrollView.contentOffset.y)
            var r = convertValue(offset, 0, 568, rotation, 0)
            var tx = convertValue(offset, 0, 568, xoffset, 0)
            var ty = convertValue(offset, 0, 568, yoffset, 0)
            var sx = convertValue(offset, 0, 568, scale, 1)
            var rotateTransform = CGAffineTransformMakeDegreeRotation(CGFloat(r))
            var translateTransform = CGAffineTransformMakeTranslation(CGFloat(tx),CGFloat(ty))
            var scaleTransform = CGAffineTransformMakeScale(CGFloat(sx), CGFloat(sx))
            
            imageView.transform = CGAffineTransformConcat(rotateTransform, translateTransform)
            imageView.transform = CGAffineTransformConcat(imageView.transform, scaleTransform)
        }
        
    }

}

