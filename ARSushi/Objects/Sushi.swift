//
//  Sushi.swift
//  ARSushi
//
//  Created by Kazuya Ueoka on 2017/07/08.
//  Copyright © 2017 fromKK. All rights reserved.
//

// A7 create Sushi
import SceneKit

class Sushi: SCNNode {
    let aspect: CGFloat = 1.0 / 100.0
    
    lazy var shari: SCNBox = { () -> SCNBox in
        let shari: SCNBox = SCNBox(width: 3.0 * self.aspect, height: 2.0 * self.aspect, length: 7.0 * self.aspect, chamferRadius: 0.8 * self.aspect)
        shari.materials = [self.rice]
        return shari
    }()
    
    lazy var rice: SCNMaterial = { () -> SCNMaterial in
        let rice: SCNMaterial = SCNMaterial()
        rice.diffuse.contents =  #imageLiteral(resourceName: "rice")
        rice.lightingModel = .constant
        return rice
    }()
    
    lazy var body: SCNBox = { () -> SCNBox in
        let box: SCNBox = SCNBox(width: 4.0 * self.aspect, height: 1.5 * self.aspect, length: 8.0 * self.aspect, chamferRadius: 0.5 * self.aspect)
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
        
        let shari: SCNNode = SCNNode(geometry: self.shari)
        
        // A12 add physicsBody to shari
        
        
        self.addChildNode(shari)
        
        let body: SCNNode = SCNNode(geometry: self.body)
        body.position = SCNVector3Make(0.0, 2.1 * Float(self.aspect)
            , 0.0)
        
        // A13 add physicsBody to body
        
        
        self.addChildNode(body)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

