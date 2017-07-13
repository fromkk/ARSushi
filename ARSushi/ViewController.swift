//
//  ViewController.swift
//  ARSushi
//
//  Created by Kazuya Ueoka on 2017/07/08.
//  Copyright © 2017 fromKK. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    // A10 save floors
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // A1 sceneView setting
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.scene = SCNScene()
        
        // A5 add tapGesture to sceneView
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.onTapGesture(_:))))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // A2 configuration ARWorldTrackingSessionConfiguration
        if ARWorldTrackingSessionConfiguration.isSupported {
            let configuration = ARWorldTrackingSessionConfiguration()
            configuration.planeDetection = .horizontal
            configuration.isLightEstimationEnabled = true
            self.sceneView.session.run(configuration)
        } else {
            self.sceneView.session.run(ARSessionConfiguration())
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // A3 pause ARSession
        self.sceneView.session.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// A4 handle tap gesture
extension ViewController {
    @objc private func onTapGesture(_ gesture: UITapGestureRecognizer) {
        // A6 check hit position
        let positions = self.sceneView.hitTest(gesture.location(in: gesture.view), types: ARHitTestResult.ResultType.estimatedHorizontalPlane) //A13 change to existingPlaneUsingExtent
        guard let position = positions.first else { return }
        
        // A8 add Sushis to sceneView
        let material: UIImage = { () -> UIImage in
            let images: [UIImage] = [
                #imageLiteral(resourceName: "tsuna"),
                #imageLiteral(resourceName: "salmon")
            ]
            let index: Int = Int(arc4random_uniform(UInt32(images.count)))
            return images[index]
        }()
        
        let sushi: Sushi = Sushi(material: material)
        sushi.position = SCNVector3Make(position.worldTransform.columns.3.x,
                                        position.worldTransform.columns.3.y, //A14 add + 0.03
            position.worldTransform.columns.3.z)
        self.sceneView.scene.rootNode.addChildNode(sushi)
    }
}


extension ViewController : ARSCNViewDelegate {
    
    // A11 add ARSCNViewDelegate
    
}

