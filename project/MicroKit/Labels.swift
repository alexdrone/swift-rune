//
//  TimeLabel.swift
//  Runes
//
//  Created by Alex Usbergo on 29/12/14.
//  Copyright (c) 2014 Alex Usbergo. All rights reserved.
//

import UIKit

public class TimeLabel : UILabel {
    
    public class func defaultSize() -> CGSize {
        return CGSize(width: 70, height: 35)
    }
    
    public var time: Int = 30 {
        didSet {
            self.formatTime(time)
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        //setup
        self.textColor = ColorSwatch.White.__conversion()
        self.font = Typography(trait: .Regular, size: .Small).__conversion()
        self.backgroundColor = UIColor.clearColor()
    }
    
    func formatTime(time: Int) {
        
        //todo: make it static
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "mm: ss"
        
        //updates the text
        self.text = dateFormatter.stringFromDate(NSDate(timeIntervalSince1970: NSTimeInterval(time)))
    }
    
}

public class ScoreLabel : UILabel {
    
    public class func defaultSize() -> CGSize {
        return CGSize(width: 100, height: 35)
    }
    
    public var score: Int = 0 {
        didSet {
            self.formatScore(score)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        //setup
        self.textColor = ColorSwatch.White.__conversion()
        self.font = Typography(trait: .Light, size: .Small).__conversion()
        self.backgroundColor = UIColor.clearColor()
        self.textAlignment = NSTextAlignment.Center
        self.formatScore(score)
    }
    
    func formatScore(score: Int) {
        self.text = NSString(format:"%d ⌘ ", score)
    }
    
}
