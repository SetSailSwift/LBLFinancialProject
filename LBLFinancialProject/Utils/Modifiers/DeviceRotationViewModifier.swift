//
//  DeviceRotationViewModifier.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/1/23.
//

import Foundation
import SwiftUI

/// DeviceRotationViewModifier
/// View modifier that detects when device orientation changes and updates accordingly
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
