//
//  MainViewController.swift
//  rickAndMorty
//
//  Created by Mohamad on 12/8/19.
//  Copyright © 2019 Mohamad barek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var charactersImage: UIImageView!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var episodesImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        charactersImage.isUserInteractionEnabled = true
        charactersImage.addGestureRecognizer(tapGestureRecognizer)
     }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CharactersVC") as! CharactersViewController
         self.navigationController?.pushViewController(vc, animated: true)
        // Your action
    }
     

}
