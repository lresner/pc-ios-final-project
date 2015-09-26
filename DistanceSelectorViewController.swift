//
//  DistanceSelectorViewController.swift
//  PC FInale Project Alpha
//
//  Created by Flatiron School on 9/24/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

import UIKit

class DistanceSelectorViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var textDelta: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myImage.alpha = 0.6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMapSegue"{
            let mapViewController = segue.destinationViewController as! MapViewController
            if let num = Double(textDelta.text!) {
                mapViewController.user_delta = num }
//            else {
//                
//                let alertController = UIAlertController(title: "Error", message: "Please actually put a number in", preferredStyle: UIAlertControllerStyle.Alert)
//                self.presentViewController(alertController, animated: true, completion: nil)
//            }
            
                    //user_delta = Double(textDelta.text!)
        }
    }
    
    
    
    

}
