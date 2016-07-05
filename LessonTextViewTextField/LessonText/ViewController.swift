//
//  ViewController.swift
//  LessonText
//
//  Created by Wild Deer on 28.06.16.
//  Copyright © 2016 Spalah. All rights reserved.
//

import UIKit

extension ViewController: UITextViewDelegate {
    func textViewDidChange(textView: UITextView) {
        textField.text = textView.text
    }

    func textView(textView: UITextView,
                  shouldChangeTextInRange range: NSRange,
                  replacementText text: String) -> Bool {
        let oldText: NSString = textView.text ?? ""
        let newText = oldText.stringByReplacingCharactersInRange(range,
                                                                 withString: text)
        return newText.characters.count <= 10
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    let textView = UITextView()
    var textViewBottomConstraint: NSLayoutConstraint?

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.backgroundColor = .blueColor()
        textView.textColor = .whiteColor()
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textView)
        let textFieldDidChange = #selector(self.textFieldDidChange(_:))
        textField.addTarget(self, action: textFieldDidChange, forControlEvents: .EditingChanged)
//        textView.text = "Bla bla bla bla"
//        textView.delegate = self
//        textView.centerXAnchor.constraintEqualToAnchor(textView.centerXAnchor).active = true
//        textView.becomeFirstResponder()

//        view.addConstraint(NSLayoutConstraint(item: textView,
//            attribute: NSLayoutAttribute.CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
//        view.addConstraint(NSLayoutConstraint(item: textView,
//            attribute: NSLayoutAttribute.CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0))
//        textView.addConstraint(NSLayoutConstraint(item: textView,
//            attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute , multiplier: 1, constant: 100))
//        textView.addConstraint(NSLayoutConstraint(item: textView,
//            attribute: NSLayoutAttribute.Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute , multiplier: 1, constant: 100))
        view.centerXAnchor.constraintEqualToAnchor(textView.centerXAnchor).active = true
//        view.centerYAnchor.constraintEqualToAnchor(textView.centerYAnchor).active = true
//        textView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 20).active = true
        textViewBottomConstraint = textView.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor)
        textViewBottomConstraint?.active = true

        textView.widthAnchor.constraintEqualToConstant(100).active = true
//        let heightConstraint = textView.heightAnchor.constraintEqualToConstant(view.heightAnchor, multiplier: 0.5)
        let heightConstraint = textField.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.5, constant: 0)
        heightConstraint.active = true

        let didShowSelector = #selector(self.keyboardWillShow(_:))
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: didShowSelector, name: UIKeyboardWillShowNotification,
                                                         object: nil)
        let willHideSelector = #selector(self.keyboardWillHide)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: willHideSelector,
                                                         name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func keyboardWillHide(notification: NSNotification) {
        textViewBottomConstraint?.constant = 0
        UIView.animateWithDuration(0.3) { 
            self.textView.layoutIfNeeded()
        }
    }
    func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardFrameValue.CGRectValue()
        textViewBottomConstraint?.constant = -keyboardFrame.height
        UIView.animateWithDuration(0.3) { 
            self.textView.layoutIfNeeded()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDidChange(sender: UITextField) {
        textView.text = textField.text
    }

}



