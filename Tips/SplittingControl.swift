//
//  SplittingControl.swift
//  Tips
//
//  Created by Lainie Wright on 12/14/15.
//  Copyright © 2015 lainiewright. All rights reserved.
//

import UIKit

class SplittingControl: UIControl {
    
    var numberOfPeople = 1 {
    didSet {
        setNeedsLayout()
    }
    }
    
    var spacing = 5
    var people = 4
    var peopleButtons = [UIButton]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledPersonImage = UIImage(named: "filledPerson")
        let emptyPersonImage = UIImage(named: "emptyPerson")
        
        for _ in 0..<people {
            let button = UIButton()
            button.setImage(emptyPersonImage, forState: .Normal)
            button.setImage(filledPersonImage, forState: .Selected)
            button.setImage(filledPersonImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "peopleButtonTapped:", forControlEvents: .TouchDown)
            peopleButtons += [button]
            addSubview(button)
        }
    }
    
    func peopleButtonTapped(button: UIButton) {
        numberOfPeople = peopleButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
        
    }

    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus some spacing.
        for (index, button) in peopleButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in peopleButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < numberOfPeople
        }
    }
}
