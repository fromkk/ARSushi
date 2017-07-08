//
//  Sushi.swift
//  ARSushi
//
//  Created by Kazuya Ueoka on 2017/07/08.
//  Copyright © 2017 fromKK. All rights reserved.
//

import SceneKit

class Sushi: Shari {
    lazy var body: SCNBox = { () -> SCNBox in
        let box: SCNBox = SCNBox(width: 4.0 * self.aspect, height: 2.0 * self.aspect, length: 8.0 * self.aspect, chamferRadius: 0.5 * self.aspect)
        return box
    }()
    
    var material: UIImage? {
        didSet {
            guard let image: UIImage = self.material else { return }
            
            let material: SCNMaterial = SCNMaterial()
            material.diffuse.contents = image
            material.lightingModel = .constant
            
            self.body.materials = [material]
        }
    }
    
    convenience init(material: UIImage) {
        self.init()
        
        defer {
            self.material = material
        }
    }
    
    override init() {
        super.init()
        
        let node: SCNNode = SCNNode(geometry: self.body)
        node.position = SCNVector3Make(0.0, 1.8 * Float(self.aspect)
            , 0.0)
        self.addChildNode(node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
