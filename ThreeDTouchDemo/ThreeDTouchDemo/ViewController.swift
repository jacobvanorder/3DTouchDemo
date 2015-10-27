//
//  ViewController.swift
//  ThreeDTouchDemo
//
//  Created by mrJacob on 10/25/15.
//  Copyright © 2015 SushiGrass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var peekButton: UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else { return }
        
        let backgroundColor: UIColor
        
        switch identifier {
        case "PushDogSegue":
            NSLog("Woof! :\(identifier)")
            backgroundColor = .whiteColor()
            break
        case "PushDogSeguePeek":
            NSLog("Woof! :\(identifier)")
            backgroundColor = .redColor()
            break
        case "PushDogSegueCommit":
            NSLog("Woof! :\(identifier)")
            backgroundColor = .greenColor()
            break
        default:
            NSLog("Woof! :\(identifier)")
            backgroundColor = .blackColor()
            break
        }
        
        segue.destinationViewController.view.backgroundColor = backgroundColor
    }
}

