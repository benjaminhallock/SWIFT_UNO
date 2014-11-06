//
//  ViewController.swift
//  Bullseye Swift
//
//  Created by benjaminhallock@gmail.com on 11/4/14.
//  Copyright (c) 2014 BEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var guessTheNumberText: UILabel!
    @IBOutlet weak var slider: UISlider!

    var buttonNumber: UInt32 = 0

    var randomNumber = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func reset() {
        randomNumber = Int(arc4random_uniform(100)) + 1
        slider.setValue(50, animated: true)
        guessTheNumberText.text = "Guess the Number"
    }

    @IBAction func didHitButton(button: UIButton) {
        buttonNumber = arc4random_uniform(10000)
        button.titleLabel?.text = "\(buttonNumber)"
        println(button.titleLabel?.text);

        let alert = UIAlertController(title: "Hey", message: "You hit me", preferredStyle: .Alert)

        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)

        alert.addAction(action)

        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func onSliderMoved(sender: UISlider) {

        var offset: Int = 0
        offset = abs(Int(sender.value) - randomNumber)

        println(offset)

        if offset  < 1 {
            UIView.animateWithDuration(3.0, animations: { () -> Void in
                self.view.backgroundColor = UIColor.whiteColor()
                self.view.backgroundColor = UIColor.greenColor()
                self.view.backgroundColor = UIColor.whiteColor()
                self.guessTheNumberText.text = "Hurray!"
            })
            let alert = UIAlertView(title: "Hurray!", message: "The number was \(randomNumber)", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
            reset()
        } else if offset < 20  {
            self.view.backgroundColor = UIColor.redColor();

            UIView.animateWithDuration(3.0, animations: { () -> Void in
                self.view.backgroundColor = UIColor.whiteColor()
                self.view.backgroundColor = UIColor.orangeColor();
                self.view.backgroundColor = UIColor.whiteColor()
                self.guessTheNumberText.text = "Warm"
            })
        } else if offset < 40 {
            UIView.animateWithDuration(3.0, animations: { () -> Void in
                self.view.backgroundColor = UIColor.whiteColor()
                self.view.backgroundColor = UIColor.redColor();
                self.view.backgroundColor = UIColor.whiteColor()
                self.guessTheNumberText.text = "Cold"
            })
        }
        
    }
    
    
}

