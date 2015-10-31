//
//  ViewController.swift
//  Multiples
//
//  Created by Kyle Lee on 10/31/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Primary view elements
    @IBOutlet var multiplesLogo: UIImageView!
    @IBOutlet var postit: UIImageView!
    @IBOutlet var playImage: UIButton!
    @IBOutlet var multipleInput: UITextField!
    
    // Secondary View elements
    @IBOutlet var sumText: UILabel!
    @IBOutlet var addImage: UIButton!
    
    // Global
    var counter: Int = 0
    var validMultiple: Int = 0
    var nextMultiple: Int = 1
    
    func showViewElements() {
        
        if counter % 2 == 0 {
            
            // Show Primary View
            self.multiplesLogo.hidden = false
            self.postit.hidden = false
            self.playImage.hidden = false
            self.multipleInput.hidden = false
            self.sumText.hidden = true
            self.addImage.hidden = true
            
            // Reset elements
            self.multipleInput.text = ""
            self.validMultiple = 0
            self.nextMultiple = 1
            
        } else {
            
            // Show Secondary View
            self.multiplesLogo.hidden = true
            self.postit.hidden = true
            self.playImage.hidden = true
            self.multipleInput.hidden = true
            self.sumText.hidden = false
            self.addImage.hidden = false
            
        }
    }
    
    // Play Button
    @IBAction func playButton(sender: UIButton) {
        
        // Check input for interger value
        if let userNumber: Int = Int(self.multipleInput.text!) {
            
            // Check input for valid multiple
            if self.multipleInput.text != "" {
                
                self.sumText.text = "\(userNumber) + 5 = \(userNumber + 5)"
                self.validMultiple = userNumber
                self.counter++
                self.showViewElements()
            }
            
        } else {
            
            // Invalid Number Alert Controller
            let alertController: UIAlertController = UIAlertController(title: "Invalid Number", message: "Please enter a valid multiple.", preferredStyle: .Alert)
            
            let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            
            alertController.addAction(alertAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            self.multipleInput.text = ""
        }
        
    }
    
    // Add Button
    @IBAction func addButton(sender: AnyObject) {
        self.nextMultiple++
        let visibleMultiple = self.validMultiple * self.nextMultiple
        self.sumText.text = "\(visibleMultiple) + 5 = \(visibleMultiple + 5)"
        
        if self.nextMultiple >= 11 {
            counter++
            self.showViewElements()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

