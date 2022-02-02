//
//  ImageViewController.swift
//  ImageLoader
//
//  Created by David Dahina on 12/30/21.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.loadImage(url: "https://images7.alphacoders.com/671/671281.jpg")
    }
    
}
