//
//  CurvedView.swift
//  Public Art
//
//  Created by Tom Kearsley on 22/02/17.
//  Copyright © 2017 Tom Kearsley. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Contacts

class CurvedView: UIView {
    override func drawRect(rect: CGRect) {
        
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.moveToPoint(CGPoint(x: 0, y: y))
        myBezier.addQuadCurveToPoint(CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLineToPoint(CGPoint(x: rect.width, y: rect.height))
        myBezier.addLineToPoint(CGPoint(x: 0, y: rect.height))
        myBezier.closePath()
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 4.0)
        UIColor.whiteColor().setFill()
        myBezier.fill()
    }
}
