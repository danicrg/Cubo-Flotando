//
//  ViewController.swift
//  Cubo Flotando
//
//  Created by Daniel Carlander on 18/09/2018.
//  Copyright © 2018 Daniel Carlander. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FunctionViewDataSource {
    
    @IBOutlet weak var ladoSlider: UISlider!
    @IBOutlet weak var tiempoSlider: UISlider!
    
    @IBOutlet weak var zFunctionView: FunctionView!
    @IBOutlet weak var speedFunctionVIew: FunctionView!
    @IBOutlet weak var accelerationFunctionView: FunctionView!
    
    @IBOutlet weak var speedPosFunctionView: FunctionView!
    
    var oscilationModel: OscilationModel!
    
    var oscilationTime: Double = 0.0 {
        didSet {
            zFunctionView.setNeedsDisplay()
            speedFunctionVIew.setNeedsDisplay()
            accelerationFunctionView.setNeedsDisplay()
            speedPosFunctionView.setNeedsDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oscilationModel = OscilationModel()
        
        zFunctionView.dataSource = self
        speedFunctionVIew.dataSource = self
        accelerationFunctionView.dataSource = self
        speedPosFunctionView.dataSource = self
        
        zFunctionView.scaleX = 30.0
        zFunctionView.scaleY = 3.0
        speedFunctionVIew.scaleX = 30.0
        speedFunctionVIew.scaleY = 3.0
        accelerationFunctionView.scaleX = 30.0
        accelerationFunctionView.scaleY = 3.0
        speedPosFunctionView.scaleX = 10.0
        speedPosFunctionView.scaleY = 10.0
        
    }
    
    @IBAction func ladoChanged(_ sender: UISlider) {
        oscilationModel.lado = Double(sender.value)
        
        zFunctionView.setNeedsDisplay()
        speedFunctionVIew.setNeedsDisplay()
        accelerationFunctionView.setNeedsDisplay()
        speedPosFunctionView.setNeedsDisplay()
    }
    
    
    @IBAction func tiempoChanged(_ sender: UISlider) {
        oscilationTime = Double(sender.value)
    }
    
    @IBAction func updateScales(_ sender: UIPinchGestureRecognizer) {
        
        let f = sender.scale
        
//        zFunctionView.scaleX *= Double(f)
//        zFunctionView.scaleY *= Double(f)
//
//        speedFunctionVIew.scaleX *= Double(f)
//        speedFunctionVIew.scaleY *= Double(f)
//
//        accelerationFunctionView.scaleX *= Double(f)
//        accelerationFunctionView.scaleY *= Double(f)
        
        speedPosFunctionView.scaleX *= Double(f)
        speedPosFunctionView.scaleY *= Double(f)
        
        sender.scale = 1
        
    }
    
    
    
    
    
    
    
    func startTimeOfFunctionView(_ functionView: FunctionView) -> Double {
        return 0
    }
    
    func endTimeOfFunctionView(_ functionView: FunctionView) -> Double {
        return 15
    }
    
    func pointOfFunctionView(_ functionView: FunctionView, atTime time: Double) -> Point {
        switch functionView {
            
        case zFunctionView:
            let x = time
            let y = oscilationModel.posAtTime(time)
            return Point(x:x, y:y)
            
        case speedFunctionVIew:
            let x = time
            let y = oscilationModel.speedAtTime(time)
            return Point(x:x, y:y)
         
        case accelerationFunctionView:
            let x = time
            let y = oscilationModel.accelerationAtTime(time)
            return Point(x:x, y:y)
            
        case speedPosFunctionView:
            let x = oscilationModel.posAtTime(time)
            let y = oscilationModel.speedAtTime(time)
            return Point(x:x, y:y)
        default:
            return Point(x:0, y:0)
        }
    }
    
    func pointsOfInterestFor(_ functionView: FunctionView) -> [Point] {
        switch functionView {
        case zFunctionView:
            let x = oscilationTime
            let y = oscilationModel.posAtTime(oscilationTime)
            return [Point(x:x, y:y)]

        case speedFunctionVIew:
            let x = oscilationTime
            let y = oscilationModel.speedAtTime(oscilationTime)
            return [Point(x:x, y:y)]

        case accelerationFunctionView:
            let x = oscilationTime
            let y = oscilationModel.accelerationAtTime(oscilationTime)
            return [Point(x:x, y:y)]

        case speedPosFunctionView:
            let x = oscilationModel.posAtTime(oscilationTime)
            let y = oscilationModel.speedAtTime(oscilationTime)
            return [Point(x:x, y:y)]
        default:
            return [Point(x:0, y:0)]

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

