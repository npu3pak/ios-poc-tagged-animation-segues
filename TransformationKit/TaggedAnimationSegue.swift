//
//  TransparentSegue.swift
//  DBODemo
//
//  Created by Evgeniy Safronov on 13.02.17.
//  Copyright © 2017 RUCARD LTD. All rights reserved.
//

import UIKit

class TaggedAnimationSegue: UIStoryboardSegue {
    private var originalFrames = [String: CGRect]()
    private var originalAlphas = [String: CGFloat]()
    
    override func perform() {
        UIView.animate(withDuration: 0.4,
                       animations: animateTransition,
                       completion: finishTransition)
    }
    
    func animateTransition() {
        source.view.subviews.filter({$0.animationTag != nil}).forEach() { leftSubview in
            if let rightSubview = destination.view.subviews.first(where: {$0.animationTag == leftSubview.animationTag}) {
                originalFrames[leftSubview.animationTag!] = leftSubview.frame
                leftSubview.frame = destination.view.convert(rightSubview.frame, to: source.view)
            } else {
                originalAlphas[leftSubview.animationTag!] = leftSubview.alpha
                leftSubview.alpha = 0
            }
        }
    }
    
    private func finishTransition(finished: Bool) {
        source.navigationController?.pushViewController(destination, animated: false)
        
        source.view.subviews.filter({$0.animationTag != nil}).forEach() { leftSubview in
            if let originalFrame = originalFrames[leftSubview.animationTag!] {
                leftSubview.frame = originalFrame
            } else if let originalAlpha = originalAlphas[leftSubview.animationTag!] {
                leftSubview.alpha = originalAlpha
            }
        }
        
        originalFrames.removeAll()
        originalAlphas.removeAll()
    }
}
