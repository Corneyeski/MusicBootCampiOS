//
//  CreditosCompositorViewController.swift
//  MusicBootCamp
//
//  Created by user on 8/5/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class CreditosCompositorViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lbllastName: UILabel!
    @IBOutlet weak var lblObras: UILabel!
    
    var compositor:Compositor? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*var compositor = Compositor()*/
        
        lblName.text = compositor?.nombre
        lbllastName.text = compositor?.apellido
        
        var obras = ""
        
        for s in (compositor?.obras)! {
            obras.append(" \(s)")
        }
        
        lblObras.text = obras
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
