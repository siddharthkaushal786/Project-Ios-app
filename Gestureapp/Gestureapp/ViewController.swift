//
//  ViewController.swift
//  Gestureapp
//
//  Created by trainee on 12/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblSwipe: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //imgView.image = UIImage(named: "place1")
//        imgView.isHidden = true
//        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
//        lblSwipe.addGestureRecognizer(tap)
//
//        let panTap = UIPanGestureRecognizer(target: self, action: #selector(onPan))
//       view.addGestureRecognizer(panTap)
        
        imgView.image = UIImage(named: "place1")
        imgView.isUserInteractionEnabled = true
        view.addSubview(imgView)
        
        //UIPanGesture
        let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        myPanGestureRecognizer.minimumNumberOfTouches = 1
        myPanGestureRecognizer.maximumNumberOfTouches = 1
        imgView.addGestureRecognizer(myPanGestureRecognizer)
        
        //UILongPressGesture
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        longPressRecognizer.minimumPressDuration = 1
        view.addGestureRecognizer(longPressRecognizer)
        
        
        //UISwipeGesture
        let left = UISwipeGestureRecognizer(target : self, action : #selector(leftSwipe))
        left.direction = .left
        lblSwipe.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target : self, action : #selector(rightSwipe))
        right.direction = .right
        lblSwipe.addGestureRecognizer(right)

        let up = UISwipeGestureRecognizer(target : self, action : #selector(upSwipe))
        up.direction = .up
        lblSwipe.addGestureRecognizer(up)

        let down = UISwipeGestureRecognizer(target : self, action : #selector(downSwipe))
        down.direction = .down
        lblSwipe.addGestureRecognizer(down)
        
        //UIPinchGesture
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
//        imgView.addGestureRecognizer(pinchGesture)
        
    }


    //Method 2:
    @objc func myPanAction(recognizer: UIPanGestureRecognizer) {
        if ((recognizer.state != UIGestureRecognizer.State.ended) &&
            (recognizer.state != UIGestureRecognizer.State.failed)) {
            recognizer.view?.center = recognizer.location(in: recognizer.view?.superview)
        }
    }
    
    @objc func longPressed(recognizer: UILongPressGestureRecognizer){
        if ((recognizer.state != UIGestureRecognizer.State.ended) &&
            (recognizer.state != UIGestureRecognizer.State.failed)) {
            
            
            imgView.isHidden = true
        }else {
            imgView.isHidden = false
        
        }
    print("long pressed")
}
    
    @objc func leftSwipe(recognizer: UISwipeGestureRecognizer){
        lblSwipe.text = "left swipe"
        view.backgroundColor = UIColor.red
        
    print("swipe")
    }
    
    @objc func rightSwipe(recognizer: UISwipeGestureRecognizer){
        
        lblSwipe.text = "right swipe"
        view.backgroundColor = UIColor.green
       
        print("swipe")
    }
    
    @objc func upSwipe(recognizer: UISwipeGestureRecognizer){
       
        lblSwipe.text = "up swipe"
        view.backgroundColor = UIColor.blue
        
        print("swipe")
    }
    
    @objc func downSwipe(recognizer: UISwipeGestureRecognizer){
        lblSwipe.text = "down swipe"
        view.backgroundColor = UIColor.gray
        print("swipe")
    }
    
//    @objc func pinchRecognizer (recognizer: UIPinchGestureRecognizer){
//        self.view.bringSubviewToFront(imgView)
//        recognizer.view?.transform = (recognizer.view?.transform)!.scaledBy(x: recognizer.scale, y: recognizer.scale)
//        recognizer.scale = 1.0
//    }

//    @objc func pinch(sender:UIPinchGestureRecognizer) {
//        if sender.state == .began || sender.state == .changed {
//            let currentScale = self.imgView.frame.size.width / self.imgView.bounds.size.width
//            let newScale = currentScale*sender.scale
//            let transform = CGAffineTransform(scaleX: newScale, y: newScale)
//            self.imgView.transform = transform
//            sender.scale = 1
//        }
//    }
}
