//
//  ViewDetailsVC.swift
//  UIKitBecaiOS
//
//  Created by Henrique Melo on 15/04/21.
//

import Foundation
import UIKit

public struct ViewDetailsUIVC {
    public var name: String
    public var sigla: String
    public var price: Double
    public var idIcon: String
    public var delegate: DetailViewDelegate
    
    public init(name: String, sigla: String, price: Double, idIcon: String,
                delegate: DetailViewDelegate ) {
        self.name = name
        self.sigla = sigla
        self.price = price
        self.idIcon = idIcon
        self.delegate = delegate
    }
}

public class ViewDetailsVC: UIViewController {

    @IBOutlet weak var stackDetails: UIStackView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    public func setupUI(viewDetails: ViewDetailsUIVC)  {
        let head = DetailViewUI.fromNib()
        head.setupUI(delegate: viewDetails.delegate)
        head.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        stackDetails.addArrangedSubview(head)
    }
    
    public func setupUI(delegate: DetailViewDelegate)  {
        let head = DetailViewUI.fromNib()
        head.setupUI(delegate: delegate)
        head.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        stackDetails.addArrangedSubview(head)
    }
}

extension ViewDetailsVC: DetailViewDelegate {
    public func viewDetailAction() {
        // Ação que vc quiser
    }
}

extension UIViewController {
    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let bundeLet = Bundle(identifier: "org.cocoapods.UIKitBecaiOS") {
            bundle = bundeLet
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }
    public class func fromSB() -> Self {
        return fromSB(viewType: self)
    }
    public class func fromSB<T: UIViewController>(viewType: T.Type) -> T {
        let sb = UIStoryboard(name: "StoryDetails", bundle: bundleUI)
        if let vc = sb.instantiateViewController(withIdentifier: "ViewDetails") as? T {
            vc.loadViewIfNeeded()
            return vc
        }
        return T()
    }
}

public class loadStory: UIViewController {
    public static func execLoad() -> UIViewController {
        if let bundle = Bundle(identifier: "org.cocoapods.UIKitBecaiOS") {
            let sb = UIStoryboard(name: "StoryDetails", bundle: bundle)
            let vc = sb.instantiateViewController(withIdentifier: "ViewDetails") as! ViewDetailsVC
            vc.loadViewIfNeeded()
            return vc
        } else {
            return UIViewController()
        }
        
    }
    
}

 
