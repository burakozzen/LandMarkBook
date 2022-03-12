//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by Burak ÖZEN on 12.03.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    var selectedLandMarkName = "";
    var selectedLandMarkImage = UIImage();
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageLabel.text = selectedLandMarkName;
        imageView.image = selectedLandMarkImage;
    }
    

}
