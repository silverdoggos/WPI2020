//
//  ArViewModel.swift
//  WPI2020
//
//  Created by Artem Shishkin on 03.03.2021.
//

import ARKit
import SwiftUI

class ARViewController: UIViewController, ARSCNViewDelegate {
    
   private var arView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    // MARK: - Livecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ARSCNView(frame: .zero)
        arView.delegate = self
        arView.scene = SCNScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        arView.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        arView.session.pause()
    }
    // MARK: - ARSCNViewDelegate
    func sessionWasInterrupted(_ session: ARSession) {}
    func sessionInterruptionEnded(_ session: ARSession) {}
    func session(_ session: ARSession, didFailWithError error: Error)
    {}
    func session(_ session: ARSession, cameraDidChangeTrackingState
                    camera: ARCamera) {}
}
