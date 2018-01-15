//
//  ViewController+DrawingMethods.swift
//  DrawPad
//
//  Created by Dalton on 12/19/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit

extension ViewController {
    
    func drawCircle(center:CGPoint, ctx:CGContext) {
        let x:CGFloat = center.x
        let y:CGFloat = center.y
        let radius: CGFloat = 15
        let endAngle: CGFloat = CGFloat(2 * Double.pi)
        ctx.addArc(center: CGPoint(x: x,y: y), radius: radius, startAngle: 0, endAngle: endAngle, clockwise: true)
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        if isRandomColor {
            
            if circleCounter >= 4 {
                circleCounter = 0
            } else {
                circleCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[circleCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        color.setFill()
        ctx.fillPath()
    }
    
    
    func drawLightShape(pointA: CGPoint, brushWidth: CGFloat, color: UIColor) {
        let bezier5Path = UIBezierPath()
        
        //                bezier5Path.move(to: CGPoint(x: 3.79, y: 9.09))
        bezier5Path.move(to:pointA)
        bezier5Path.addLine(to: CGPoint(x: pointA.x - (1.72 * brushWidth), y: pointA.y - (0.29 * brushWidth)))
        bezier5Path.addCurve(to: CGPoint(x: pointA.x - (2.22 * brushWidth), y: pointA.y - (3.82 * brushWidth)), controlPoint1: CGPoint(x: pointA.x - (1.72 * brushWidth), y: pointA.y - (0.29 * brushWidth)), controlPoint2: CGPoint(x: pointA.x - (3.12 * brushWidth), y: pointA.y - (1.65 * brushWidth)))
        
        bezier5Path.addCurve(to: CGPoint(x: pointA.x + (0.33 * brushWidth), y: pointA.y - (6.78 * brushWidth)), controlPoint1: CGPoint(x: pointA.x - (2.22 * brushWidth), y: pointA.y - (3.82 * brushWidth)), controlPoint2: CGPoint(x: pointA.x - (0.83 * brushWidth), y: pointA.y - (6.92 * brushWidth)))
        
        bezier5Path.addCurve(to: CGPoint(x: pointA.x + (1.74 * brushWidth), y: pointA.y - (3.35 * brushWidth)), controlPoint1: CGPoint(x: pointA.x + (0.33 * brushWidth), y: pointA.y - (6.78 * brushWidth)), controlPoint2: CGPoint(x: pointA.x + (1.52 * brushWidth), y: pointA.y - (6.89 * brushWidth)))
        
        bezier5Path.addCurve(to: CGPoint(x: pointA.x, y: pointA.y), controlPoint1: CGPoint(x: pointA.x + (1.74 * brushWidth), y: pointA.y - (3.35 * brushWidth)), controlPoint2: CGPoint(x: pointA.x + (2.02 * brushWidth), y: pointA.y - (0.97 * brushWidth)))
        bezier5Path.close()
        color.setFill()
        bezier5Path.fill()
    }
    
    
    
    func drawStar(center: CGPoint, ctx: CGContext) {
        
        let xCenter: CGFloat = center.x
        let yCenter: CGFloat = center.y
        let w:CGFloat = 40
        let r:CGFloat = w / 2.0
        let flip:CGFloat = -1.0
        
        let theta: Double = 2.0 * Double.pi * (2.0 / 5.0); // 144 degrees
        let pt = CGPoint(x: xCenter, y: r*flip+yCenter)
        ctx.move(to: pt)
        
        for k in 1..<5 {
            let x: CGFloat = CGFloat(Double(r) * sin(Double(k) * theta))
            let y: CGFloat = CGFloat(Double(r) * cos(Double(k) * theta))
            ctx.addLine(to: CGPoint(x: x + xCenter, y: y * flip + yCenter))
        }
        ctx.closePath()
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        if isRandomColor {
            
            if starCounter >= 4 {
                starCounter = 0
            } else {
                starCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[starCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        color.setFill()
        ctx.fillPath()
    }
    
    
    
    func drawSnowFlake(center: CGPoint) {
        
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        if isRandomColor {
            
            if snowFlakeCounter >= 4 {
                snowFlakeCounter = 0
            } else {
                snowFlakeCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[snowFlakeCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        
        let bezierPath = UIBezierPath()
        //            bezierPath.move(to: CGPoint(x: 35.25, y: 25.67))
        bezierPath.move(to: center)
        bezierPath.addCurve(to: CGPoint(x: center.x + 0.25, y: center.y - 0.43), controlPoint1: CGPoint(x: center.x, y: center.y - 18.0), controlPoint2: CGPoint(x: center.x - 0.10, y: center.y - 0.34))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.3, y: center.y - 1.61))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.79, y: center.y - 1.61), controlPoint1: CGPoint(x: center.x - 2.45, y: center.y - 1.7), controlPoint2: CGPoint(x: center.x - 2.64, y: center.y - 1.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.59, y: center.y - 0.38))
        bezierPath.addLine(to: CGPoint(x: center.x - 8.95, y: center.y - 3.1))
        bezierPath.addLine(to: CGPoint(x: center.x - 3.22, y: center.y - 4.63))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.87, y: center.y - 5.24), controlPoint1: CGPoint(x: center.x - 2.95, y: center.y - 4.7), controlPoint2: CGPoint(x: center.x - 2.79, y: center.y - 4.98))
        bezierPath.addCurve(to: CGPoint(x: center.x - 3.48, y: center.y - 5.59), controlPoint1: CGPoint(x: center.x - 2.93, y: center.y - 5.51), controlPoint2: CGPoint(x: center.x - 3.21, y: center.y - 5.66))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.17, y: center.y - 3.8))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.09, y: center.y - 4.9))
        bezierPath.addLine(to: CGPoint(x: center.x - 7.72, y: center.y - 6.82))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.07, y: center.y - 8.74))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.17, y: center.y - 9.84))
        bezierPath.addLine(to: CGPoint(x: center.x - 3.48, y: center.y - 8.05))
        bezierPath.addCurve(to: CGPoint(x: center.x - 3.35, y: center.y - 8.03), controlPoint1: CGPoint(x: center.x - 3.43, y: center.y - 8.03), controlPoint2: CGPoint(x: center.x - 3.39, y: center.y - 8.03))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.86, y: center.y - 8.4), controlPoint1: CGPoint(x: center.x - 3.12, y: center.y - 8.03), controlPoint2: CGPoint(x: center.x - 2.92, y: center.y - 8.17))
        bezierPath.addCurve(to: CGPoint(x: center.x - 3.22, y: center.y - 9.01), controlPoint1: CGPoint(x: center.x - 2.79, y: center.y - 8.67), controlPoint2: CGPoint(x: center.x - 2.95, y: center.y - 8.94))
        bezierPath.addLine(to: CGPoint(x: center.x - 8.94, y: center.y - 10.54))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.59, y: center.y - 13.06))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.8, y: center.y - 12.03))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.55, y: center.y - 11.96), controlPoint1: CGPoint(x: center.x - 2.72, y: center.y - 11.98), controlPoint2: CGPoint(x: center.x - 2.63, y: center.y - 11.96))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.3, y: center.y - 12.03), controlPoint1: CGPoint(x: center.x - 2.46, y: center.y - 11.96), controlPoint2: CGPoint(x: center.x - 2.37, y: center.y - 11.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 0.25, y: center.y - 13.2))
        bezierPath.addCurve(to: CGPoint(x: center.x, y: center.y - 13.64), controlPoint1: CGPoint(x: center.x - 0.10, y: center.y - 13.29), controlPoint2: CGPoint(x: center.x, y: center.y - 13.46))
        bezierPath.addLine(to: CGPoint(x: center.x, y: center.y - 14.89))
        bezierPath.addLine(to: CGPoint(x: center.x, y: center.y - 16))
        bezierPath.addCurve(to: CGPoint(x: center.x - 0.25, y: center.y - 16.43), controlPoint1: CGPoint(x: center.x, y: center.y - 16.18), controlPoint2: CGPoint(x: center.x - 0.10, y: center.y - 16.34))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.3, y: center.y - 17.61))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.8, y: center.y - 17.61), controlPoint1: CGPoint(x: center.x - 2.45, y: center.y - 17.97), controlPoint2: CGPoint(x: center.x - 2.64, y: center.y - 17.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.84, y: center.y - 16.43))
        bezierPath.addCurve(to: CGPoint(x: center.x - 5.09, y: center.y - 16), controlPoint1: CGPoint(x: center.x - 4.99, y: center.y - 16.34), controlPoint2: CGPoint(x: center.x - 5.09, y: center.y - 16.18))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.09, y: center.y - 13.93))
        bezierPath.addLine(to: CGPoint(x: center.x - 9.44, y: center.y - 11.41))
        bezierPath.addLine(to: CGPoint(x: center.x - 7.91, y: center.y - 17.14))
        bezierPath.addCurve(to: CGPoint(x: center.x - 8.26, y: center.y - 17.75), controlPoint1: CGPoint(x: center.x - 7.84, y: center.y - 17.41), controlPoint2: CGPoint(x: center.x - 8, y: center.y - 16.68))
        bezierPath.addCurve(to: CGPoint(x: center.x - 8.87, y: center.y - 17.4), controlPoint1: CGPoint(x: center.x - 8.53, y: center.y - 17.81), controlPoint2: CGPoint(x: center.x - 8.8, y: center.y - 17.66))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.67, y: center.y - 10.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.57, y: center.y - 9.6))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.06, y: center.y - 14.33))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.89, y: center.y - 11.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.89, y: center.y - 13.72))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.99, y: center.y - 18.62))
        bezierPath.addCurve(to: CGPoint(x: center.x - 10.99, y: center.y - 19.32), controlPoint1: CGPoint(x: center.x - 10.8, y: center.y - 18.81), controlPoint2: CGPoint(x: center.x - 10.8, y: center.y - 19.13))
        bezierPath.addCurve(to: CGPoint(x: center.x - 11.7, y: center.y - 19.32), controlPoint1: CGPoint(x: center.x - 11.19, y: center.y - 19.52), controlPoint2: CGPoint(x: center.x - 11.51, y: center.y - 19.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.89, y: center.y - 15.13))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.89, y: center.y - 20.17))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.1, y: center.y - 21.2))
        bezierPath.addCurve(to: CGPoint(x: center.x - 13.84, y: center.y - 21.63), controlPoint1: CGPoint(x: center.x - 13.94, y: center.y - 21.29), controlPoint2: CGPoint(x: center.x - 13.85, y: center.y - 21.45))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.85, y: center.y - 23.99))
        bezierPath.addCurve(to: CGPoint(x: center.x - 14.1, y: center.y - 24.42), controlPoint1: CGPoint(x: center.x - 13.85, y: center.y - 24.17), controlPoint2: CGPoint(x: center.x - 13.94, y: center.y - 24.33))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.14, y: center.y - 25.6))
        bezierPath.addCurve(to: CGPoint(x: center.x - 16.64, y: center.y - 25.6), controlPoint1: CGPoint(x: center.x - 16.3, y: center.y + 0.02), controlPoint2: CGPoint(x: center.x - 16.49, y: center.y + 0.02))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.68, y: center.y - 24.42))
        bezierPath.addCurve(to: CGPoint(x: center.x - 18.93, y: center.y - 23.99), controlPoint1: CGPoint(x: center.x - 18.84, y: center.y - 24.33), controlPoint2: CGPoint(x: center.x - 18.93, y: center.y - 24.17))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.93, y: center.y - 21.63))
        bezierPath.addCurve(to: CGPoint(x: center.x - 18.68, y: center.y - 21.2), controlPoint1: CGPoint(x: center.x - 18.93, y: center.y - 21.45), controlPoint2: CGPoint(x: center.x - 18.84, y: center.y - 21.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.89, y: center.y - 20.17))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.89, y: center.y - 15.13))
        bezierPath.addLine(to: CGPoint(x: center.x - 21.08, y: center.y - 19.32))
        bezierPath.addCurve(to: CGPoint(x: center.x - 21.79, y: center.y - 19.32), controlPoint1: CGPoint(x: center.x - 21.28, y: center.y - 19.52), controlPoint2: CGPoint(x: center.x - 21.59, y: center.y - 19.52))
        bezierPath.addCurve(to: CGPoint(x: center.x - 21.79, y: center.y - 18.62), controlPoint1: CGPoint(x: center.x - 21.98, y: center.y - 19.13), controlPoint2: CGPoint(x: center.x - 21.98, y: center.y - 18.81))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.89, y: center.y - 13.72))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.89, y: center.y - 11.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.73, y: center.y - 14.33))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.21, y: center.y - 9.6))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.12, y: center.y - 10.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 23.91, y: center.y - 17.41))
        bezierPath.addCurve(to: CGPoint(x: center.x - 24.52, y: center.y - 17.75), controlPoint1: CGPoint(x: center.x - 23.98, y: center.y - 17.66), controlPoint2: CGPoint(x: center.x - 24.26, y: center.y - 17.81))
        bezierPath.addCurve(to: CGPoint(x: center.x - 24.88, y: center.y - 17.13), controlPoint1: CGPoint(x: center.x - 24.79, y: center.y - 17.68), controlPoint2: CGPoint(x: center.x - 24.95, y: center.y - 17.4))
        bezierPath.addLine(to: CGPoint(x: center.x - 23.34, y: center.y - 11.41))
        bezierPath.addLine(to: CGPoint(x: center.x - 27.7, y: center.y - 13.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 27.7, y: center.y - 14.89))
        bezierPath.addLine(to: CGPoint(x: center.x - 27.7, y: center.y - 16))
        bezierPath.addCurve(to: CGPoint(x: center.x - 27.95, y: center.y - 16.43), controlPoint1: CGPoint(x: center.x - 27.7, y: center.y - 16.17), controlPoint2: CGPoint(x: center.x - 27.8, y: center.y - 16.34))
        bezierPath.addLine(to: CGPoint(x: center.x - 30, y: center.y - 17.61))
        bezierPath.addCurve(to: CGPoint(x: center.x - 30.49, y: center.y - 17.61), controlPoint1: CGPoint(x: center.x - 30.15, y: center.y - 17.69), controlPoint2: CGPoint(x: center.x - 30.34, y: center.y - 17.69))
        bezierPath.addLine(to: CGPoint(x: center.x - 32.54, y: center.y - 16.43))
        bezierPath.addCurve(to: CGPoint(x: center.x - 32.79, y: center.y - 15.99), controlPoint1: CGPoint(x: center.x - 32.69, y: center.y - 16.34), controlPoint2: CGPoint(x: center.x - 32.79, y: center.y - 16.17))
        bezierPath.addLine(to: CGPoint(x: center.x - 32.79, y: center.y - 13.64))
        bezierPath.addCurve(to: CGPoint(x: center.x - 32.54, y: center.y - 13.2), controlPoint1: CGPoint(x: center.x - 32.79, y: center.y - 13.46), controlPoint2: CGPoint(x: center.x - 32.7, y: center.y - 13.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 30.5, y: center.y - 12.02))
        bezierPath.addCurve(to: CGPoint(x: center.x - 30.25, y: center.y - 11.96), controlPoint1: CGPoint(x: center.x - 30.42, y: center.y - 11.98), controlPoint2: CGPoint(x: center.x - 30.34, y: center.y - 11.96))
        bezierPath.addCurve(to: CGPoint(x: center.x - 30, y: center.y - 12.02), controlPoint1: CGPoint(x: center.x - 30.16, y: center.y - 11.96), controlPoint2: CGPoint(x: center.x - 30.08, y: center.y - 11.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.21, y: center.y - 13.06))
        bezierPath.addLine(to: CGPoint(x: center.x - 23.85, y: center.y - 10.54))
        bezierPath.addLine(to: CGPoint(x: center.x - 29.58, y: center.y - 9.01))
        bezierPath.addCurve(to: CGPoint(x: center.x - 29.93, y: center.y - 8.39), controlPoint1: CGPoint(x: center.x - 29.84, y: center.y - 8.94), controlPoint2: CGPoint(x: center.x - 30, y: center.y - 8.66))
        bezierPath.addCurve(to: CGPoint(x: center.x - 29.45, y: center.y - 8.02), controlPoint1: CGPoint(x: center.x - 29.87, y: center.y - 8.17), controlPoint2: CGPoint(x: center.x - 29.67, y: center.y - 8.02))
        bezierPath.addCurve(to: CGPoint(x: center.x - 29.32, y: center.y - 8.04), controlPoint1: CGPoint(x: center.x - 29.41, y: center.y - 8.02), controlPoint2: CGPoint(x: center.x - 29.36, y: center.y - 8.03))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.63, y: center.y - 9.83))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.72, y: center.y - 8.73))
        bezierPath.addLine(to: CGPoint(x: center.x - 25.07, y: center.y - 6.82))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.72, y: center.y - 4.9))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.62, y: center.y - 3.8))
        bezierPath.addLine(to: CGPoint(x: center.x - 29.32, y: center.y - 5.59))
        bezierPath.addCurve(to: CGPoint(x: center.x - 29.93, y: center.y - 5.24), controlPoint1: CGPoint(x: center.x - 29.58, y: center.y - 5.66), controlPoint2: CGPoint(x: center.x - 29.86, y: center.y - 5.5))
        bezierPath.addCurve(to: CGPoint(x: center.x - 29.57, y: center.y - 4.63), controlPoint1: CGPoint(x: center.x - 30, y: center.y - 4.97), controlPoint2: CGPoint(x: center.x - 29.84, y: center.y - 4.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 23.85, y: center.y - 3.09))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.21, y: center.y - 0.57))
        bezierPath.addLine(to: CGPoint(x: center.x - 30, y: center.y - 1.61))
        bezierPath.addCurve(to: CGPoint(x: center.x - 30.5, y: center.y - 1.6), controlPoint1: CGPoint(x: center.x - 30.16, y: center.y - 1.69), controlPoint2: CGPoint(x: center.x - 30.35, y: center.y - 1.69))
        bezierPath.addLine(to: CGPoint(x: center.x - 32.54, y: center.y - 0.43))
        bezierPath.addCurve(to: CGPoint(x: center.x - 32.79, y: center.y + 0.01), controlPoint1: CGPoint(x: center.x - 32.7, y: center.y - 0.34), controlPoint2: CGPoint(x: center.x - 32.79, y: center.y - 0.17))
        bezierPath.addLine(to: CGPoint(x: center.x - 32.79, y: center.y + 1.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 32.79, y: center.y + 1.26))
        bezierPath.addLine(to: CGPoint(x: center.x - 32.79, y: center.y + 2.36))
        bezierPath.addCurve(to: CGPoint(x: center.x - 32.54, y: center.y + 2.79), controlPoint1: CGPoint(x: center.x - 32.79, y: center.y + 2.54), controlPoint2: CGPoint(x: center.x - 32.7, y: center.y + 2.71))
        bezierPath.addLine(to: CGPoint(x: center.x - 30.5, y: center.y + 3.98))
        bezierPath.addCurve(to: CGPoint(x: center.x - 30.25, y: center.y + 4.04), controlPoint1: CGPoint(x: center.x - 30.42, y: center.y + 4.02), controlPoint2: CGPoint(x: center.x - 30.34, y: center.y + 4.04))
        bezierPath.addCurve(to: CGPoint(x: center.x - 30, y: center.y + 3.98), controlPoint1: CGPoint(x: center.x - 30.16, y: center.y + 4.04), controlPoint2: CGPoint(x: center.x - 30.08, y: center.y + 4.02))
        bezierPath.addLine(to: CGPoint(x: center.x - 27.96, y: center.y + 2.79))
        bezierPath.addCurve(to: CGPoint(x: center.x - 27.71, y: center.y + 2.36), controlPoint1: CGPoint(x: center.x - 27.8, y: center.y + 2.71), controlPoint2: CGPoint(x: center.x - 27.71, y: center.y + 2.54))
        bezierPath.addLine(to: CGPoint(x: center.x - 27.71, y: center.y + 1.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 27.71, y: center.y + 0.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 23.35, y: center.y - 2.22))
        bezierPath.addLine(to: CGPoint(x: center.x - 24.88, y: center.y + 3.5))
        bezierPath.addCurve(to: CGPoint(x: center.x - 24.53, y: center.y + 4.11), controlPoint1: CGPoint(x: center.x - 24.95, y: center.y + 3.77), controlPoint2: CGPoint(x: center.x - 24.79, y: center.y + 4.04))
        bezierPath.addCurve(to: CGPoint(x: center.x - 24.4, y: center.y + 4.13), controlPoint1: CGPoint(x: center.x - 24.48, y: center.y + 4.12), controlPoint2: CGPoint(x: center.x - 24.44, y: center.y + 4.13))
        bezierPath.addCurve(to: CGPoint(x: center.x - 23.92, y: center.y + 3.76), controlPoint1: CGPoint(x: center.x - 24.18, y: center.y + 4.13), controlPoint2: CGPoint(x: center.x - 23.97, y: center.y + 3.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.12, y: center.y - 2.93))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.22, y: center.y - 4.03))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.73, y: center.y + 0.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y - 2.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y + 0.08))
        bezierPath.addLine(to: CGPoint(x: center.x - 21.79, y: center.y + 4.98))
        bezierPath.addCurve(to: CGPoint(x: center.x - 21.79, y: center.y + 5.69), controlPoint1: CGPoint(x: center.x - 21.99, y: center.y + 5.18), controlPoint2: CGPoint(x: center.x - 21.99, y: center.y + 5.49))
        bezierPath.addCurve(to: CGPoint(x: center.x - 21.09, y: center.y + 5.69), controlPoint1: CGPoint(x: center.x - 21.6, y: center.y + 5.88), controlPoint2: CGPoint(x: center.x - 21.28, y: center.y + 5.88))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y + 1.5))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y + 6.53))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.69, y: center.y + 7.56))
        bezierPath.addCurve(to: CGPoint(x: center.x - 18.94, y: center.y + 8), controlPoint1: CGPoint(x: center.x - 18.84, y: center.y + 7.65), controlPoint2: CGPoint(x: center.x - 18.94, y: center.y + 7.82))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.94, y: center.y + 10.36))
        bezierPath.addCurve(to: CGPoint(x: center.x - 18.69, y: center.y + 10.79), controlPoint1: CGPoint(x: center.x - 18.94, y: center.y + 10.54), controlPoint2: CGPoint(x: center.x - 18.84, y: center.y + 10.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.65, y: center.y + 11.97))
        bezierPath.addCurve(to: CGPoint(x: center.x - 16.4, y: center.y + 12.04), controlPoint1: CGPoint(x: center.x - 16.57, y: center.y + 12.02), controlPoint2: CGPoint(x: center.x - 16.48, y: center.y + 12.04))
        bezierPath.addCurve(to: CGPoint(x: center.x - 16.15, y: center.y + 11.97), controlPoint1: CGPoint(x: center.x - 16.31, y: center.y + 12.04), controlPoint2: CGPoint(x: center.x - 16.22, y: center.y + 12.01))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.1, y: center.y + 10.79))
        bezierPath.addCurve(to: CGPoint(x: center.x - 13.85, y: center.y + 10.36), controlPoint1: CGPoint(x: center.x - 13.95, y: center.y + 10.7), controlPoint2: CGPoint(x: center.x - 13.85, y: center.y + 10.54))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.85, y: center.y + 8))
        bezierPath.addCurve(to: CGPoint(x: center.x - 14.1, y: center.y + 7.57), controlPoint1: CGPoint(x: center.x - 13.85, y: center.y + 7.82), controlPoint2: CGPoint(x: center.x - 13.95, y: center.y + 7.66))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y + 6.53))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y + 1.5))
        bezierPath.addLine(to: CGPoint(x: center.x - 11.71, y: center.y + 5.69))
        bezierPath.addCurve(to: CGPoint(x: center.x - 11.35, y: center.y + 5.84), controlPoint1: CGPoint(x: center.x - 11.61, y: center.y + 5.79), controlPoint2: CGPoint(x: center.x - 11.48, y: center.y + 5.84))
        bezierPath.addCurve(to: CGPoint(x: center.x - 11, y: center.y + 5.69), controlPoint1: CGPoint(x: center.x - 11.22, y: center.y + 5.84), controlPoint2: CGPoint(x: center.x - 11.1, y: center.y + 5.79))
        bezierPath.addCurve(to: CGPoint(x: center.x - 11, y: center.y + 4.98), controlPoint1: CGPoint(x: center.x - 10.8, y: center.y + 5.5), controlPoint2: CGPoint(x: center.x - 10.8, y: center.y + 5.18))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y + 0.08))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y - 2.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.06, y: center.y + 0.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.58, y: center.y - 4.13))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.67, y: center.y - 2.93))
        bezierPath.addLine(to: CGPoint(x: center.x - 8.88, y: center.y + 3.76))
        bezierPath.addCurve(to: CGPoint(x: center.x - 8.4, y: center.y + 4.13), controlPoint1: CGPoint(x: center.x - 8.82, y: center.y + 3.98), controlPoint2: CGPoint(x: center.x - 8.62, y: center.y + 4.13))
        bezierPath.addCurve(to: CGPoint(x: center.x - 8.27, y: center.y + 4.11), controlPoint1: CGPoint(x: center.x - 8.35, y: center.y + 4.13), controlPoint2: CGPoint(x: center.x - 8.31, y: center.y + 4.12))
        bezierPath.addCurve(to: CGPoint(x: center.x - 7.91, y: center.y + 3.5), controlPoint1: CGPoint(x: center.x - 8, y: center.y + 4.04), controlPoint2: CGPoint(x: center.x - 7.84, y: center.y + 3.77))
        bezierPath.addLine(to: CGPoint(x: center.x - 9.44, y: center.y - 2.22))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.09, y: center.y + 0.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.09, y: center.y + 2.36))
        bezierPath.addCurve(to: CGPoint(x: center.x - 4.84, y: center.y + 2.8), controlPoint1: CGPoint(x: center.x - 5.09, y: center.y + 2.54), controlPoint2: CGPoint(x: center.x - 4.99, y: center.y + 2.71))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.79, y: center.y + 3.98))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.54, y: center.y + 4.04), controlPoint1: CGPoint(x: center.x - 2.72, y: center.y + 4.02), controlPoint2: CGPoint(x: center.x - 2.63, y: center.y + 4.04))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.29, y: center.y + 3.98), controlPoint1: CGPoint(x: center.x - 2.46, y: center.y + 4.04), controlPoint2: CGPoint(x: center.x - 2.37, y: center.y + 4.02))
        bezierPath.addLine(to: CGPoint(x: center.x - 0.25, y: center.y + 2.8))
        bezierPath.addCurve(to: CGPoint(x: center.x, y: center.y + 2.36), controlPoint1: CGPoint(x: center.x - 0.10, y: center.y + 2.71), controlPoint2: CGPoint(x: center.x, y: center.y + 2.54))
        bezierPath.addLine(to: CGPoint(x: center.x, y: center.y + 1.11))
        bezierPath.addLine(to: CGPoint(x: center.x, y: center.y))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 4.09, y: center.y - 14.89))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y - 15.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.55, y: center.y - 16.59))
        bezierPath.addLine(to: CGPoint(x: center.x - 1.48, y: center.y - 15.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 1.01, y: center.y - 15.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 1.01, y: center.y - 15.15))
        bezierPath.addLine(to: CGPoint(x: center.x - 1, y: center.y - 13.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.55, y: center.y - 13.03))
        bezierPath.addLine(to: CGPoint(x: center.x - 3.59, y: center.y - 13.63))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y - 13.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y - 14.5))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y - 14.89))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 31.79, y: center.y - 15.15))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y - 15.71))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.31, y: center.y - 15.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 30.25, y: center.y - 16.59))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.71, y: center.y - 15.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.71, y: center.y - 14.5))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.71, y: center.y - 13.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 29.21, y: center.y - 13.63))
        bezierPath.addLine(to: CGPoint(x: center.x - 30.25, y: center.y - 13.03))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y - 13.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y - 15.15))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 28.71, y: center.y + 2.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 30.25, y: center.y + 2.96))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.32, y: center.y + 2.35))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y + 2.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y + 1.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y + 1.25))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y + 1.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 31.79, y: center.y + 0.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 30.25, y: center.y - 0.59))
        bezierPath.addLine(to: CGPoint(x: center.x - 29.21, y: center.y + 0.01))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.71, y: center.y + 0.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.71, y: center.y + 0.87))
        bezierPath.addLine(to: CGPoint(x: center.x - 28.71, y: center.y + 2.07))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 13.3, y: center.y - 1.45))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y - 3.35))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.4, y: center.y - 3.72))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y - 3.35))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.5, y: center.y - 1.45))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.15, y: center.y - 4.65))
        bezierPath.addLine(to: CGPoint(x: center.x - 9.08, y: center.y - 5.27))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.65, y: center.y - 5.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.59, y: center.y - 6.82))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.65, y: center.y - 8.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.08, y: center.y - 8.36))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.15, y: center.y - 8.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 19.49, y: center.y - 12.18))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y - 10.28))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.4, y: center.y - 9.91))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y - 10.28))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.3, y: center.y - 12.18))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.65, y: center.y - 8.98))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.72, y: center.y - 8.37))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.15, y: center.y - 8.12))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.2, y: center.y - 6.82))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.15, y: center.y - 5.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.72, y: center.y - 5.27))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.65, y: center.y - 4.65))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.3, y: center.y - 1.45))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 17.94, y: center.y - 23.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.88, y: center.y - 24.32))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.4, y: center.y - 24.59))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.92, y: center.y - 24.32))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.86, y: center.y - 23.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.86, y: center.y - 21.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y - 21.32))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.4, y: center.y - 21.03))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y - 21.32))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.94, y: center.y - 21.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.94, y: center.y - 23.7))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.94, y: center.y - 23.7))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 14.86, y: center.y + 10.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y + 10.68))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.4, y: center.y + 10.96))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.58, y: center.y + 10.68))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.94, y: center.y + 10.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.94, y: center.y + 8.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.9, y: center.y + 7.69))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.4, y: center.y + 7.4))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.9, y: center.y + 7.69))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.86, y: center.y + 8.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.86, y: center.y + 10.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.86, y: center.y + 10.07))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 4.09, y: center.y + 1.11))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y + 0.87))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y + 0.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 3.59, y: center.y + 0.01))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.54, y: center.y - 0.6))
        bezierPath.addLine(to: CGPoint(x: center.x - 1, y: center.y + 0.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 1, y: center.y + 1.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 1, y: center.y + 2.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 1.47, y: center.y + 2.35))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.54, y: center.y + 2.96))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.08, y: center.y + 2.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.09, y: center.y + 1.11))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        bezierPath.lineWidth = 3
        
    }
    
    
    
    
    func drawCandyCane(center: CGPoint) {
        
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        if isRandomColor {
            
            if candyCaneCounter >= 4 {
                candyCaneCounter = 0
            } else {
                candyCaneCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[candyCaneCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        
        let bezierPath = UIBezierPath()
        //            bezierPath.move(to: CGPoint(x: 29.5, y: 3.92))
        bezierPath.move(to: center)
        bezierPath.addCurve(to: CGPoint(x: center.x - 7.16, y: center.y - 2.92), controlPoint1: CGPoint(x: center.x - 1.91, y: center.y - 1.88), controlPoint2: CGPoint(x: center.x - 4.45, y: center.y - 2.92))
        bezierPath.addCurve(to: CGPoint(x: center.x - 14.32, y: center.y), controlPoint1: CGPoint(x: center.x - 9.86, y: center.y - 2.92), controlPoint2: CGPoint(x: center.x - 12.41, y: center.y - 1.88))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.61, y: center.y + 4.24))
        bezierPath.addCurve(to: CGPoint(x: center.x - 19.59, y: center.y + 6.56), controlPoint1: CGPoint(x: center.x - 19.24, y: center.y + 4.86), controlPoint2: CGPoint(x: center.x - 19.59, y: center.y + 5.68))
        bezierPath.addCurve(to: CGPoint(x: center.x - 18.61, y: center.y + 8.88), controlPoint1: CGPoint(x: center.x - 19.59, y: center.y + 7.43), controlPoint2: CGPoint(x: center.x - 19.24, y: center.y + 8.26))
        bezierPath.addCurve(to: CGPoint(x: center.x - 16.26, y: center.y + 9.84), controlPoint1: CGPoint(x: center.x - 17.99, y: center.y + 9.5), controlPoint2: CGPoint(x: center.x - 17.15, y: center.y + 9.84))
        bezierPath.addCurve(to: CGPoint(x: center.x - 13.92, y: center.y + 8.88), controlPoint1: CGPoint(x: center.x - 15.38, y: center.y + 9.84), controlPoint2: CGPoint(x: center.x - 14.54, y: center.y + 9.5))
        bezierPath.addLine(to: CGPoint(x: center.x - 9.62, y: center.y + 4.64))
        bezierPath.addCurve(to: CGPoint(x: center.x - 7.16, y: center.y + 3.64), controlPoint1: CGPoint(x: center.x - 8.96, y: center.y + 3.99), controlPoint2: CGPoint(x: center.x - 8.09, y: center.y + 3.64))
        bezierPath.addCurve(to: CGPoint(x: center.x - 4.8, y: center.y + 4.64), controlPoint1: CGPoint(x: center.x - 6.23, y: center.y + 3.64), controlPoint2: CGPoint(x: center.x - 5.35, y: center.y + 3.99))
        bezierPath.addCurve(to: CGPoint(x: center.x - 3.68, y: center.y + 7.06), controlPoint1: CGPoint(x: center.x - 4.04, y: center.y + 5.29), controlPoint2: CGPoint(x: center.x - 3.68, y: center.y + 6.15))
        bezierPath.addCurve(to: CGPoint(x: center.x - 4.7, y: center.y + 9.49), controlPoint1: CGPoint(x: center.x - 3.68, y: center.y + 7.98), controlPoint2: CGPoint(x: center.x - 4.04, y: center.y + 8.84))
        bezierPath.addLine(to: CGPoint(x: center.x - 25.99, y: center.y + 30.48))
        bezierPath.addCurve(to: CGPoint(x: center.x - 26.96, y: center.y + 32.8), controlPoint1: CGPoint(x: center.x - 26.62, y: center.y + 31.1), controlPoint2: CGPoint(x: center.x - 26.96, y: center.y + 31.92))
        bezierPath.addCurve(to: CGPoint(x: center.x - 25.99, y: center.y + 35.12), controlPoint1: CGPoint(x: center.x - 26.96, y: center.y + 33.68), controlPoint2: CGPoint(x: center.x - 26.62, y: center.y + 34.5))
        bezierPath.addCurve(to: CGPoint(x: center.x - 23.64, y: center.y + 36.08), controlPoint1: CGPoint(x: center.x - 25.36, y: center.y + 35.74), controlPoint2: CGPoint(x: center.x - 24.53, y: center.y + 36.08))
        bezierPath.addCurve(to: CGPoint(x: center.x - 21.29, y: center.y + 35.12), controlPoint1: CGPoint(x: center.x - 22.75, y: center.y + 36.08), controlPoint2: CGPoint(x: center.x - 21.92, y: center.y + 35.74))
        bezierPath.addLine(to: CGPoint(x: center.x, y: center.y + 14.13))
        bezierPath.addCurve(to: CGPoint(x: center.x + 2.97, y: center.y + 7.06), controlPoint1: CGPoint(x: center.x + 1.91, y: center.y + 12.24), controlPoint2: CGPoint(x: center.x + 2.97, y: center.y + 9.73))
        bezierPath.addCurve(to: CGPoint(x: center.x, y: center.y), controlPoint1: CGPoint(x: center.x + 2.97, y: center.y + 4.39), controlPoint2: CGPoint(x: center.x + 1.91, y: center.y + 1.88))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 14.77, y: center.y + 8.03))
        bezierPath.addCurve(to: CGPoint(x: center.x - 16.26, y: center.y + 8.64), controlPoint1: CGPoint(x: center.x - 15.17, y: center.y + 8.43), controlPoint2: CGPoint(x: center.x - 15.7, y: center.y + 8.64))
        bezierPath.addCurve(to: CGPoint(x: center.x - 17.76, y: center.y + 8.03), controlPoint1: CGPoint(x: center.x - 16.83, y: center.y + 8.64), controlPoint2: CGPoint(x: center.x - 17.36, y: center.y + 8.43))
        bezierPath.addCurve(to: CGPoint(x: center.x - 18.38, y: center.y + 6.67), controlPoint1: CGPoint(x: center.x - 18.14, y: center.y + 7.66), controlPoint2: CGPoint(x: center.x - 18.35, y: center.y + 7.18))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.44, y: center.y + 7.71))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.77, y: center.y + 8.03))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 12.46, y: center.y + 5.76))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.19, y: center.y + 4.51))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.16, y: center.y + 2.52))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.51, y: center.y + 3.84))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.46, y: center.y + 5.76))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 13.2, y: center.y + 0.59))
        bezierPath.addCurve(to: CGPoint(x: center.x - 8.36, y: center.y - 1.65), controlPoint1: CGPoint(x: center.x - 11.85, y: center.y - 0.64), controlPoint2: CGPoint(x: center.x - 10.17, y: center.y - 1.41))
        bezierPath.addLine(to: CGPoint(x: center.x - 7.77, y: center.y + 2.13))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.2, y: center.y + 0.59))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x + 1.7, y: center.y + 6.08))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.58, y: center.y + 6.08))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.58, y: center.y + 6.08))
        bezierPath.addCurve(to: CGPoint(x: center.x - 3.15, y: center.y + 4.67), controlPoint1: CGPoint(x: center.x - 2.69, y: center.y + 5.58), controlPoint2: CGPoint(x: center.x - 2.88, y: center.y + 5.1))
        bezierPath.addLine(to: CGPoint(x: center.x - 0.11, y: center.y + 1.67))
        bezierPath.addCurve(to: CGPoint(x: center.x + 1.7, y: center.y + 6.08), controlPoint1: CGPoint(x: center.x + 0.9, y: center.y + 2.95), controlPoint2: CGPoint(x: center.x + 1.52, y: center.y + 4.47))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 4.89, y: center.y + 3.02))
        bezierPath.addCurve(to: CGPoint(x: center.x - 5.22, y: center.y + 2.85), controlPoint1: CGPoint(x: center.x - 5, y: center.y + 2.96), controlPoint2: CGPoint(x: center.x - 5.11, y: center.y + 2.9))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.92, y: center.y - 1.64))
        bezierPath.addCurve(to: CGPoint(x: center.x - 1.84, y: center.y), controlPoint1: CGPoint(x: center.x - 4.43, y: center.y - 1.44), controlPoint2: CGPoint(x: center.x - 3.04, y: center.y - 0.88))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.89, y: center.y + 3.02))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 22.14, y: center.y + 34.27))
        bezierPath.addCurve(to: CGPoint(x: center.x - 23.64, y: center.y + 34.89), controlPoint1: CGPoint(x: center.x - 22.54, y: center.y + 34.67), controlPoint2: CGPoint(x: center.x - 23.07, y: center.y + 34.89))
        bezierPath.addCurve(to: CGPoint(x: center.x - 25.14, y: center.y + 34.27), controlPoint1: CGPoint(x: center.x - 24.21, y: center.y + 34.89), controlPoint2: CGPoint(x: center.x - 24.74, y: center.y + 34.67))
        bezierPath.addCurve(to: CGPoint(x: center.x - 25.76, y: center.y + 32.8), controlPoint1: CGPoint(x: center.x - 25.54, y: center.y + 33.88), controlPoint2: CGPoint(x: center.x - 25.76, y: center.y + 33.36))
        bezierPath.addCurve(to: CGPoint(x: center.x - 25.14, y: center.y + 31.33), controlPoint1: CGPoint(x: center.x - 25.76, y: center.y + 32.24), controlPoint2: CGPoint(x: center.x - 25.54, y: center.y + 32.02))
        bezierPath.addLine(to: CGPoint(x: center.x - 24.81, y: center.y + 31))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.09, y: center.y + 32.25))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.14, y: center.y + 34.27))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 18.11, y: center.y + 30.33))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.83, y: center.y + 29.05))
        bezierPath.addLine(to: CGPoint(x: center.x - 20.96, y: center.y + 27.2))
        bezierPath.addLine(to: CGPoint(x: center.x - 16.24, y: center.y + 28.45))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.11, y: center.y + 30.3))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 14.26, y: center.y + 26.5))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.98, y: center.y + 25.26))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.11, y: center.y + 23.41))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.39, y: center.y + 24.66))
        bezierPath.addLine(to: CGPoint(x: center.x - 14.26, y: center.y + 26.5))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 10.41, y: center.y + 22.71))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.13, y: center.y + 21.46))
        bezierPath.addLine(to: CGPoint(x: center.x - 13.26, y: center.y + 19.62))
        bezierPath.addLine(to: CGPoint(x: center.x - 8.54, y: center.y + 20.86))
        bezierPath.addLine(to: CGPoint(x: center.x - 10.41, y: center.y + 22.71))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 6.56, y: center.y + 18.92))
        bezierPath.addLine(to: CGPoint(x: center.x - 11.29, y: center.y + 17.67))
        bezierPath.addLine(to: CGPoint(x: center.x - 9.41, y: center.y + 15.82))
        bezierPath.addLine(to: CGPoint(x: center.x - 4.69, y: center.y + 17.07))
        bezierPath.addLine(to: CGPoint(x: center.x - 6.56, y: center.y + 18.92))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x - 0.85, y: center.y + 13.28))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.72, y: center.y + 15.12))
        bezierPath.addLine(to: CGPoint(x: center.x - 7.44, y: center.y + 13.87))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.57, y: center.y + 12.03))
        bezierPath.addLine(to: CGPoint(x: center.x - 0.84, y: center.y + 13.28))
        bezierPath.addCurve(to: CGPoint(x: center.x - 0.85, y: center.y + 13.28), controlPoint1: CGPoint(x: center.x - 0.85, y: center.y + 13.28), controlPoint2: CGPoint(x: center.x - 0.85, y: center.y + 13.28))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: center.x + 0.71, y: center.y + 11.22))
        bezierPath.addLine(to: CGPoint(x: center.x - 3.61, y: center.y + 10.07))
        bezierPath.addCurve(to: CGPoint(x: center.x - 2.69, y: center.y + 8.47), controlPoint1: CGPoint(x: center.x - 3.19, y: center.y + 9.6), controlPoint2: CGPoint(x: center.x - 2.88, y: center.y + 9.06))
        bezierPath.addLine(to: CGPoint(x: center.x + 1.65, y: center.y + 8.47))
        bezierPath.addCurve(to: CGPoint(x: center.x + 0.71, y: center.y + 11.22), controlPoint1: CGPoint(x: center.x + 1.49, y: center.y + 9.44), controlPoint2: CGPoint(x: center.x + 1.17, y: center.y + 10.36))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
    }
    
    
    
    
    func drawHolly(center: CGPoint) {
        
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        if isRandomColor {
            
            if hollyCounter >= 4 {
                hollyCounter = 0
            } else {
                hollyCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[hollyCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        
        let bezier2Path = UIBezierPath()
        //            bezier2Path.move(to: CGPoint(x: 16.1, y: 11.85))
        bezier2Path.move(to: center)
        bezier2Path.addCurve(to: CGPoint(x: center.x - 2.36, y: center.y - 1.2), controlPoint1: CGPoint(x: center.x - 1.01, y: center.y - 0.24), controlPoint2: CGPoint(x: center.x - 1.99, y: center.y - 0.04))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 1.64, y: center.y - 3.54), controlPoint1: CGPoint(x: center.x - 2.63, y: center.y - 2.03), controlPoint2: CGPoint(x: center.x - 2.28, y: center.y - 2.96))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 3.02, y: center.y - 4.87), controlPoint1: CGPoint(x: center.x - 0.69, y: center.y - 4.38), controlPoint2: CGPoint(x: center.x - 2.07, y: center.y - 5.63))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 5.39, y: center.y - 6.93), controlPoint1: CGPoint(x: center.x - 5.01, y: center.y - 3.31), controlPoint2: CGPoint(x: center.x - 5.55, y: center.y - 5.3))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 5.12, y: center.y - 7.43), controlPoint1: CGPoint(x: center.x - 5.3, y: center.y - 7.09), controlPoint2: CGPoint(x: center.x - 5.22, y: center.y - 7.29))
        bezier2Path.addLine(to: CGPoint(x: center.x - 5.12, y: center.y - 7.43))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 5.06, y: center.y - 7.54), controlPoint1: CGPoint(x: center.x - 5.1, y: center.y - 7.48), controlPoint2: CGPoint(x: center.x - 5.08, y: center.y - 7.5))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 5.1, y: center.y - 7.9), controlPoint1: CGPoint(x: center.x - 4.99, y: center.y - 7.66), controlPoint2: CGPoint(x: center.x - 5.01, y: center.y - 7.81))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 5.19, y: center.y - 8.04), controlPoint1: CGPoint(x: center.x - 5.12, y: center.y - 7.96), controlPoint2: CGPoint(x: center.x - 5.14, y: center.y - 8))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 5.98, y: center.y - 8.3), controlPoint1: CGPoint(x: center.x - 5.23, y: center.y - 8.38), controlPoint2: CGPoint(x: center.x - 5.71, y: center.y - 8.6))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 6.02, y: center.y - 8.24), controlPoint1: CGPoint(x: center.x - 6, y: center.y - 8.28), controlPoint2: CGPoint(x: center.x - 6, y: center.y - 8.26))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 9.42, y: center.y - 8.51), controlPoint1: CGPoint(x: center.x - 7.22, y: center.y - 8.15), controlPoint2: CGPoint(x: center.x - 8.17, y: center.y - 7.94))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 11.33, y: center.y - 10.19), controlPoint1: CGPoint(x: center.x - 10.25, y: center.y - 8.89), controlPoint2: CGPoint(x: center.x - 10.87, y: center.y - 9.49))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 11.94, y: center.y - 11.55), controlPoint1: CGPoint(x: center.x - 11.37, y: center.y - 10.78), controlPoint2: CGPoint(x: center.x - 11.55, y: center.y - 11.29))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 11.96, y: center.y - 11.59), controlPoint1: CGPoint(x: center.x - 11.94, y: center.y - 11.57), controlPoint2: CGPoint(x: center.x - 11.96, y: center.y - 11.57))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 12.73, y: center.y - 11.5), controlPoint1: CGPoint(x: center.x - 12.07, y: center.y - 11.99), controlPoint2: CGPoint(x: center.x - 12.73, y: center.y - 11.91))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 12.8, y: center.y - 11.44), controlPoint1: CGPoint(x: center.x - 12.75, y: center.y - 11.48), controlPoint2: CGPoint(x: center.x - 12.77, y: center.y - 11.46))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 12.9, y: center.y - 8.52), controlPoint1: CGPoint(x: center.x - 13.3, y: center.y - 10.78), controlPoint2: CGPoint(x: center.x - 12.84, y: center.y - 9.32))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 15.01, y: center.y - 4.88), controlPoint1: CGPoint(x: center.x - 13.03, y: center.y - 7.08), controlPoint2: CGPoint(x: center.x - 13.65, y: center.y - 5.58))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 15.12, y: center.y - 4.14), controlPoint1: CGPoint(x: center.x - 15.32, y: center.y - 4.73), controlPoint2: CGPoint(x: center.x - 15.3, y: center.y - 4.35))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 15.16, y: center.y - 3.65), controlPoint1: CGPoint(x: center.x - 15.23, y: center.y - 4.01), controlPoint2: CGPoint(x: center.x - 15.27, y: center.y - 3.82))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 13.65, y: center.y - 2.79), controlPoint1: CGPoint(x: center.x - 14.77, y: center.y - 3.13), controlPoint2: CGPoint(x: center.x - 14.19, y: center.y - 3.13))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 12.95, y: center.y - 1.2), controlPoint1: CGPoint(x: center.x - 13.1, y: center.y - 2.45), controlPoint2: CGPoint(x: center.x - 12.95, y: center.y - 1.79))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 13.49, y: center.y + 1.26), controlPoint1: CGPoint(x: center.x - 12.92, y: center.y - 0.5), controlPoint2: CGPoint(x: center.x - 13.15, y: center.y + 0.54))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 14.13, y: center.y + 1.54), controlPoint1: CGPoint(x: center.x - 13.71, y: center.y + 1.32), controlPoint2: CGPoint(x: center.x - 13.93, y: center.y + 1.38))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 14, y: center.y + 2.49), controlPoint1: CGPoint(x: center.x - 14.5, y: center.y + 1.81), controlPoint2: CGPoint(x: center.x - 14.46, y: center.y + 2.32))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 11.23, y: center.y + 3.47), controlPoint1: CGPoint(x: center.x - 12.95, y: center.y + 2.85), controlPoint2: CGPoint(x: center.x - 11.96, y: center.y + 2.39))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 10.92, y: center.y + 6.01), controlPoint1: CGPoint(x: center.x - 10.73, y: center.y + 4.19), controlPoint2: CGPoint(x: center.x - 10.8, y: center.y + 5.16))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 11.32, y: center.y + 6.67), controlPoint1: CGPoint(x: center.x - 11.17, y: center.y + 6.11), controlPoint2: CGPoint(x: center.x - 11.32, y: center.y + 6.31))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 11.05, y: center.y + 6.83), controlPoint1: CGPoint(x: center.x - 11.32, y: center.y + 6.81), controlPoint2: CGPoint(x: center.x - 11.19, y: center.y + 6.88))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 10.55, y: center.y + 6.81), controlPoint1: CGPoint(x: center.x - 10.92, y: center.y + 6.98), controlPoint2: CGPoint(x: center.x - 10.66, y: center.y + 7))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 10.51, y: center.y + 6.73), controlPoint1: CGPoint(x: center.x - 10.53, y: center.y + 6.79), controlPoint2: CGPoint(x: center.x - 10.53, y: center.y + 6.77))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 3.82, y: center.y + 11.09), controlPoint1: CGPoint(x: center.x - 9.08, y: center.y + 7.23), controlPoint2: CGPoint(x: center.x - 4.3, y: center.y + 10.43))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 2.55, y: center.y + 10.75), controlPoint1: CGPoint(x: center.x - 3.44, y: center.y + 11.59), controlPoint2: CGPoint(x: center.x - 2.55, y: center.y + 11.45))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 2.57, y: center.y + 6.56), controlPoint1: CGPoint(x: center.x - 2.55, y: center.y + 9.35), controlPoint2: CGPoint(x: center.x - 2.61, y: center.y + 7.95))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 0.99, y: center.y + 2.22), controlPoint1: CGPoint(x: center.x - 2.51, y: center.y + 4.82), controlPoint2: CGPoint(x: center.x - 1.8, y: center.y + 3.68))
        bezier2Path.addCurve(to: CGPoint(x: center.x - 0.95, y: center.y + 1.86), controlPoint1: CGPoint(x: center.x - 0.93, y: center.y + 2.09), controlPoint2: CGPoint(x: center.x - 0.93, y: center.y + 1.96))
        bezier2Path.addCurve(to: CGPoint(x: center.x + 0.21, y: center.y + 1.5), controlPoint1: CGPoint(x: center.x - 0.58, y: center.y + 1.81), controlPoint2: CGPoint(x: center.x - 0.2, y: center.y + 1.71))
        bezier2Path.addCurve(to: CGPoint(x: center.x, y: center.y), controlPoint1: CGPoint(x: center.x + 0.87, y: center.y + 1.15), controlPoint2: CGPoint(x: center.x + 0.69, y: center.y + 0.17))
        bezier2Path.close()
        color.setFill()
        bezier2Path.fill()
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: center.x + 20.13, y: center.y + 5.43))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 19.57, y: center.y + 0.09), controlPoint1: CGPoint(x: center.x + 19.29, y: center.y + 3.63), controlPoint2: CGPoint(x: center.x + 19.14, y: center.y + 2.01))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 19.7, y: center.y - 0.12), controlPoint1: CGPoint(x: center.x + 19.62, y: center.y + 0.03), controlPoint2: CGPoint(x: center.x + 19.66, y: center.y - 0.03))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 19.06, y: center.y - 0.93), controlPoint1: CGPoint(x: center.x + 19.88, y: center.y - 0.53), controlPoint2: CGPoint(x: center.x + 19.6, y: center.y - 1.1))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 16.83, y: center.y - 0.19), controlPoint1: CGPoint(x: center.x + 18.25, y: center.y - 0.67), controlPoint2: CGPoint(x: center.x + 17.77, y: center.y - 0.06))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 14.92, y: center.y - 1.29), controlPoint1: CGPoint(x: center.x + 16.08, y: center.y - 0.29), controlPoint2: CGPoint(x: center.x + 15.44, y: center.y - 0.76))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 13.8, y: center.y - 1.41), controlPoint1: CGPoint(x: center.x + 14.88, y: center.y - 1.94), controlPoint2: CGPoint(x: center.x + 14.02, y: center.y - 1.99))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 12.29, y: center.y + 0.54), controlPoint1: CGPoint(x: center.x + 13.45, y: center.y - 0.55), controlPoint2: CGPoint(x: center.x + 13.26, y: center.y + 0.15))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 9.55, y: center.y - 0.03), controlPoint1: CGPoint(x: center.x + 11.34, y: center.y + 0.9), controlPoint2: CGPoint(x: center.x + 10.32, y: center.y + 0.44))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 8.58, y: center.y + 0.35), controlPoint1: CGPoint(x: center.x + 9.18, y: center.y - 0.27), controlPoint2: CGPoint(x: center.x + 8.7, y: center.y - 0.03))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 6.59, y: center.y + 2.21), controlPoint1: CGPoint(x: center.x + 8.27, y: center.y + 1.36), controlPoint2: CGPoint(x: center.x + 7.59, y: center.y + 1.87))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 5.2, y: center.y + 2.46), controlPoint1: CGPoint(x: center.x + 6.44, y: center.y + 2.27), controlPoint2: CGPoint(x: center.x + 5.49, y: center.y + 2.29))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 4.74, y: center.y + 1.89), controlPoint1: CGPoint(x: center.x + 5.07, y: center.y + 2.25), controlPoint2: CGPoint(x: center.x + 4.92, y: center.y + 2.06))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 3.82, y: center.y + 2.42), controlPoint1: CGPoint(x: center.x + 4.35, y: center.y + 1.49), controlPoint2: CGPoint(x: center.x + 3.67, y: center.y + 1.91))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 4.06, y: center.y + 7.31), controlPoint1: CGPoint(x: center.x + 4.3, y: center.y + 4.17), controlPoint2: CGPoint(x: center.x + 4.87, y: center.y + 5.51))
        bezier3Path.addCurve(to: CGPoint(x: center.x - 0.37, y: center.y + 10.17), controlPoint1: CGPoint(x: center.x + 3.27, y: center.y + 9.03), controlPoint2: CGPoint(x: center.x + 1.47, y: center.y + 9.91))
        bezier3Path.addCurve(to: CGPoint(x: center.x - 0.2, y: center.y + 11.39), controlPoint1: CGPoint(x: center.x - 1.09, y: center.y + 10.27), controlPoint2: CGPoint(x: center.x - 0.92, y: center.y + 11.44))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 1.78, y: center.y + 10.97), controlPoint1: CGPoint(x: center.x + 0.51, y: center.y + 11.35), controlPoint2: CGPoint(x: center.x + 1.17, y: center.y + 11.2))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 5.57, y: center.y + 10.53), controlPoint1: CGPoint(x: center.x + 3.02, y: center.y + 10.81), controlPoint2: CGPoint(x: center.x + 4.28, y: center.y + 10.57))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 10.27, y: center.y + 12.67), controlPoint1: CGPoint(x: center.x + 7.68, y: center.y + 10.49), controlPoint2: CGPoint(x: center.x + 8.82, y: center.y + 11.37))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 10.95, y: center.y + 12.79), controlPoint1: CGPoint(x: center.x + 10.49, y: center.y + 12.88), controlPoint2: CGPoint(x: center.x + 10.75, y: center.y + 12.88))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 11.05, y: center.y + 12.96), controlPoint1: CGPoint(x: center.x + 10.99, y: center.y + 12.85), controlPoint2: CGPoint(x: center.x + 11.01, y: center.y + 12.92))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 11.63, y: center.y + 12.72), controlPoint1: CGPoint(x: center.x + 11.26, y: center.y + 13.24), controlPoint2: CGPoint(x: center.x + 11.74, y: center.y + 13.06))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 13.54, y: center.y + 9.46), controlPoint1: CGPoint(x: center.x + 11.15, y: center.y + 11.05), controlPoint2: CGPoint(x: center.x + 12.09, y: center.y + 9.59))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 14.43, y: center.y + 9.57), controlPoint1: CGPoint(x: center.x + 13.8, y: center.y + 9.63), controlPoint2: CGPoint(x: center.x + 14.13, y: center.y + 9.68))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 15.22, y: center.y + 9.91), controlPoint1: CGPoint(x: center.x + 14.7, y: center.y + 9.65), controlPoint2: CGPoint(x: center.x + 14.93, y: center.y + 9.76))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 16.32, y: center.y + 9.1), controlPoint1: CGPoint(x: center.x + 15.77, y: center.y + 10.24), controlPoint2: CGPoint(x: center.x + 16.47, y: center.y + 9.69))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 19.37, y: center.y + 6.43), controlPoint1: CGPoint(x: center.x + 15.7, y: center.y + 6.94), controlPoint2: CGPoint(x: center.x + 17.39, y: center.y + 6.14))
        bezier3Path.addCurve(to: CGPoint(x: center.x + 20.13, y: center.y + 5.43), controlPoint1: CGPoint(x: center.x + 19.98, y: center.y + 6.53), controlPoint2: CGPoint(x: center.x + 20.39, y: center.y + 5.99))
        bezier3Path.close()
        color.setFill()
        bezier3Path.fill()
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: center.x - 3.29, y: center.y + 14.98))
        bezier4Path.addCurve(to: CGPoint(x: center.x - 5.11, y: center.y + 12.52), controlPoint1: CGPoint(x: center.x - 3.49, y: center.y + 13.94), controlPoint2: CGPoint(x: center.x - 4.12, y: center.y + 12.99))
        bezier4Path.addCurve(to: CGPoint(x: center.x - 7.57, y: center.y + 12.27), controlPoint1: CGPoint(x: center.x - 5.79, y: center.y + 12.18), controlPoint2: CGPoint(x: center.x - 6.76, y: center.y + 12.06))
        bezier4Path.addCurve(to: CGPoint(x: center.x - 11.89, y: center.y + 15.44), controlPoint1: CGPoint(x: center.x - 9.52, y: center.y + 11.84), controlPoint2: CGPoint(x: center.x - 11.5, y: center.y + 13.56))
        bezier4Path.addCurve(to: CGPoint(x: center.x - 6.86, y: center.y + 19.94), controlPoint1: CGPoint(x: center.x - 12.49, y: center.y + 18.3), controlPoint2: CGPoint(x: center.x - 9.63, y: center.y + 20.3))
        bezier4Path.addCurve(to: CGPoint(x: center.x - 3.29, y: center.y + 14.98), controlPoint1: CGPoint(x: center.x - 4.43, y: center.y + 19.58), controlPoint2: CGPoint(x: center.x - 2.85, y: center.y + 17.26))
        bezier4Path.close()
        color.setFill()
        bezier4Path.fill()
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: center.x + 5.43, y: center.y + 15.4))
        bezier5Path.addCurve(to: CGPoint(x: center.x + 2.86, y: center.y + 13.5), controlPoint1: CGPoint(x: center.x + 4.83, y: center.y + 14.49), controlPoint2: CGPoint(x: center.x + 3.89, y: center.y + 13.86))
        bezier5Path.addCurve(to: CGPoint(x: center.x - 0.54, y: center.y + 14.2), controlPoint1: CGPoint(x: center.x + 1.83, y: center.y + 13.14), controlPoint2: CGPoint(x: center.x + 0.07, y: center.y + 13.18))
        bezier5Path.addCurve(to: CGPoint(x: center.x - 2.05, y: center.y + 18.94), controlPoint1: CGPoint(x: center.x - 2.16, y: center.y + 15.06), controlPoint2: CGPoint(x: center.x - 2.73, y: center.y + 17.25))
        bezier5Path.addCurve(to: CGPoint(x: center.x + 3.87, y: center.y + 20.74), controlPoint1: CGPoint(x: center.x - 1.09, y: center.y + 21.31), controlPoint2: CGPoint(x: center.x + 1.63, y: center.y + 21.8))
        bezier5Path.addCurve(to: CGPoint(x: center.x + 5.43, y: center.y + 15.4), controlPoint1: CGPoint(x: center.x + 6.06, y: center.y + 19.7), controlPoint2: CGPoint(x: center.x + 6.7, y: center.y + 17.4))
        bezier5Path.close()
        color.setFill()
        bezier5Path.fill()
        
        
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: center.x - 4.53, y: center.y + 20.12))
        bezier6Path.addCurve(to: CGPoint(x: center.x - 5.72, y: center.y + 28.28), controlPoint1: CGPoint(x: center.x - 9.67, y: center.y + 19.59), controlPoint2: CGPoint(x: center.x - 10.99, y: center.y + 27.68))
        bezier6Path.addCurve(to: CGPoint(x: center.x - 0.23, y: center.y + 24.08), controlPoint1: CGPoint(x: center.x - 2.98, y: center.y + 28.57), controlPoint2: CGPoint(x: center.x - 0.45, y: center.y + 26.78))
        bezier6Path.addCurve(to: CGPoint(x: center.x - 4.53, y: center.y + 20.12), controlPoint1: CGPoint(x: center.x - 0.06, y: center.y + 22.03), controlPoint2: CGPoint(x: center.x - 2.34, y: center.y + 19.56))
        bezier6Path.close()
        color.setFill()
        bezier6Path.fill()
        
    }
    
    
    
    
    func drawDeer(center: CGPoint) {
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        if isRandomColor {
            
            if deerCounter >= 4 {
                deerCounter = 0
            } else {
                deerCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[deerCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        
        
        //            let bezierPath = UIBezierPath()
        ////            bezierPath.move(to: CGPoint(x: 48.79, y: 14.1))
        //            bezierPath.move(to: center)
        //            bezierPath.addCurve(to: CGPoint(x: center.x 46.19, y: center.y 12.56), controlPoint1: CGPoint(x: center.x 47.86, y: center.y 13.7), controlPoint2: CGPoint(x: center.x 46.99, y: center.y 13.19))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 45.48, y: center.y 11.9), controlPoint1: CGPoint(x: center.x 45.94, y: center.y 12.35), controlPoint2: CGPoint(x: center.x 45.71, y: center.y 12.13))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 44.07, y: center.y 10.88), controlPoint1: CGPoint(x: center.x 45.07, y: center.y 11.47), controlPoint2: CGPoint(x: center.x 44.6, y: center.y 11.12))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.96, y: center.y 9.71), controlPoint1: CGPoint(x: center.x 43.52, y: center.y 10.64), controlPoint2: CGPoint(x: center.x 43.18, y: center.y 10.24))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.57, y: center.y 8.25), controlPoint1: CGPoint(x: center.x 42.76, y: center.y 9.24), controlPoint2: CGPoint(x: center.x 42.66, y: center.y 8.75))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.57, y: center.y 7.87), controlPoint1: CGPoint(x: center.x 42.55, y: center.y 8.13), controlPoint2: CGPoint(x: center.x 42.57, y: center.y 8))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.58, y: center.y 7.58), controlPoint1: CGPoint(x: center.x 42.58, y: center.y 7.77), controlPoint2: CGPoint(x: center.x 42.59, y: center.y 7.67))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.34, y: center.y 7.14), controlPoint1: CGPoint(x: center.x 42.58, y: center.y 7.39), controlPoint2: CGPoint(x: center.x 42.52, y: center.y 7.24))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.8, y: center.y 6.46), controlPoint1: CGPoint(x: center.x 42.08, y: center.y 6.99), controlPoint2: CGPoint(x: center.x 41.91, y: center.y 6.75))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.77, y: center.y 5.83), controlPoint1: CGPoint(x: center.x 41.73, y: center.y 6.26), controlPoint2: CGPoint(x: center.x 41.71, y: center.y 6.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.02, y: center.y 4.97), controlPoint1: CGPoint(x: center.x 41.86, y: center.y 5.54), controlPoint2: CGPoint(x: center.x 41.95, y: center.y 5.26))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.1, y: center.y 4.53), controlPoint1: CGPoint(x: center.x 42.06, y: center.y 4.83), controlPoint2: CGPoint(x: center.x 42.09, y: center.y 4.68))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.99, y: center.y 4.06), controlPoint1: CGPoint(x: center.x 42.12, y: center.y 4.37), controlPoint2: CGPoint(x: center.x 42.08, y: center.y 4.2))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.54, y: center.y 3.94), controlPoint1: CGPoint(x: center.x 41.89, y: center.y 3.88), controlPoint2: CGPoint(x: center.x 41.71, y: center.y 3.83))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.24, y: center.y 4.26), controlPoint1: CGPoint(x: center.x 41.43, y: center.y 4.03), controlPoint2: CGPoint(x: center.x 41.32, y: center.y 4.14))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.52, y: center.y 5.89), controlPoint1: CGPoint(x: center.x 40.91, y: center.y 4.76), controlPoint2: CGPoint(x: center.x 40.67, y: center.y 5.31))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.19, y: center.y 6.44), controlPoint1: CGPoint(x: center.x 40.46, y: center.y 6.11), controlPoint2: CGPoint(x: center.x 40.34, y: center.y 6.29))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.43, y: center.y 6.54), controlPoint1: CGPoint(x: center.x 39.95, y: center.y 6.67), controlPoint2: CGPoint(x: center.x 39.72, y: center.y 6.7))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.01, y: center.y 5.76), controlPoint1: CGPoint(x: center.x 38.95, y: center.y 6.28), controlPoint2: CGPoint(x: center.x 38.48, y: center.y 6.01))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.2, y: center.y 5.34), controlPoint1: CGPoint(x: center.x 37.74, y: center.y 5.61), controlPoint2: CGPoint(x: center.x 37.47, y: center.y 5.47))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.39, y: center.y 2.97), controlPoint1: CGPoint(x: center.x 36.35, y: center.y 4.93), controlPoint2: CGPoint(x: center.x 35.98, y: center.y 3.84))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.63, y: center.y 1.97), controlPoint1: CGPoint(x: center.x 36.53, y: center.y 2.66), controlPoint2: CGPoint(x: center.x 36.61, y: center.y 2.32))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.61, y: center.y 1.72), controlPoint1: CGPoint(x: center.x 36.64, y: center.y 1.89), controlPoint2: CGPoint(x: center.x 36.63, y: center.y 1.8))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.2, y: center.y 1.45), controlPoint1: CGPoint(x: center.x 36.56, y: center.y 1.5), controlPoint2: CGPoint(x: center.x 36.42, y: center.y 1.41))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.6, y: center.y 1.83), controlPoint1: CGPoint(x: center.x 35.96, y: center.y 1.5), controlPoint2: CGPoint(x: center.x 35.76, y: center.y 1.64))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.03, y: center.y 2.92), controlPoint1: CGPoint(x: center.x 35.33, y: center.y 2.15), controlPoint2: CGPoint(x: center.x 35.16, y: center.y 2.53))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.73, y: center.y 3.98), controlPoint1: CGPoint(x: center.x 34.92, y: center.y 3.27), controlPoint2: CGPoint(x: center.x 34.82, y: center.y 3.62))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.27, y: center.y 4.75), controlPoint1: CGPoint(x: center.x 34.65, y: center.y 4.29), controlPoint2: CGPoint(x: center.x 34.52, y: center.y 4.55))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.76, y: center.y 4.93), controlPoint1: CGPoint(x: center.x 34.12, y: center.y 4.86), controlPoint2: CGPoint(x: center.x 33.95, y: center.y 4.93))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.35, y: center.y 4.87), controlPoint1: CGPoint(x: center.x 32.96, y: center.y 4.95), controlPoint2: CGPoint(x: center.x 32.15, y: center.y 4.97))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 30.13, y: center.y 4.68), controlPoint1: CGPoint(x: center.x 30.94, y: center.y 4.83), controlPoint2: CGPoint(x: center.x 30.53, y: center.y 4.75))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 30.06, y: center.y 4.66), controlPoint1: CGPoint(x: center.x 30.1, y: center.y 4.68), controlPoint2: CGPoint(x: center.x 30.08, y: center.y 4.67))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.68, y: center.y 3.63), controlPoint1: CGPoint(x: center.x 29.54, y: center.y 4.4), controlPoint2: CGPoint(x: center.x 29.05, y: center.y 4.1))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.34, y: center.y 2.57), controlPoint1: CGPoint(x: center.x 28.44, y: center.y 3.32), controlPoint2: CGPoint(x: center.x 28.31, y: center.y 2.96))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.44, y: center.y 2.16), controlPoint1: CGPoint(x: center.x 28.35, y: center.y 2.43), controlPoint2: CGPoint(x: center.x 28.4, y: center.y 2.29))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.62, y: center.y 1.6), controlPoint1: CGPoint(x: center.x 28.5, y: center.y 1.97), controlPoint2: CGPoint(x: center.x 28.57, y: center.y 1.79))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.59, y: center.y 1.26), controlPoint1: CGPoint(x: center.x 28.67, y: center.y 1.46), controlPoint2: CGPoint(x: center.x 28.66, y: center.y 1.45))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.13, y: center.y 1.35), controlPoint1: CGPoint(x: center.x 28.43, y: center.y 1.29), controlPoint2: CGPoint(x: center.x 28.28, y: center.y 1.32))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 27.65, y: center.y 1.46), controlPoint1: CGPoint(x: center.x 27.97, y: center.y 1.38), controlPoint2: CGPoint(x: center.x 27.81, y: center.y 1.43))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 27.07, y: center.y 1.32), controlPoint1: CGPoint(x: center.x 27.44, y: center.y 1.5), controlPoint2: CGPoint(x: center.x 27.24, y: center.y 1.46))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.71, y: center.y 1), controlPoint1: CGPoint(x: center.x 26.94, y: center.y 1.22), controlPoint2: CGPoint(x: center.x 26.83, y: center.y 1.11))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.42, y: center.y 0.68), controlPoint1: CGPoint(x: center.x 26.61, y: center.y 0.9), controlPoint2: CGPoint(x: center.x 26.52, y: center.y 0.78))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.1, y: center.y 0.41), controlPoint1: CGPoint(x: center.x 26.32, y: center.y 0.58), controlPoint2: CGPoint(x: center.x 26.21, y: center.y 0.48))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.77, y: center.y 0.58), controlPoint1: CGPoint(x: center.x 25.93, y: center.y 0.3), controlPoint2: CGPoint(x: center.x 25.78, y: center.y 0.38))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.88, y: center.y 0.98), controlPoint1: CGPoint(x: center.x 25.76, y: center.y 0.72), controlPoint2: CGPoint(x: center.x 25.81, y: center.y 0.86))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.39, y: center.y 1.75), controlPoint1: CGPoint(x: center.x 26.05, y: center.y 1.24), controlPoint2: CGPoint(x: center.x 26.21, y: center.y 1.5))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.92, y: center.y 2.51), controlPoint1: CGPoint(x: center.x 26.56, y: center.y 2.01), controlPoint2: CGPoint(x: center.x 26.75, y: center.y 2.26))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 27.31, y: center.y 3.38), controlPoint1: CGPoint(x: center.x 27.1, y: center.y 2.78), controlPoint2: CGPoint(x: center.x 27.23, y: center.y 3.07))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 27.18, y: center.y 3.91), controlPoint1: CGPoint(x: center.x 27.36, y: center.y 3.59), controlPoint2: CGPoint(x: center.x 27.37, y: center.y 3.78))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.56, y: center.y 3.92), controlPoint1: CGPoint(x: center.x 26.98, y: center.y 4.05), controlPoint2: CGPoint(x: center.x 26.76, y: center.y 4.04))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.77, y: center.y 3.27), controlPoint1: CGPoint(x: center.x 26.27, y: center.y 3.74), controlPoint2: CGPoint(x: center.x 26, y: center.y 3.53))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.07, y: center.y 2.43), controlPoint1: CGPoint(x: center.x 25.53, y: center.y 3), controlPoint2: CGPoint(x: center.x 25.3, y: center.y 2.71))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 24.28, y: center.y 1.51), controlPoint1: CGPoint(x: center.x 24.81, y: center.y 2.12), controlPoint2: CGPoint(x: center.x 24.55, y: center.y 1.81))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.67, y: center.y 1.04), controlPoint1: CGPoint(x: center.x 24.11, y: center.y 1.31), controlPoint2: CGPoint(x: center.x 23.92, y: center.y 1.13))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.62, y: center.y 1.01), controlPoint1: CGPoint(x: center.x 23.65, y: center.y 1.03), controlPoint2: CGPoint(x: center.x 23.63, y: center.y 1.02))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.24, y: center.y 1.32), controlPoint1: CGPoint(x: center.x 23.32, y: center.y 0.91), controlPoint2: CGPoint(x: center.x 23.22, y: center.y 1))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.44, y: center.y 1.86), controlPoint1: CGPoint(x: center.x 23.25, y: center.y 1.52), controlPoint2: CGPoint(x: center.x 23.33, y: center.y 1.7))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.81, y: center.y 2.41), controlPoint1: CGPoint(x: center.x 23.56, y: center.y 2.05), controlPoint2: CGPoint(x: center.x 23.67, y: center.y 2.23))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.02, y: center.y 3.9), controlPoint1: CGPoint(x: center.x 24.21, y: center.y 2.91), controlPoint2: CGPoint(x: center.x 24.6, y: center.y 3.41))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 26.94, y: center.y 5.37), controlPoint1: CGPoint(x: center.x 25.55, y: center.y 4.53), controlPoint2: CGPoint(x: center.x 26.22, y: center.y 4.99))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.57, y: center.y 5.88), controlPoint1: CGPoint(x: center.x 27.45, y: center.y 5.63), controlPoint2: CGPoint(x: center.x 28.01, y: center.y 5.77))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 29.18, y: center.y 6.03), controlPoint1: CGPoint(x: center.x 28.78, y: center.y 5.92), controlPoint2: CGPoint(x: center.x 28.99, y: center.y 5.93))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 29.87, y: center.y 7.34), controlPoint1: CGPoint(x: center.x 29.65, y: center.y 6.26), controlPoint2: CGPoint(x: center.x 29.96, y: center.y 6.83))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 29.61, y: center.y 7.82), controlPoint1: CGPoint(x: center.x 29.83, y: center.y 7.53), controlPoint2: CGPoint(x: center.x 29.76, y: center.y 7.69))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 29.44, y: center.y 8.09), controlPoint1: CGPoint(x: center.x 29.53, y: center.y 7.89), controlPoint2: CGPoint(x: center.x 29.47, y: center.y 7.98))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 29.49, y: center.y 8.37), controlPoint1: CGPoint(x: center.x 29.42, y: center.y 8.19), controlPoint2: CGPoint(x: center.x 29.43, y: center.y 8.29))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 30.16, y: center.y 8.92), controlPoint1: CGPoint(x: center.x 29.65, y: center.y 8.63), controlPoint2: CGPoint(x: center.x 29.87, y: center.y 8.82))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 30.33, y: center.y 8.97), controlPoint1: CGPoint(x: center.x 30.21, y: center.y 8.94), controlPoint2: CGPoint(x: center.x 30.27, y: center.y 8.96))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.41, y: center.y 9.44), controlPoint1: CGPoint(x: center.x 30.72, y: center.y 9.05), controlPoint2: CGPoint(x: center.x 31.06, y: center.y 9.25))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.44, y: center.y 10.42), controlPoint1: CGPoint(x: center.x 32.07, y: center.y 9.8), controlPoint2: CGPoint(x: center.x 32.75, y: center.y 10.14))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.17, y: center.y 11.14), controlPoint1: CGPoint(x: center.x 34.32, y: center.y 10.78), controlPoint2: CGPoint(x: center.x 35.22, y: center.y 11.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.47, y: center.y 11.14), controlPoint1: CGPoint(x: center.x 36.27, y: center.y 11.15), controlPoint2: CGPoint(x: center.x 36.37, y: center.y 11.14))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.13, y: center.y 11.17), controlPoint1: CGPoint(x: center.x 36.69, y: center.y 11.15), controlPoint2: CGPoint(x: center.x 36.91, y: center.y 11.15))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.71, y: center.y 11.4), controlPoint1: CGPoint(x: center.x 37.34, y: center.y 11.18), controlPoint2: CGPoint(x: center.x 37.54, y: center.y 11.27))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.61, y: center.y 11.95), controlPoint1: CGPoint(x: center.x 37.99, y: center.y 11.63), controlPoint2: CGPoint(x: center.x 38.3, y: center.y 11.79))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.88, y: center.y 12.11), controlPoint1: CGPoint(x: center.x 38.7, y: center.y 12), controlPoint2: CGPoint(x: center.x 38.79, y: center.y 12.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.17, y: center.y 13.06), controlPoint1: CGPoint(x: center.x 39.23, y: center.y 12.33), controlPoint2: CGPoint(x: center.x 39.34, y: center.y 12.67))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.86, y: center.y 13.62), controlPoint1: CGPoint(x: center.x 39.09, y: center.y 13.25), controlPoint2: CGPoint(x: center.x 38.99, y: center.y 13.45))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.26, y: center.y 15.1), controlPoint1: CGPoint(x: center.x 38.52, y: center.y 14.06), controlPoint2: CGPoint(x: center.x 38.34, y: center.y 14.56))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.09, y: center.y 16.64), controlPoint1: CGPoint(x: center.x 38.19, y: center.y 15.61), controlPoint2: CGPoint(x: center.x 38.15, y: center.y 16.12))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.87, y: center.y 18.53), controlPoint1: CGPoint(x: center.x 38.02, y: center.y 17.27), controlPoint2: CGPoint(x: center.x 37.97, y: center.y 17.91))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.22, y: center.y 21.1), controlPoint1: CGPoint(x: center.x 37.73, y: center.y 19.41), controlPoint2: CGPoint(x: center.x 37.5, y: center.y 20.26))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.98, y: center.y 21.81), controlPoint1: CGPoint(x: center.x 37.14, y: center.y 21.34), controlPoint2: CGPoint(x: center.x 37.07, y: center.y 21.58))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.66, y: center.y 23.49), controlPoint1: CGPoint(x: center.x 36.71, y: center.y 22.51), controlPoint2: CGPoint(x: center.x 36.25, y: center.y 23.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.74, y: center.y 24.39), controlPoint1: CGPoint(x: center.x 35.08, y: center.y 23.93), controlPoint2: CGPoint(x: center.x 34.44, y: center.y 24.22))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 29.79, y: center.y 24.74), controlPoint1: CGPoint(x: center.x 32.44, y: center.y 24.72), controlPoint2: CGPoint(x: center.x 31.12, y: center.y 24.81))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 27.54, y: center.y 24.26), controlPoint1: CGPoint(x: center.x 29.01, y: center.y 24.7), controlPoint2: CGPoint(x: center.x 28.27, y: center.y 24.52))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.12, y: center.y 23.23), controlPoint1: CGPoint(x: center.x 26.71, y: center.y 23.97), controlPoint2: CGPoint(x: center.x 25.92, y: center.y 23.59))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.48, y: center.y 22.53), controlPoint1: CGPoint(x: center.x 24.58, y: center.y 22.98), controlPoint2: CGPoint(x: center.x 24.04, y: center.y 22.74))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 22.52, y: center.y 22.28), controlPoint1: CGPoint(x: center.x 23.17, y: center.y 22.41), controlPoint2: CGPoint(x: center.x 22.84, y: center.y 22.34))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 20.72, y: center.y 21.99), controlPoint1: CGPoint(x: center.x 21.92, y: center.y 22.17), controlPoint2: CGPoint(x: center.x 21.32, y: center.y 22.08))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 19.49, y: center.y 21.94), controlPoint1: CGPoint(x: center.x 20.31, y: center.y 21.93), controlPoint2: CGPoint(x: center.x 19.9, y: center.y 21.91))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 19.26, y: center.y 21.99), controlPoint1: CGPoint(x: center.x 19.41, y: center.y 21.95), controlPoint2: CGPoint(x: center.x 19.33, y: center.y 21.96))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 17.96, y: center.y 22.45), controlPoint1: CGPoint(x: center.x 18.84, y: center.y 22.19), controlPoint2: CGPoint(x: center.x 18.4, y: center.y 22.34))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 16.61, y: center.y 23.01), controlPoint1: CGPoint(x: center.x 17.48, y: center.y 22.57), controlPoint2: CGPoint(x: center.x 17.03, y: center.y 22.74))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.65, y: center.y 23.7), controlPoint1: CGPoint(x: center.x 16.01, y: center.y 23.39), controlPoint2: CGPoint(x: center.x 15.34, y: center.y 23.56))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 13.55, y: center.y 23.68), controlPoint1: CGPoint(x: center.x 14.28, y: center.y 23.77), controlPoint2: CGPoint(x: center.x 13.91, y: center.y 23.76))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 13.3, y: center.y 23.67), controlPoint1: CGPoint(x: center.x 13.47, y: center.y 23.66), controlPoint2: CGPoint(x: center.x 13.38, y: center.y 23.66))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 13.13, y: center.y 23.93), controlPoint1: CGPoint(x: center.x 13.16, y: center.y 23.7), controlPoint2: CGPoint(x: center.x 13.12, y: center.y 23.79))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 13.78, y: center.y 24.82), controlPoint1: CGPoint(x: center.x 13.18, y: center.y 24.35), controlPoint2: CGPoint(x: center.x 13.41, y: center.y 24.64))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.14, y: center.y 25), controlPoint1: CGPoint(x: center.x 13.9, y: center.y 24.88), controlPoint2: CGPoint(x: center.x 14.02, y: center.y 24.94))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.32, y: center.y 25.15), controlPoint1: CGPoint(x: center.x 14.2, y: center.y 25.04), controlPoint2: CGPoint(x: center.x 14.27, y: center.y 25.09))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.38, y: center.y 25.54), controlPoint1: CGPoint(x: center.x 14.43, y: center.y 25.26), controlPoint2: CGPoint(x: center.x 14.46, y: center.y 25.4))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.08, y: center.y 26.06), controlPoint1: CGPoint(x: center.x 14.28, y: center.y 25.71), controlPoint2: CGPoint(x: center.x 14.2, y: center.y 25.9))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 13.15, y: center.y 27.51), controlPoint1: CGPoint(x: center.x 13.72, y: center.y 26.51), controlPoint2: CGPoint(x: center.x 13.45, y: center.y 27.02))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 12.91, y: center.y 27.87), controlPoint1: CGPoint(x: center.x 13.07, y: center.y 27.63), controlPoint2: CGPoint(x: center.x 12.99, y: center.y 27.76))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 12.34, y: center.y 28.25), controlPoint1: CGPoint(x: center.x 12.76, y: center.y 28.07), controlPoint2: CGPoint(x: center.x 12.58, y: center.y 28.19))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 11.46, y: center.y 28.38), controlPoint1: CGPoint(x: center.x 12.05, y: center.y 28.33), controlPoint2: CGPoint(x: center.x 11.76, y: center.y 28.39))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 10.76, y: center.y 28.22), controlPoint1: CGPoint(x: center.x 11.22, y: center.y 28.37), controlPoint2: CGPoint(x: center.x 10.99, y: center.y 28.31))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 9.59, y: center.y 27.94), controlPoint1: CGPoint(x: center.x 10.38, y: center.y 28.08), controlPoint2: CGPoint(x: center.x 10, y: center.y 27.96))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 9.03, y: center.y 28.16), controlPoint1: CGPoint(x: center.x 9.37, y: center.y 27.93), controlPoint2: CGPoint(x: center.x 9.19, y: center.y 27.99))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 8.16, y: center.y 29.27), controlPoint1: CGPoint(x: center.x 8.71, y: center.y 28.51), controlPoint2: CGPoint(x: center.x 8.43, y: center.y 28.89))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 7.18, y: center.y 30.6), controlPoint1: CGPoint(x: center.x 7.84, y: center.y 29.72), controlPoint2: CGPoint(x: center.x 7.53, y: center.y 30.17))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 6.5, y: center.y 31.28), controlPoint1: CGPoint(x: center.x 6.98, y: center.y 30.85), controlPoint2: CGPoint(x: center.x 6.74, y: center.y 31.07))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 5.7, y: center.y 31.92), controlPoint1: CGPoint(x: center.x 6.24, y: center.y 31.51), controlPoint2: CGPoint(x: center.x 5.97, y: center.y 31.71))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 4.9, y: center.y 32.36), controlPoint1: CGPoint(x: center.x 5.46, y: center.y 32.12), controlPoint2: CGPoint(x: center.x 5.18, y: center.y 32.24))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 4.09, y: center.y 32.68), controlPoint1: CGPoint(x: center.x 4.63, y: center.y 32.46), controlPoint2: CGPoint(x: center.x 4.35, y: center.y 32.56))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 3.59, y: center.y 32.95), controlPoint1: CGPoint(x: center.x 3.91, y: center.y 32.75), controlPoint2: CGPoint(x: center.x 3.74, y: center.y 32.84))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 2.15, y: center.y 33.44), controlPoint1: CGPoint(x: center.x 3.16, y: center.y 33.27), controlPoint2: CGPoint(x: center.x 2.68, y: center.y 33.42))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 1.81, y: center.y 33.44), controlPoint1: CGPoint(x: center.x 2.04, y: center.y 33.44), controlPoint2: CGPoint(x: center.x 1.92, y: center.y 33.46))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 0.77, y: center.y 33.76), controlPoint1: CGPoint(x: center.x 1.41, y: center.y 33.4), controlPoint2: CGPoint(x: center.x 1.08, y: center.y 33.54))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 0.1, y: center.y 34.5), controlPoint1: CGPoint(x: center.x 0.49, y: center.y 33.96), controlPoint2: CGPoint(x: center.x 0.27, y: center.y 34.21))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 0.04, y: center.y 35.16), controlPoint1: CGPoint(x: center.x -0.02, y: center.y 34.71), controlPoint2: CGPoint(x: center.x -0.03, y: center.y 34.94))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 0.35, y: center.y 35.43), controlPoint1: CGPoint(x: center.x 0.08, y: center.y 35.32), controlPoint2: CGPoint(x: center.x 0.19, y: center.y 35.4))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 2.49, y: center.y 35.18), controlPoint1: CGPoint(x: center.x 1.09, y: center.y 35.56), controlPoint2: CGPoint(x: center.x 1.8, y: center.y 35.48))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 3.13, y: center.y 35.06), controlPoint1: CGPoint(x: center.x 2.69, y: center.y 35.09), controlPoint2: CGPoint(x: center.x 2.91, y: center.y 35.07))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 3.69, y: center.y 35.03), controlPoint1: CGPoint(x: center.x 3.31, y: center.y 35.05), controlPoint2: CGPoint(x: center.x 3.5, y: center.y 35.04))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 4.36, y: center.y 34.82), controlPoint1: CGPoint(x: center.x 3.93, y: center.y 35.01), controlPoint2: CGPoint(x: center.x 4.15, y: center.y 34.95))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 6.2, y: center.y 33.63), controlPoint1: CGPoint(x: center.x 4.97, y: center.y 34.42), controlPoint2: CGPoint(x: center.x 5.59, y: center.y 34.02))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 7.61, y: center.y 32.83), controlPoint1: CGPoint(x: center.x 6.65, y: center.y 33.33), controlPoint2: CGPoint(x: center.x 7.12, y: center.y 33.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 8.15, y: center.y 32.66), controlPoint1: CGPoint(x: center.x 7.78, y: center.y 32.75), controlPoint2: CGPoint(x: center.x 7.97, y: center.y 32.71))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 8.88, y: center.y 32.36), controlPoint1: CGPoint(x: center.x 8.41, y: center.y 32.6), controlPoint2: CGPoint(x: center.x 8.66, y: center.y 32.52))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 9.68, y: center.y 32.01), controlPoint1: CGPoint(x: center.x 9.12, y: center.y 32.19), controlPoint2: CGPoint(x: center.x 9.39, y: center.y 32.08))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 10.41, y: center.y 32.05), controlPoint1: CGPoint(x: center.x 9.93, y: center.y 31.95), controlPoint2: CGPoint(x: center.x 10.17, y: center.y 31.96))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 11.79, y: center.y 32.58), controlPoint1: CGPoint(x: center.x 10.87, y: center.y 32.23), controlPoint2: CGPoint(x: center.x 11.33, y: center.y 32.4))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 13.68, y: center.y 33.03), controlPoint1: CGPoint(x: center.x 12.4, y: center.y 32.8), controlPoint2: CGPoint(x: center.x 13.02, y: center.y 32.99))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.11, y: center.y 33.1), controlPoint1: CGPoint(x: center.x 13.82, y: center.y 33.04), controlPoint2: CGPoint(x: center.x 13.97, y: center.y 33.08))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 14.98, y: center.y 33.03), controlPoint1: CGPoint(x: center.x 14.4, y: center.y 33.12), controlPoint2: CGPoint(x: center.x 14.69, y: center.y 33.09))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 16.44, y: center.y 32.71), controlPoint1: CGPoint(x: center.x 15.47, y: center.y 32.93), controlPoint2: CGPoint(x: center.x 15.95, y: center.y 32.82))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 17.24, y: center.y 32.43), controlPoint1: CGPoint(x: center.x 16.72, y: center.y 32.65), controlPoint2: CGPoint(x: center.x 16.98, y: center.y 32.55))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 17.74, y: center.y 32.25), controlPoint1: CGPoint(x: center.x 17.4, y: center.y 32.35), controlPoint2: CGPoint(x: center.x 17.57, y: center.y 32.3))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 18.88, y: center.y 31.88), controlPoint1: CGPoint(x: center.x 18.12, y: center.y 32.12), controlPoint2: CGPoint(x: center.x 18.5, y: center.y 31.99))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 19.53, y: center.y 31.72), controlPoint1: CGPoint(x: center.x 19.09, y: center.y 31.81), controlPoint2: CGPoint(x: center.x 19.31, y: center.y 31.77))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 21.83, y: center.y 31.52), controlPoint1: CGPoint(x: center.x 20.29, y: center.y 31.58), controlPoint2: CGPoint(x: center.x 21.06, y: center.y 31.54))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 22.6, y: center.y 31.65), controlPoint1: CGPoint(x: center.x 22.09, y: center.y 31.52), controlPoint2: CGPoint(x: center.x 22.35, y: center.y 31.58))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 23.58, y: center.y 31.94), controlPoint1: CGPoint(x: center.x 22.93, y: center.y 31.73), controlPoint2: CGPoint(x: center.x 23.25, y: center.y 31.84))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 24.28, y: center.y 32.13), controlPoint1: CGPoint(x: center.x 23.81, y: center.y 32.01), controlPoint2: CGPoint(x: center.x 24.05, y: center.y 32.06))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 25.13, y: center.y 32.42), controlPoint1: CGPoint(x: center.x 24.57, y: center.y 32.22), controlPoint2: CGPoint(x: center.x 24.85, y: center.y 32.31))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 27.32, y: center.y 33.27), controlPoint1: CGPoint(x: center.x 25.86, y: center.y 32.69), controlPoint2: CGPoint(x: center.x 26.59, y: center.y 32.97))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 28.88, y: center.y 33.78), controlPoint1: CGPoint(x: center.x 27.83, y: center.y 33.47), controlPoint2: CGPoint(x: center.x 28.34, y: center.y 33.65))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.15, y: center.y 34.03), controlPoint1: CGPoint(x: center.x 29.62, y: center.y 33.95), controlPoint2: CGPoint(x: center.x 30.38, y: center.y 34.04))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.91, y: center.y 33.99), controlPoint1: CGPoint(x: center.x 31.4, y: center.y 34.03), controlPoint2: CGPoint(x: center.x 31.66, y: center.y 33.99))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.12, y: center.y 34.18), controlPoint1: CGPoint(x: center.x 32.32, y: center.y 33.98), controlPoint2: CGPoint(x: center.x 32.73, y: center.y 34.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.55, y: center.y 34.79), controlPoint1: CGPoint(x: center.x 33.62, y: center.y 34.34), controlPoint2: CGPoint(x: center.x 34.08, y: center.y 34.55))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.13, y: center.y 35.32), controlPoint1: CGPoint(x: center.x 35.05, y: center.y 35.04), controlPoint2: CGPoint(x: center.x 35.57, y: center.y 35.23))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.47, y: center.y 35.63), controlPoint1: CGPoint(x: center.x 36.58, y: center.y 35.4), controlPoint2: CGPoint(x: center.x 37.03, y: center.y 35.52))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.48, y: center.y 35.97), controlPoint1: CGPoint(x: center.x 38.13, y: center.y 35.8), controlPoint2: CGPoint(x: center.x 38.8, y: center.y 35.94))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.33, y: center.y 36.05), controlPoint1: CGPoint(x: center.x 39.77, y: center.y 35.99), controlPoint2: CGPoint(x: center.x 40.05, y: center.y 36.02))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.57, y: center.y 36.12), controlPoint1: CGPoint(x: center.x 40.41, y: center.y 36.06), controlPoint2: CGPoint(x: center.x 40.5, y: center.y 36.09))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.8, y: center.y 36.73), controlPoint1: CGPoint(x: center.x 40.84, y: center.y 36.25), controlPoint2: CGPoint(x: center.x 40.91, y: center.y 36.45))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.37, y: center.y 37.24), controlPoint1: CGPoint(x: center.x 40.71, y: center.y 36.95), controlPoint2: CGPoint(x: center.x 40.56, y: center.y 37.11))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.63, y: center.y 37.59), controlPoint1: CGPoint(x: center.x 40.14, y: center.y 37.4), controlPoint2: CGPoint(x: center.x 39.9, y: center.y 37.51))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.19, y: center.y 38), controlPoint1: CGPoint(x: center.x 38.83, y: center.y 37.81), controlPoint2: CGPoint(x: center.x 38.02, y: center.y 37.92))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.22, y: center.y 38.08), controlPoint1: CGPoint(x: center.x 36.87, y: center.y 38.03), controlPoint2: CGPoint(x: center.x 36.54, y: center.y 38.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.92, y: center.y 38.16), controlPoint1: CGPoint(x: center.x 36.12, y: center.y 38.09), controlPoint2: CGPoint(x: center.x 36.01, y: center.y 38.12))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.24, y: center.y 38.47), controlPoint1: CGPoint(x: center.x 35.69, y: center.y 38.25), controlPoint2: CGPoint(x: center.x 35.47, y: center.y 38.37))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.37, y: center.y 38.62), controlPoint1: CGPoint(x: center.x 34.96, y: center.y 38.58), controlPoint2: CGPoint(x: center.x 34.68, y: center.y 38.66))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.11, y: center.y 38.57), controlPoint1: CGPoint(x: center.x 34.28, y: center.y 38.61), controlPoint2: CGPoint(x: center.x 34.19, y: center.y 38.59))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.22, y: center.y 38.35), controlPoint1: CGPoint(x: center.x 33.81, y: center.y 38.5), controlPoint2: CGPoint(x: center.x 33.52, y: center.y 38.42))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 32.99, y: center.y 38.33), controlPoint1: CGPoint(x: center.x 33.15, y: center.y 38.34), controlPoint2: CGPoint(x: center.x 33.07, y: center.y 38.33))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.89, y: center.y 39.4), controlPoint1: CGPoint(x: center.x 32.25, y: center.y 38.28), controlPoint2: CGPoint(x: center.x 31.92, y: center.y 38.91))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.9, y: center.y 39.56), controlPoint1: CGPoint(x: center.x 31.88, y: center.y 39.45), controlPoint2: CGPoint(x: center.x 31.89, y: center.y 39.51))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 32.14, y: center.y 39.85), controlPoint1: CGPoint(x: center.x 31.92, y: center.y 39.71), controlPoint2: CGPoint(x: center.x 31.99, y: center.y 39.8))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.2, y: center.y 40.02), controlPoint1: CGPoint(x: center.x 32.49, y: center.y 39.95), controlPoint2: CGPoint(x: center.x 32.85, y: center.y 39.98))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.31, y: center.y 40.3), controlPoint1: CGPoint(x: center.x 33.91, y: center.y 40.11), controlPoint2: CGPoint(x: center.x 34.61, y: center.y 40.2))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.78, y: center.y 40.38), controlPoint1: CGPoint(x: center.x 35.8, y: center.y 40.36), controlPoint2: CGPoint(x: center.x 36.29, y: center.y 40.42))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.58, y: center.y 40.16), controlPoint1: CGPoint(x: center.x 37.06, y: center.y 40.36), controlPoint2: CGPoint(x: center.x 37.33, y: center.y 40.29))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.47, y: center.y 39.75), controlPoint1: CGPoint(x: center.x 37.88, y: center.y 40.02), controlPoint2: CGPoint(x: center.x 38.17, y: center.y 39.87))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.15, y: center.y 39.52), controlPoint1: CGPoint(x: center.x 38.69, y: center.y 39.66), controlPoint2: CGPoint(x: center.x 38.92, y: center.y 39.6))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.71, y: center.y 39.11), controlPoint1: CGPoint(x: center.x 39.65, y: center.y 39.33), controlPoint2: CGPoint(x: center.x 40.18, y: center.y 39.2))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.19, y: center.y 38.89), controlPoint1: CGPoint(x: center.x 40.88, y: center.y 39.08), controlPoint2: CGPoint(x: center.x 41.03, y: center.y 38.97))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.76, y: center.y 38.57), controlPoint1: CGPoint(x: center.x 41.38, y: center.y 38.79), controlPoint2: CGPoint(x: center.x 41.57, y: center.y 38.68))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.84, y: center.y 38.52), controlPoint1: CGPoint(x: center.x 41.79, y: center.y 38.55), controlPoint2: CGPoint(x: center.x 41.81, y: center.y 38.54))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 43.36, y: center.y 36.73), controlPoint1: CGPoint(x: center.x 42.49, y: center.y 38.05), controlPoint2: CGPoint(x: center.x 43.03, y: center.y 37.48))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 43.6, y: center.y 35.98), controlPoint1: CGPoint(x: center.x 43.47, y: center.y 36.49), controlPoint2: CGPoint(x: center.x 43.53, y: center.y 36.23))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 43.59, y: center.y 35.76), controlPoint1: CGPoint(x: center.x 43.61, y: center.y 35.91), controlPoint2: CGPoint(x: center.x 43.6, y: center.y 35.83))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 43.08, y: center.y 34.82), controlPoint1: CGPoint(x: center.x 43.53, y: center.y 35.39), controlPoint2: CGPoint(x: center.x 43.33, y: center.y 35.09))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.26, y: center.y 34.25), controlPoint1: CGPoint(x: center.x 42.84, y: center.y 34.58), controlPoint2: CGPoint(x: center.x 42.55, y: center.y 34.41))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.56, y: center.y 33.41), controlPoint1: CGPoint(x: center.x 41.7, y: center.y 33.96), controlPoint2: CGPoint(x: center.x 41.13, y: center.y 33.69))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.35, y: center.y 33.3), controlPoint1: CGPoint(x: center.x 40.49, y: center.y 33.38), controlPoint2: CGPoint(x: center.x 40.42, y: center.y 33.35))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.83, y: center.y 32.29), controlPoint1: CGPoint(x: center.x 39.84, y: center.y 32.97), controlPoint2: CGPoint(x: center.x 39.34, y: center.y 32.62))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.36, y: center.y 32.06), controlPoint1: CGPoint(x: center.x 38.69, y: center.y 32.2), controlPoint2: CGPoint(x: center.x 38.52, y: center.y 32.14))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.15, y: center.y 31.95), controlPoint1: CGPoint(x: center.x 38.29, y: center.y 32.02), controlPoint2: CGPoint(x: center.x 38.22, y: center.y 31.99))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.95, y: center.y 30.93), controlPoint1: CGPoint(x: center.x 37.78, y: center.y 31.74), controlPoint2: CGPoint(x: center.x 37.68, y: center.y 31.27))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.26, y: center.y 30.65), controlPoint1: CGPoint(x: center.x 38.03, y: center.y 30.82), controlPoint2: CGPoint(x: center.x 38.14, y: center.y 30.73))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.81, y: center.y 27.95), controlPoint1: CGPoint(x: center.x 39.31, y: center.y 29.95), controlPoint2: CGPoint(x: center.x 40.16, y: center.y 29.05))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.66, y: center.y 26.54), controlPoint1: CGPoint(x: center.x 41.09, y: center.y 27.48), controlPoint2: CGPoint(x: center.x 41.37, y: center.y 27.01))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 41.94, y: center.y 26.15), controlPoint1: CGPoint(x: center.x 41.74, y: center.y 26.4), controlPoint2: CGPoint(x: center.x 41.84, y: center.y 26.27))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.19, y: center.y 25.71), controlPoint1: CGPoint(x: center.x 42.06, y: center.y 26.02), controlPoint2: CGPoint(x: center.x 42.13, y: center.y 25.87))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.72, y: center.y 23.22), controlPoint1: CGPoint(x: center.x 42.48, y: center.y 24.91), controlPoint2: CGPoint(x: center.x 42.65, y: center.y 24.07))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.73, y: center.y 19.82), controlPoint1: CGPoint(x: center.x 42.82, y: center.y 22.09), controlPoint2: CGPoint(x: center.x 42.78, y: center.y 20.95))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.68, y: center.y 18.55), controlPoint1: CGPoint(x: center.x 42.71, y: center.y 19.4), controlPoint2: CGPoint(x: center.x 42.69, y: center.y 18.97))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 42.98, y: center.y 17.54), controlPoint1: CGPoint(x: center.x 42.68, y: center.y 18.19), controlPoint2: CGPoint(x: center.x 42.79, y: center.y 17.85))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 43.41, y: center.y 17.24), controlPoint1: CGPoint(x: center.x 43.07, y: center.y 17.37), controlPoint2: CGPoint(x: center.x 43.22, y: center.y 17.27))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 45.16, y: center.y 16.63), controlPoint1: CGPoint(x: center.x 44.03, y: center.y 17.13), controlPoint2: CGPoint(x: center.x 44.61, y: center.y 16.93))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 45.57, y: center.y 16.55), controlPoint1: CGPoint(x: center.x 45.28, y: center.y 16.57), controlPoint2: CGPoint(x: center.x 45.43, y: center.y 16.56))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 46.31, y: center.y 16.57), controlPoint1: CGPoint(x: center.x 45.82, y: center.y 16.55), controlPoint2: CGPoint(x: center.x 46.06, y: center.y 16.58))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 48.02, y: center.y 16.5), controlPoint1: CGPoint(x: center.x 46.88, y: center.y 16.56), controlPoint2: CGPoint(x: center.x 47.45, y: center.y 16.53))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 49.57, y: center.y 15.54), controlPoint1: CGPoint(x: center.x 48.69, y: center.y 16.45), controlPoint2: CGPoint(x: center.x 49.17, y: center.y 16.06))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 49.68, y: center.y 15.35), controlPoint1: CGPoint(x: center.x 49.61, y: center.y 15.49), controlPoint2: CGPoint(x: center.x 49.65, y: center.y 15.42))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 49.54, y: center.y 14.58), controlPoint1: CGPoint(x: center.x 49.81, y: center.y 15.06), controlPoint2: CGPoint(x: center.x 49.76, y: center.y 14.81))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 48.79, y: center.y 14.1), controlPoint1: CGPoint(x: center.x 49.32, y: center.y 14.36), controlPoint2: CGPoint(x: center.x 49.06, y: center.y 14.22))
        //            bezierPath.close()
        //            bezierPath.move(to: CGPoint(x: center.x 39.97, y: center.y 9.27))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.44, y: center.y 9.61), controlPoint1: CGPoint(x: center.x 39.81, y: center.y 9.42), controlPoint2: CGPoint(x: center.x 39.64, y: center.y 9.55))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.91, y: center.y 9.74), controlPoint1: CGPoint(x: center.x 39.26, y: center.y 9.67), controlPoint2: CGPoint(x: center.x 39.09, y: center.y 9.71))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 38.17, y: center.y 9.83), controlPoint1: CGPoint(x: center.x 38.66, y: center.y 9.78), controlPoint2: CGPoint(x: center.x 38.41, y: center.y 9.8))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.31, y: center.y 10.11), controlPoint1: CGPoint(x: center.x 37.87, y: center.y 9.87), controlPoint2: CGPoint(x: center.x 37.58, y: center.y 9.95))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 36.36, y: center.y 10.4), controlPoint1: CGPoint(x: center.x 37.01, y: center.y 10.27), controlPoint2: CGPoint(x: center.x 36.7, y: center.y 10.38))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.52, y: center.y 10.18), controlPoint1: CGPoint(x: center.x 36.05, y: center.y 10.42), controlPoint2: CGPoint(x: center.x 35.77, y: center.y 10.36))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.22, y: center.y 9.56), controlPoint1: CGPoint(x: center.x 35.3, y: center.y 10.02), controlPoint2: CGPoint(x: center.x 35.21, y: center.y 9.81))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.49, y: center.y 8.91), controlPoint1: CGPoint(x: center.x 35.23, y: center.y 9.31), controlPoint2: CGPoint(x: center.x 35.32, y: center.y 9.09))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.78, y: center.y 8.64), controlPoint1: CGPoint(x: center.x 35.58, y: center.y 8.82), controlPoint2: CGPoint(x: center.x 35.69, y: center.y 8.73))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.86, y: center.y 8.52), controlPoint1: CGPoint(x: center.x 35.81, y: center.y 8.61), controlPoint2: CGPoint(x: center.x 35.82, y: center.y 8.58))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.32, y: center.y 8.72), controlPoint1: CGPoint(x: center.x 35.65, y: center.y 8.6), controlPoint2: CGPoint(x: center.x 35.49, y: center.y 8.66))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.03, y: center.y 8.51), controlPoint1: CGPoint(x: center.x 34.85, y: center.y 8.89), controlPoint2: CGPoint(x: center.x 34.42, y: center.y 8.81))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.8, y: center.y 8.34), controlPoint1: CGPoint(x: center.x 33.96, y: center.y 8.45), controlPoint2: CGPoint(x: center.x 33.88, y: center.y 8.39))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.7, y: center.y 8.88), controlPoint1: CGPoint(x: center.x 33.77, y: center.y 8.53), controlPoint2: CGPoint(x: center.x 33.75, y: center.y 8.71))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 33.03, y: center.y 9.24), controlPoint1: CGPoint(x: center.x 33.6, y: center.y 9.2), controlPoint2: CGPoint(x: center.x 33.35, y: center.y 9.32))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.93, y: center.y 8.61), controlPoint1: CGPoint(x: center.x 32.6, y: center.y 9.14), controlPoint2: CGPoint(x: center.x 32.25, y: center.y 8.91))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 30.68, y: center.y 7.09), controlPoint1: CGPoint(x: center.x 31.45, y: center.y 8.16), controlPoint2: CGPoint(x: center.x 31.03, y: center.y 7.66))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 30.51, y: center.y 6.75), controlPoint1: CGPoint(x: center.x 30.61, y: center.y 6.98), controlPoint2: CGPoint(x: center.x 30.56, y: center.y 6.87))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.03, y: center.y 5.79), controlPoint1: CGPoint(x: center.x 30.32, y: center.y 6.29), controlPoint2: CGPoint(x: center.x 30.65, y: center.y 5.86))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 31.44, y: center.y 5.75), controlPoint1: CGPoint(x: center.x 31.16, y: center.y 5.77), controlPoint2: CGPoint(x: center.x 31.3, y: center.y 5.75))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 34.06, y: center.y 5.8), controlPoint1: CGPoint(x: center.x 32.31, y: center.y 5.77), controlPoint2: CGPoint(x: center.x 33.19, y: center.y 5.78))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 35.7, y: center.y 5.99), controlPoint1: CGPoint(x: center.x 34.61, y: center.y 5.81), controlPoint2: CGPoint(x: center.x 35.16, y: center.y 5.84))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.19, y: center.y 6.46), controlPoint1: CGPoint(x: center.x 36.2, y: center.y 6.14), controlPoint2: CGPoint(x: center.x 36.69, y: center.y 6.3))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 37.65, y: center.y 6.63), controlPoint1: CGPoint(x: center.x 37.35, y: center.y 6.51), controlPoint2: CGPoint(x: center.x 37.51, y: center.y 6.56))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.82, y: center.y 8.01), controlPoint1: CGPoint(x: center.x 38.42, y: center.y 7.02), controlPoint2: CGPoint(x: center.x 39.15, y: center.y 7.46))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 40.15, y: center.y 8.51), controlPoint1: CGPoint(x: center.x 39.98, y: center.y 8.14), controlPoint2: CGPoint(x: center.x 40.09, y: center.y 8.31))
        //            bezierPath.addCurve(to: CGPoint(x: center.x 39.97, y: center.y 9.27), controlPoint1: CGPoint(x: center.x 40.23, y: center.y 8.79), controlPoint2: CGPoint(x: center.x 40.18, y: center.y 9.05))
        //            bezierPath.close()
        //            color.setFill()
        //            bezierPath.fill()
    }
    
    
    
    
    func drawTree(center:CGPoint) {
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        if isRandomColor {
            
            if treeCounter >= 4 {
                treeCounter = 0
            } else {
                treeCounter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[treeCounter]
            
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: center)
        //            bezierPath.move(to: CGPoint(x: 23.12, y: 22.71))
        bezierPath.addLine(to: CGPoint(x: center.x + 3.83, y: center.y))
        bezierPath.addLine(to: CGPoint(x: center.x - 2.09, y: center.y - 8.36))
        bezierPath.addLine(to: CGPoint(x: center.x + 1.52, y: center.y - 8.36))
        bezierPath.addLine(to: CGPoint(x: center.x - 8.62, y: center.y - 22.71))
        bezierPath.addLine(to: CGPoint(x: center.x - 18.76, y: center.y - 8.36))
        bezierPath.addLine(to: CGPoint(x: center.x - 15.15, y: center.y - 8.36))
        bezierPath.addLine(to: CGPoint(x: center.x - 21.07, y: center.y))
        bezierPath.addLine(to: CGPoint(x: center.x - 17.24, y: center.y))
        bezierPath.addLine(to: CGPoint(x: center.x - 22.93, y: center.y + 8.06))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.74, y: center.y + 8.06))
        bezierPath.addLine(to: CGPoint(x: center.x - 12.74, y: center.y + 16.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.38, y: center.y + 16.29))
        bezierPath.addLine(to: CGPoint(x: center.x - 5.38, y: center.y + 8.06))
        bezierPath.addLine(to: CGPoint(x: center.x + 5.7, y: center.y + 8.06))
        bezierPath.addLine(to: CGPoint(x: center.x, y: center.y))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
    }
}
