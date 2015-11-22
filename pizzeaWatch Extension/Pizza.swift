//
//  Pizza.swift
//  pizzea
//
//  Created by wififer on 22/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
    
   var tamano:String = ""
   var masa:String = ""
   var queso:String = ""
   var ingredientes:[String] = []
    
    init(t:String,m:String,q:String,i:[String]) {
        tamano = t
        masa = m
        queso = q
        ingredientes = i
    }
}
