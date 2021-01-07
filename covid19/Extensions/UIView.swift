//
//  UIView.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import UIKit

extension UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static func fromNib() -> Self? {

        let bundle = Bundle(for: self)
        let nib = bundle.loadNibNamed(nibName, owner: self, options: nil)
        
        return nib?.first as? Self

    }
    
    func activityStartAnimating() {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = .lightGray
        backgroundView.tag = 999999

        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        isUserInteractionEnabled = false

        backgroundView.addSubview(activityIndicator)

        addSubview(backgroundView)
    }

    func activityStopAnimating() {
        if let background = viewWithTag(999999) {
            background.removeFromSuperview()
        }
        isUserInteractionEnabled = true
    }
}
