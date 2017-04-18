//
//  ViewExtension.swift
//  TransformationKit
//
//  Created by Evgeniy Safronov on 18.04.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit
import ObjectiveC


public extension UIView {
    struct CustomProperties {
        static var animationTag: String?
    }
    
    @IBInspectable public var animationTag: String? {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.animationTag) as? String
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.animationTag, newValue as NSString?, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
