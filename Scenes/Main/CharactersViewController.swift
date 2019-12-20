//
//  CharactersViewController.swift
//  rickAndMorty
//
//  Created by Mohamad on 12/8/19.
//  Copyright © 2019 Mohamad barek. All rights reserved.
//

import UIKit
import Moya
import SDWebImage
class CharactersViewController: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    var chars = [Results]()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        charactersTableView.register(UINib(nibName: "CharactersTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersTableViewCell")
        charactersTableView.estimatedRowHeight = 80
        charactersTableView.rowHeight = UITableView.automaticDimension 
     }
    
    func getDetails(){
        APIClient.shared.getCharacters { (result) in
            switch result {
            case .success:
                do {
                    self.chars = try result.get().results!
                    DispatchQueue.main.async {
                        self.charactersTableView.reloadData()
                    }

                } catch {}
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }

}

extension CharactersViewController: UITableViewDelegate {
    
}
extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: "CharactersTableViewCell", for: indexPath) as! CharactersTableViewCell
        let arrayindex = chars[indexPath.row]
        cell.characterLabel.text = " id:\(String(describing: arrayindex.id!)) and name:\(String(describing: arrayindex.name!))"
        cell.characterImageView.sd_setImage(with: URL(string: arrayindex.image!), placeholderImage: UIImage(named: "download"))
        return cell
    }
    
    
}
