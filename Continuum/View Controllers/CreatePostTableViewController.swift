//
//  CreatePostTableViewController.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/7/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class CreatePostTableViewController: UITableViewController {
    
    @IBOutlet weak var captionTextField: UITextField!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PhotoSelectorViewController.delegate = self
    }

    @IBAction func addPostButtonTapped(_ sender: Any) {
        
        guard let caption = captionTextField.text, !caption.isEmpty,
              let image = image else { return }
        
        PostController.shared.createPostWith(image: image, caption: caption) { (result) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}   //  End of Class

extension CreatePostTableViewController: PhotoSelectorDelegate {
    func photoSelected(image: UIImage) {
        self.image = image
    }
}
