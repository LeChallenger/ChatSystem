//
//  NSDate+ChatSystem.swift
//  chadodo
//
//  Created by Alexander Saberdine on 22/05/2016.
//  Copyright © 2016 unknown. All rights reserved.
//

import Foundation

extension NSDate
{
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self)
        
        //Return Short Time String
        return timeString
    }
}
