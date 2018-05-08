//
//  PianoController.swift
//  MusicBootCamp
//
//  Created by user on 8/5/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class PianoController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    let piano:Piano = Piano()
    var choice:String = ""
    
    var compositor:Compositor = Compositor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        piano.composiciones["ocas"] = Composicion(nombre: "ocas",notas: [
                "do","do","fa","fa","sol","sol","fa","","fa","fa","mi","mi","re","re","do"
            ])
        piano.composiciones["escala"] = Composicion(nombre: "escala",notas: [
            "do","re","mi","fa","sol","la","si"
            ])
        piano.composiciones["escalaReversa"] = Composicion(nombre: "escalaReversa",notas: [
            "si","la","sol","fa","mi","re","do"
            ])
        piano.composiciones["futurama"] = Composicion(nombre: "futurama",notas: [
            "do","","do","","fa","fa","","sol","","sol","","fa","fa"
            ])
        
        //piano.recieveCompositionName(name: "futurama")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func play(_ sender: Any) {
        switch (sender as! UIButton).tag {
        case 0:
            piano.recieveNota(nota: "do")
            self.performSegue(withIdentifier: "creditos", sender: nil)
        case 1:
            piano.recieveNota(nota: "re")
        case 2:
            piano.recieveNota(nota: "mi")
        case 3:
            piano.recieveNota(nota: "fa")
        case 4:
            piano.recieveNota(nota: "sol")
        case 5:
            piano.recieveNota(nota: "la")
        default:
            piano.recieveNota(nota: "si")
        }
    }
    
    @IBAction func playComposition(_ sender: Any) {
        if choice != "" {
            piano.recieveNota(notas: piano.composiciones[choice]!.notas)
        }
    }
    
    
    //Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return piano.composiciones.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if choice == "" {
            choice = Array(piano.composiciones)[row].key
        }
        
        return Array(piano.composiciones)[row].key
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choice = Array(piano.composiciones)[row].key
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "creditos":
            let c:CreditosCompositorViewController = segue.destination as! CreditosCompositorViewController
            
            c.compositor = self.compositor
            
        default:
            print("Error")
        }
    }
}
