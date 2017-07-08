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
        
        // A1 sceneView setting
        
        
        // A5 add tapGesture to sceneView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // A2 configuration ARWorldTrackingSessionConfiguration
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // A3 pause ARSession
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// A4 handle tap gesture

