//
//  ProgressView.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

class ProgressView: UIView {
    
    @IBOutlet weak var prograssV: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    @IBInspectable var prograssValue: Double = 0{
        didSet {
            widthConstraint.constant = (prograssValue * (self.frame.size.width)) / 100
        }
    }
    
    @IBInspectable var isRight: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 3))
        commonInit()
        widthConstraint.constant = (prograssValue * (self.frame.size.width)) / 100
        if isRight {
            prograssV.transform = CGAffineTransform(rotationAngle: .pi)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        commonInit()
        widthConstraint.constant = (prograssValue * (self.frame.size.width)) / 100
//        if isRight {
//            prograssV.transform = CGAffineTransform(rotationAngle: .pi)
//        }
        
    }
    
    fileprivate func commonInit() {
        let subView = viewFromNibForClass()
        subView.frame = bounds
        subView.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(subView)
    }
    
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
