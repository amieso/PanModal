//
//  PanModalPresentable+Defaults.swift
//  PanModal
//
//  Copyright © 2018 Tiny Speck, Inc. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 Default values for the PanModalPresentable.
 */
public extension PanModalPresentable where Self: UIViewController {

    var topOffset: CGFloat {
        return topLayoutOffset + 21.0
    }

    var shortFormHeight: PanModalHeight {
        return longFormHeight
    }
    
    var mediumFormHeight:  PanModalHeight {
        return longFormHeight
    }

    var longFormHeight: PanModalHeight {

        guard let scrollView = panScrollable
            else { return .maxHeight }

        // called once during presentation and stored
        scrollView.layoutIfNeeded()
        return .contentHeight(scrollView.contentSize.height)
    }

    var cornerRadius: CGFloat {
        return 8.0
    }

    var springDamping: CGFloat {
        return 0.8
    }

    var transitionDuration: Double {
        return PanModalAnimator.Constants.defaultTransitionDuration
    }

    var transitionAnimationOptions: UIView.AnimationOptions {
        return [.curveEaseInOut, .allowUserInteraction, .beginFromCurrentState]
    }

    var panModalBackgroundColor: UIColor {
        return UIColor.black.withAlphaComponent(0.7)
    }

    var scrollIndicatorInsets: UIEdgeInsets {
        let top = shouldRoundTopCorners ? cornerRadius : 0
        return UIEdgeInsets(top: CGFloat(top), left: 0, bottom: 0, right: 0)
    }
    
    var scrollBottomInset: CGFloat { 0 }
    
    var shouldShowVerticalScrollIndicator: Bool { true }

    var anchorModalToLongForm: Bool {
        return true
    }

    var allowsExtendedPanScrolling: Bool {

        guard let scrollView = panScrollable
            else { return false }

        scrollView.layoutIfNeeded()
        return scrollView.contentSize.height > (scrollView.frame.height - bottomLayoutOffset)
    }

    var allowsDragToDismiss: Bool {
        return true
    }

    var allowsTapToDismiss: Bool {
        return true
    }

    var backgroundInteraction: PanModalBackgroundInteraction {
        return self.allowsTapToDismiss ? .dismiss : .none
    }
    
    var backgroundDimBehaviour: PanModalBackgroundDimBehaviour {
        .dynamic
    }
    
    var dynamicBackgroundFadeStartHeight: PanModalHeight { shortFormHeight }

    var isUserInteractionEnabled: Bool {
        return true
    }
    
    var isHapticFeedbackEnabled: Bool {
        return true
    }

    var shouldRoundTopCorners: Bool {
        return isPanModalPresented
    }
    
    var shouldShowShadow: Bool { false }
    
    var shadowOpacity: Float { 0.2 }
    
    var shadowColor: UIColor { .black }
    
    var shadowOffset: CGSize { CGSize(width: 0, height: -2) }

    var shadowRadius: CGFloat { 0 }
    
    func didTapBackground() {
        
    }
    
    func didAttemptDragToDismiss() {
        
    }
    
    func didDropSessionEnterBackground() {
        
    }

    func shouldRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return true
    }

    func willRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) {

    }

    func shouldTransition(to state: PanModalPresentationController.PresentationState) -> Bool {
        return true
    }

    func shouldPrioritize(panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return false
    }

    func willTransition(to state: PanModalPresentationController.PresentationState) {

    }
    
    func didTransition(to state: PanModalPresentationController.PresentationState) {

    }
    
    func updatedProgress(to percentage: Double) {
        
    }

    func panModalWillDismiss() {

    }

    func panModalDidDismiss() {

    }
}
#endif
