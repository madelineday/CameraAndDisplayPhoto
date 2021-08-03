//
//  ViewController.swift
//  CameraAndDisplayPhoto
//
//  Created by Madeline Day on 8/3/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
        var imagePicker = UIImagePickerController ()
        
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func takeSelfieTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    
    }
    
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        let imagePickerController = UIImagePickerController ()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title:"Photo Source", message: "Choose a Source", preferredStyle: .actionSheet )
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction ) in imagePickerController.sourceType = .camera; self.present(imagePickerController, animated: true, completion: nil )}))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction ) in imagePickerController.sourceType = .photoLibrary; self.present(imagePickerController, animated: true, completion: nil )}))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        self.present(actionSheet, animated: true, completion: nil )
    }
    
    func imagePickerControllerDidCancel ( picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

