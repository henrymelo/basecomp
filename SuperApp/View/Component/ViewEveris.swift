//
//  EverisView.swift
//  SuperApp
//
//  Created by Henrique Melo on 06/04/21.
//

import Foundation
import UIKit

class ViewEveris: UIView {
    var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        //xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        
        self.backgroundColor = .yellow
    }
}

private extension ViewEveris {
//    func xibSetup() {
//        backgroundColor = UIColor.clear
//        view = fromNib()
//        view.frame = bounds
//        addSubview(view)
//        view.translatesAutoresizingMaskIntoConstraints = false
//    }
}

extension UIView {
    
    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let b = Bundle(identifier: "bankios.apptest.SuperApp") {
            bundle = b
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }
    
    public class func fromNib() -> Self {
        return fromNib(viewType: self)
    }
    
    public class func fromNib<T: UIView>(viewType: T.Type) -> T {
        if let nib = bundleUI.loadNibNamed(
        String(describing: viewType), owner: nil, options: nil)?.first as? T {
            return nib
        }
        return T()
    }
    
}
