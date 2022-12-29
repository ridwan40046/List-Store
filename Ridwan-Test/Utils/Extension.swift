//
//  Extension.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 27/12/22.
//

import Foundation
import UIKit

class Util: NSObject {
    static func mainThread (_ callback: @escaping (()->Void)) {
        DispatchQueue.main.async {
            callback();
        }
    }

    static func backgroundThread (_ callback: @escaping (()->Void)) {
        DispatchQueue.global().async {
            callback();
        }
    }
}
// MARK: - Extension User default
extension UserDefaults {
    
    subscript (key: String)->AnyObject? {
        get {
            return self.value(forKey: key) as AnyObject?;
        }
        set {
            self.setValue(newValue, forKey: key);
        }
    }
    
}

// MARK: - Extension UITextField
extension UITextField {
    enum Direction {
        case LEFT
        case RIGHT
    }
    // add image to textfield
    func withImage(direction: Direction, image: UIImage?, colorBorder: UIColor) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 8
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .white
        mainView.addSubview(view)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        if(Direction.LEFT == direction) { // image left
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            self.rightViewMode = .always
            self.rightView = mainView
        }
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 8
    }
}

extension UIView {
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
    }
    
    var y: CGFloat {
        get { return self.frame.origin.y; }
        set {
            var frame = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height; }
        set {
            var frame = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
    }
    
    var width: CGFloat {
        get { return self.frame.size.width; }
        set {
            var frame = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
    }
    
    func view (_ tag: Int)->UIView? { return self.viewWithTag(tag); }
    
    enum IndicatorPosition { case midLeft; case center; case midRight; }
    
    func addIndicator (position: IndicatorPosition = .center, fromSuperview: Bool = false, addShade: Bool = true) {
        if self.view(48273) != nil { return; }
        let v = UIView();
        v.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: addShade ? 0.5 : 0);
        v.tag = 48273;
        if fromSuperview {
            self.superview?.addSubview(v);
            v.frame = self.frame;
        }
        else {
            self.addSubview(v);
            v.frame = self.bounds;
        }
        v.autoresizingMask = [.flexibleHeight, .flexibleWidth];
        
        let indicator = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20));
        v.addSubview(indicator);
        indicator.center = v.center;
//                print ("VIEW X = \(v.x), Y = \(v.y), WIDTH = \(v.width), HEIGHT = \(v.height)");
        //        let s = UIScreen.main.bounds;
        //        print ("SCREEN WIDTH = \(s.width), HEIGHT = \(s.height)")
        if self is UIButton { indicator.x = v.width - indicator.width - 20; }
        indicator.color = UIColor.black;
        switch position {
        case .midLeft: indicator.x = v.x + 20;
        case .center: break;
        case .midRight: indicator.x = v.x + v.width - indicator.width - 20;
        }
        indicator.startAnimating();
//        print ("INDICATOR X = \(indicator.x), Y = \(indicator.y), WIDTH = \(indicator.width), HEIGHT = \(indicator.height)");

        v.alpha = 0;
        UIView.animate(withDuration: 0.5) { v.alpha = 1; }
    }
    
    func removeIndicator (recursive: Bool = true) {
        guard let v = self.superview?.view(48273) else { return; }
        UIView.animate(withDuration: 0.1, animations: { v.alpha = 0; }) { done in
            v.removeFromSuperview();
            if recursive { while let v = self.superview?.view(48273) { v.removeFromSuperview(); } }
        }
    }
}
