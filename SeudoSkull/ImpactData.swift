//
//  ImpactData.swift
//  SeudoSkull
//
//  Created by Vo Tuan Thanh on 8/7/19.
//  Copyright © 2019 Vo Tuan Thanh. All rights reserved.
//

import Foundation

class ImpactData {
    var impact: Int
    var time: String
    var name: String
    
    init?(impact: Int, time: String, name: String) {
//        if impact != 0 || time.isEmpty || name.isEmpty {
//            return nil
//        }

        self.impact = impact
        self.time = time
        self.name = name
    }
}
