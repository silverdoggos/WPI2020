//
//  ARView.swift
//  WPI2020
//
//  Created by Сергей Образцов on 03.03.2021.
//

import SwiftUI

struct ARViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ARViewController
    
    func makeUIViewController(context: Context) -> ARViewController {
        return ARViewController()
    }
    func updateUIViewController(_ uiViewController:
                                    ARViewRepresentable.UIViewControllerType, context:
                                        UIViewControllerRepresentableContext<ARViewRepresentable>) { }
}

