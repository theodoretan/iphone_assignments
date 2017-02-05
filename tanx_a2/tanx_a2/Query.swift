//
//  Query.swift
//  tanx_a2
//
//  Created by Theodore Tan on 2017-02-05.
//  Copyright © 2017 wlu. All rights reserved.
//

import UIKit

struct Query {
    static var count = 0;
    
    init() {
        
    }
    
    static func setCount(c: Int) {
        count = c;
    }
    
    static func getCount() -> Int {
        return count;
    }
    
    
}