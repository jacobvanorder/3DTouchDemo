//
//  ViewController.swift
//  ThreeDTouchDemo
//
//  Created by mrJacob on 10/25/15.
//  Copyright © 2015 SushiGrass. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    @IBOutlet var peekButton: UIButton!
    
    //MARK: - A: Peek/Pop -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: A1: register as delegate
        if traitCollection.forceTouchCapability == .Available {
            registerForPreviewingWithDelegate(self, sourceView: peekButton)
        }
        else {
            peekButton.addTarget(self, action: "pushDogViewController:", forControlEvents: .TouchUpInside)
        }
    }
    
    //MARK: UIViewControllerPreviewingDelegate
    
    //MARK: A2 View Controller for peeking
    internal func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        //If you wanted to do this off of a Table View, you'd use:
//        guard let indexPath = tableView.indexPathForRowAtPoint(location),
//            cell = tableView.cellForRowAtIndexPath(indexPath) else {
//                return nil
//        }
        
        guard let dogFaceController = storyboard?.instantiateViewControllerWithIdentifier("OhHelloThereViewController") else {
            return nil
        }
        dogFaceController.view.backgroundColor = .redColor()
        return dogFaceController
    }
    
    //MARK: A2 View Controller for popping
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        viewControllerToCommit.view.backgroundColor = .greenColor()
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    func pushDogViewController(sender: UIButton) {
        guard let dogFaceController = storyboard?.instantiateViewControllerWithIdentifier("OhHelloThereViewController") else {
            return
        }
        self.navigationController?.pushViewController(dogFaceController, animated: true)
    }
}

