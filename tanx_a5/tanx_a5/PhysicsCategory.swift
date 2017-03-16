//
//  PhysicsCategory.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-15.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation

class PhysicsCategory {

    static let PlayerCategory: UInt32 = 0x1 << 1;
    static let EnemyCategory: UInt32 = 0x1 << 2;
    static let BulletCategory: UInt32 = 0x1 << 3;
    static let SceneCategory: UInt32 = 0x1 << 4;

}
