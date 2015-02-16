//
//  SignInViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/13/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
    @IBAction func goBackPopViewController(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.loginContainer.center.y = kbSize.height - self.loginContainer.center.y/3
      
            self.buttonContainer.center.y = kbSize.height + self.buttonContainer.center.y/8
            }, completion: nil)

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.loginContainer.center.y = kbSize.height + self.loginContainer.center.y/10
            self.buttonContainer.center.y = kbSize.height + self.buttonContainer.center.y/1
            }, completion: nil)
    }
    
    @IBAction func signIn(sender: AnyObject) {
        if countElements(emailTextField.text) == 0 {
            UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK").show()
        } else if countElements(passwordTextField.text) == 0 {
            UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK").show()
        } else {
            var alertView = UIAlertView(title: "Signing In", message: "", delegate: nil, cancelButtonTitle: nil)
            alertView.show()
            
            delay(2, { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                if self.emailTextField.text == "m@g.com" && self.passwordTextField.text == "password" {
                    self.performSegueWithIdentifier("WelcomeSegue", sender: self)
                } else {
                    UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK").show()
                }
            })
        }
    }
    
    
    @IBAction
    func unwindToSignInController(sender: UIStoryboardSegue) {
        
    }
}
