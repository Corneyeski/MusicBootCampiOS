
import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    var piano:Piano = Piano()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        piano.recieveNota(nota: "do")
        piano.recieveNota(notas: ["do","re","mi","fa","sol","la","si"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playSound(_ sender: Any) {
        /*switch (sender as! UIButton).tag {
        case 0:
            playSound("_note1")
        case 1:
            playSound("note2")
        case 2:
            print("hello")
        case 3:
            print("hello")
        case 4:
            print("hello")
        case 5:
            print("hello")
        default:
            print("hello")
        }*/
        tocarNota(nota: String((sender as! UIButton).tag+1))
    }
    
    @IBAction func randomMusic(_ sender: Any) {
        
        let randomTimes = arc4random_uniform(15) + 1
        var nota = arc4random_uniform(8)
        
        for _ in 1..<randomTimes {
            print(randomTimes)
            print(nota)
            tocarNota(nota: String(nota))
            usleep(90000)
            nota = arc4random_uniform(7) + 1
        }
        
        
    }
    
    func tocarNota(nota:String) {
        
        let nombre = "note\(nota)"
        
        let notaUrl = Bundle.main.url(forResource: nombre, withExtension: "wav")
        
        if  notaUrl != nil {
           audioPlayer = try! AVAudioPlayer(contentsOf: notaUrl!)
            audioPlayer.play()
        }else {
            print("no llega nada \(nombre)")
        }
    }
    
    @objc func musicarNota(){
        
    }
}

