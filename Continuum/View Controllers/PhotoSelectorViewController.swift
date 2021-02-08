//
//  PhotoSelectorViewController.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/7/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

protocol PhotoSelectorDelegate: AnyObject {
    func photoSelected(image: UIImage)
}

class PhotoSelectorViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickImageButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    static var delegate: PhotoSelectorDelegate?
    
    @IBAction func pickImageButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Select An Image", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            self.openGallery()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(photoLibraryAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension  PhotoSelectorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func openGallery() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Unable to access Photo Library", message: "Check Permissions", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            guard let delegate = PhotoSelectorViewController.delegate else { return }
            delegate.photoSelected(image: image)
            imageView.image = image
            pickImageButton.setTitle("", for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
