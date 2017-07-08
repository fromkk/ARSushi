//
//  Shari.swift
//  ARSushi
//
//  Created by Kazuya Ueoka on 2017/07/08.
//  Copyright © 2017 fromKK. All rights reserved.
//

import UIKit
import SceneKit

class Shari: SCNNode {
    let aspect: CGFloat = 1.0 / 100.0
    
    lazy var shari: SCNBox = {
        let shari: SCNBox = SCNBox(width: 3.0 * self.aspect, height: 2.0 * self.aspect, length: 7.0 * self.aspect, chamferRadius: 0.8 * self.aspect)
        shari.materials = [self.rice]
        return shari
    }()
    
    lazy var rice: SCNMaterial = { () -> SCNMaterial in
        let rice: SCNMaterial = SCNMaterial()
        rice.diffuse.contents = #imageLiteral(resourceName: "rice")
        rice.lightingModel = .constant
        return rice
    }()
    
    override init() {
        super.init()
        
        let node: SCNNode = SCNNode(geometry: self.shari)
        
        self.addChildNode(node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
