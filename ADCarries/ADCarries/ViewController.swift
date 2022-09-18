//
//  ViewController.swift
//  ADCarries
//
//  Created by İbrahim Ballıbaba on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - UI Elements
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    private var marksmanData = Marksman.ChampionsData.characterData
    
    var selectedChamp: Marksman?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

}

    //MARK: - Extensions
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //create a instance from ChampDetailViewController
        let champDetailVC = storyboard?.instantiateViewController(withIdentifier: "champDetailVC") as! ChampDetailViewController
        
        
        selectedChamp = marksmanData[indexPath.row]  //select data with indexPath
        champDetailVC.selectedChamp = selectedChamp // and send to other VC
        
        //condition for data empty or loaded
        if champDetailVC.selectedChamp != nil {
            navigationController?.pushViewController(champDetailVC, animated: true)
        }else {
            print("error")
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marksmanData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "champCell", for: indexPath) as! ChampionsCollectionViewCell
        let marksmanSelected = marksmanData[indexPath.row]
        cell.updateUI(marksmanSelected)
        return cell
    }
}

//Setting the display of the cell
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 2, height: collectionView.frame.height / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 12.0)
    }
}

// Sending data in struct to cell
private extension ChampionsCollectionViewCell {
    
    func updateUI(_ champ: Marksman){
        champImage.image = champ.champImage
        champTitle.text = champ.champName
        
    }
}
