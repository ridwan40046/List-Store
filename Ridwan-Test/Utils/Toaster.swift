//
//  Toaster.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import Foundation
import Toaster

let underDevelopment = "Sorry, this feature is under development";
let forbiddenToasts = ["you don't have permission in this feature",
                    "Please wait this person to confirm your request"]

func toastUnderDevelopment() { toast(underDevelopment); }

func toastDeprecated (functionName: String) { toast("The function \(functionName) is deprecated and disabled."); }

func toast (_ text: String?, color: UIColor? = nil, duration: TimeInterval? = nil, force: Bool = false) {
    Util.mainThread {
        guard let text = text, text != "" else { return; }
        if !force { for el in forbiddenToasts { if el.contains(text) { return; } } }
        if !force { return; }
        let t = Toast(text: text);
        t.duration = duration ?? 3;
        if let color = color { t.view.backgroundColor = color; }
        t.show();
        print ("TOAST: \(text)");
    }
}

func toastUser (_ text: String?, color: UIColor? = nil, duration: TimeInterval? = nil) {
    toast (text, color: color, duration: duration, force: true);
}

func showToast(text: String) {
    let duration: TimeInterval = (text.count > 45) ? Delay.long : Delay.short
    Toast(text: text, duration: duration).show()
}

