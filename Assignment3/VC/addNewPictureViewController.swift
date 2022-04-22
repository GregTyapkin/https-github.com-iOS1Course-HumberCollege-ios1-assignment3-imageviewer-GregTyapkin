//
//  addNewPictureViewController.swift
//  Assignment3
//
//  Created by user202478 on 11/6/21.
//

import UIKit

protocol AddingImageDelegateProtocol {
    func controllerDidFinishWithImage(ii: ImageInfo)    // did, will,
    func controllerDidCancel()
}

class addNewPictureViewController: UIViewController {

    var delegate: AddingImageDelegateProtocol?
    
    @IBOutlet weak var img_Title: UITextField!
    @IBOutlet weak var img_URL: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func save_clicked(_ sender: Any) {
        if let imageTitle = img_Title.text {
            if let imageURL = img_URL.text{
                if !imageTitle.isEmpty && !imageURL.isEmpty{
                    let newImage = ImageInfo(t: imageTitle, u: imageURL)
                    print(newImage.imageTitle)
                    delegate?.controllerDidFinishWithImage(ii: newImage)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func cancel_clicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
}
