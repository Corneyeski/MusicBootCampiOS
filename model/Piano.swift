//
//  Piano.swift
//  MusicBootCamp
//
//  Created by user on 8/5/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
import AVFoundation

class Piano {
    
    var audioPlayer = AVAudioPlayer()
    var notas:[String:Nota]?
    var composiciones:[String:Composicion]
    
    init(){
        self.composiciones = [String:Composicion]()
        self.setupNotas()
    }
    
    init(composiciones:[String:Composicion]){
        self.composiciones = composiciones
        //notas = [String:Nota]
        self.setupNotas()
    }
    
    private func setupNotas(){
        notas = [
            "do":Nota(nombre: "do"),
            "re":Nota(nombre: "re"),
            "mi":Nota(nombre: "mi"),
            "fa":Nota(nombre: "fa"),
            "sol":Nota(nombre: "sol"),
            "la":Nota(nombre: "la"),
            "si":Nota(nombre: "si")
        ]
    }
    
    func recieveNota(notas:String...) {
        if notas.count == 1 {
            play(nota: (self.notas![notas[0]]?.nombre)!)
        }else{
            for n in notas {
                print(n)
                if n != ""{
                    play(nota: (self.notas![n]?.nombre)!)
                }
                usleep(600000)
            }
        }
    }
    
    func recieveNota(notas:[String]) {
        if notas.count == 1 {
            play(nota: (self.notas![notas[0]]?.nombre)!)
        }else{
            for n in notas {
                print(n)
                if n != ""{
                    play(nota: (self.notas![n]?.nombre)!)
                }
                usleep(300000)
            }
        }
    }
    private func play(nota:String){
        
        let notaUrl = Bundle.main.url(forResource: nota, withExtension: "wav")
        
        if  notaUrl != nil {
            audioPlayer = try! AVAudioPlayer(contentsOf: notaUrl!)
            audioPlayer.play()
        }else {
            print("no llega nada \(nota)")
        }
    }
}
