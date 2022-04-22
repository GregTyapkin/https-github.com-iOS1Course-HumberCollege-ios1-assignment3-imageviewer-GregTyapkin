//
//  ViewController.swift
//  Assignment3
//
//  Created by user202478 on 11/6/21.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource,
                      AddingImageDelegateProtocol{

    @IBOutlet weak var images_picker: UIPickerView!
    
    @IBOutlet weak var ImageFromURL: UIImageView!
       
    var manager: ImageManager = ImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as! addNewPictureViewController
        aVC.delegate = self
    }
    
    func controllerDidFinishWithImage(ii: ImageInfo) {
        manager.addNewImage(ni: ii)
        images_picker.reloadAllComponents()
    }
    
    func controllerDidCancel() {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            DispatchQueue.main.async {
                let iUrl: URL = URL(string: "\(self.manager.getAllImages()[row].imageURL)")!
                let data = try? Data(contentsOf: iUrl)
                self.ImageFromURL.image = UIImage(data: data!)
            }
            Thread .sleep(forTimeInterval: 20)
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllImages()[row].imageTitle
    }
}

