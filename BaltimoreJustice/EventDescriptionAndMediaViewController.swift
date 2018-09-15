//
//  EventDescriptionAndMediaViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 12/28/16.
//  Copyright © 2016 Christopher Eckart. All rights reserved.
//

import UIKit

class EventDescriptionAndMediaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    // MARK: Outlets and Variables
    
    var INCIDENTDESCRIPTION = ""
    
    var globalImage1:UIImage? = nil
    var globalImage2:UIImage? = nil
    var globalImage3:UIImage? = nil
    var globalImage4:UIImage? = nil
    var globalImage5:UIImage? = nil

    
    @IBOutlet weak var EventDescriptionTextField: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        EventDescriptionTextField.delegate = self
        
        // Hide keyboard if background is touched
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(EventDescriptionAndMediaViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("the value of INCIDENTDESCRIPTION is" , INCIDENTDESCRIPTION)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextViewDelegate
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        // Hide the keyboard
        textView.resignFirstResponder()
        return true
    }
    
    // Hide keyboard if background is touched
    func didTapView(){
        self.view.endEditing(true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        INCIDENTDESCRIPTION = textView.text!
        print("the value of INCIDENTDESCRIPTION is" , INCIDENTDESCRIPTION)
        defaults.set(INCIDENTDESCRIPTION, forKey: "FINALYDESCRIPTION")
    }
    
    // MARK: UPDATE, consider not using textViewDidChange in fear of using too much memory, for it validates the text every single character
    func textViewDidChange(_ textView: UITextView) {
        INCIDENTDESCRIPTION = textView.text!
        print("the value of INCIDENTDESCRIPTION is" , INCIDENTDESCRIPTION)
        defaults.set(INCIDENTDESCRIPTION, forKey: "FINALYDESCRIPTION")
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        globalImage1 = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UIButton) {
        // Hide the keyboard.
        EventDescriptionTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePicker = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePicker.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    
}
