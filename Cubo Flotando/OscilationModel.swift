//
//  OscilationModel.swift
//  Cubo Flotando
//
//  Created by Daniel Carlander on 18/09/2018.
//  Copyright © 2018 Daniel Carlander. All rights reserved.
//

import Foundation

class OscilationModel{
    
    var lado = 10.0 {
        didSet {
            updateCtes()
        }
    }
    
    init() {
        updateCtes()
    }
    
    // Posicion inicial de la masa
    private let x0 = 0.0
    
    // Velocidad inicial de la masa
    private let v0 = 0.0
    
    // Constantes intermedias
    private var waterDensity = 1.0
    private var cubeDensity = 1.0/2
    private var mass = 500.0
    private var sunkenMass = 500.0
    private var g = 9.8
    private var z = 5.0
    private var ω = 1.4
    
    // Actualizar las ctest intermedias.
    private func updateCtes() {
        mass = cubeDensity*(lado*lado*lado)
        sunkenMass = waterDensity*lado*lado*(lado/2 - z)
        ω = sqrt(2*g/lado)
    }
    
    func posAtTime(_ t:Double) -> Double {
        return lado * cos(ω*t)/2
    }
    
    func speedAtTime(_ t:Double) -> Double {
        return -sin(ω*t) * ω * lado/2
    }
    
    func accelerationAtTime(_ t:Double) -> Double {
        return -g * cos(ω*t)
    }
    
    
}
