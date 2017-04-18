//
//  ViewExtension.swift
//  TransformationKit
//
//  Created by Evgeniy Safronov on 18.04.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit
import ObjectiveC

fileprivate var ViewAnimationTagHandle: UInt8 = 0

public extension UIView {
    @IBInspectable public var animationTag: String? {
        get {
            return objc_getAssociatedObject(self, &ViewAnimationTagHandle) as? String
        }
        set {
            objc_setAssociatedObject(self, &ViewAnimationTagHandle, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
