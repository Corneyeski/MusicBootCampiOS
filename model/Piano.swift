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
    
    private var audioPlayer = AVAudioPlayer()
    var notas:[String:Nota]?
    var composiciones:[String:Composicion]
    private var index = 0
    
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
    
    func recieveNota(nota:String) {
        play(nota: (self.notas![nota]?.nombre)!)
    }
    
    func recieveNota(notas:[String]) {
            for n in notas {
                print(n)
                if n != ""{
                    play(nota: (self.notas![n]?.nombre)!)
                }
                usleep(300000)
            }
    }
    
    func recieveCompositionName(name:String){
        
        Timer.scheduledTimer(timeInterval: 0.5,
                             target: self,
                             selector: #selector(self.play(data: )),
                             userInfo: composiciones[name]?.notas,
                             repeats: true)
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
    
    @objc private func play(data:Timer){
        
        let nota = data.userInfo as! [String]
        
        let notaUrl = Bundle.main.url(forResource: nota[index], withExtension: "wav")
        
        if  notaUrl != nil {
            audioPlayer = try! AVAudioPlayer(contentsOf: notaUrl!)
            audioPlayer.play()
        }else {
            print("no llega nada \(data)")
        }
        
        if index < nota.count-1 {
            index += 1
        }else {
            index = 0
        }
    }
}
