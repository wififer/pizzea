//
//  ViewController.swift
//  pizzea
//
//  Created by Fernando Ransanz on 14/11/15.
//  Copyright (c) 2015 Fernando Ransanz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tituloLbl: UILabel!
    
    @IBOutlet weak var tamanoLbl: UILabel!
    
    @IBOutlet weak var tamanoPicker: UIPickerView!
    
    var tamanos = ["Grande","Mediana", "Chica"]
    var miTamano:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tituloLbl.adjustsFontSizeToFitWidth = true
        tituloLbl.sizeToFit()
        tamanoLbl.adjustsFontSizeToFitWidth = true
        tamanoLbl.sizeToFit()
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamanos.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        miTamano = tamanos[row]
        return tamanos[row]
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "tamanoToMasa") {
            let svc = segue.destinationViewController as masaViewController;
            
            svc.toPassTamano = self.miTamano
           
            
        }
    }
    
    @IBAction func toMasa(sender: AnyObject) {
        
        self.performSegueWithIdentifier("tamanoToMasa", sender:self)
    }
    
}

