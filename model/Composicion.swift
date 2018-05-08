//
//  Composicion.swift
//  MusicBootCamp
//
//  Created by user on 7/5/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

class Composicion {
    
    var nombre:String
    let notas:[String]
    
    init(nombre:String, notas:[String]) {
        self.nombre = nombre
        self.notas = notas
    }
}
