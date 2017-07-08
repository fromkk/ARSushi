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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        self.sceneView.scene = SCNScene()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled = true
        
        // Run the view's session
        self.sceneView.session.run(configuration)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.onTapGesture(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    @objc private func onTapGesture(_ gesture: UITapGestureRecognizer) {
        let positions = self.sceneView.hitTest(gesture.location(in: gesture.view), types: ARHitTestResult.ResultType.estimatedHorizontalPlane)
        
        guard let position = positions.first else { return }
        
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
                                        position.worldTransform.columns.3.y,
                                        position.worldTransform.columns.3.z)
        self.sceneView.scene.rootNode.addChildNode(sushi)
    }
}

extension ViewController: ARSCNViewDelegate {
    
}
