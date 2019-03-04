//
//  ViewController.swift
//  level2
//
//  Created by Irvin Leon on 3/4/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var listCollectionView: UICollectionView!
    var posts: [Post] = [Post(name:"cualquier",photo: #imageLiteral(resourceName: "img3")),
                         Post(name:"cualquier 2",photo: #imageLiteral(resourceName: "img1")),
                         Post(name:"cualquier 3",photo: #imageLiteral(resourceName: "img2"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCollectionView.dataSource   = self
        listCollectionView.delegate     = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = listCollectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as? PostCollectionViewCell else{
            fatalError()
        }
       item.nameLabel.text          = posts[indexPath.row].name
        item.photoImageView.image   = posts[indexPath.row].photo
        return item;
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: listCollectionView.frame.size.width, height: 300.0)
    }

}
