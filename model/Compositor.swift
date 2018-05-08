//
//  Compositor.swift
//  MusicBootCamp
//
//  Created by user on 8/5/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

class Persona {
    var nombre:String
    var apellido:String
    var bio:String
    var anyoNacimiento:Int
    var anyoFallecimiento:Int?
    
    init(){
        self.nombre = "Alan"
        self.apellido = "Vallve"
        self.bio = "shalalalala"
        self.anyoNacimiento = 19996
        self.anyoFallecimiento = nil
    }
}

class Compositor:Persona {
    
    var obras:[String]
    
    override init() {
        self.obras = ["makina"]
        super.init()
    }
    
    
}
