//
//  MasaInterfaceController.swift
//  pizzea
//
//  Created by wififer on 22/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit
import Foundation


class MasaInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let p = context as! Pizza
        print("pizza: ",p.tamano)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}