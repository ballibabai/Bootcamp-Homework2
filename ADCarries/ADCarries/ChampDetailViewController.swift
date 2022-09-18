//
//  ChampDetailViewController.swift
//  ADCarries
//
//  Created by İbrahim Ballıbaba on 17.09.2022.
//

import UIKit

class ChampDetailViewController: UIViewController {
    
    //MARK: - UI Elements
    @IBOutlet weak var champImage: UIImageView!
    @IBOutlet weak var champText: UITextView!
    
    //MARK: - Properties
    var selectedChamp: Marksman?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       addCharToElements()
    }
    
    //MARK: - Functions
    
    //Add data from struct to elements
    func addCharToElements(){
        if let selectedChamp = selectedChamp {
            champImage.image = selectedChamp.champImage
            champText.text = selectedChamp.champInfo
            navigationItem.title = selectedChamp.champName
        }
    }
    
    //send to website
    @IBAction func clickedToWeb(_ sender: UIButton) {
        let webVC = storyboard?.instantiateViewController(withIdentifier: "webViewVC") as! LolWebViewController
        self.present(webVC, animated: true)
    }
    

}
