//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 21.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photosImage = Photos.makePhotosModel()
    
    lazy var photosGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let gallary = UICollectionView(frame: .zero, collectionViewLayout: layout)
        gallary.translatesAutoresizingMaskIntoConstraints = false
        gallary.backgroundColor = .white
        gallary.delegate = self
        gallary.dataSource = self
        gallary.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        return gallary
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor(ciColor: .init(color: hexStringToUIColor(hex: "#4885CC")))
        self.view.backgroundColor = .systemGray6
        self.title = "Photo Gallery"
        self.navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.isHidden = false
        setupLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupLayout() {
        view.addSubview(photosGallery)
        
        NSLayoutConstraint.activate([
            photosGallery.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosGallery.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosGallery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosGallery.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
// MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photosImage[indexPath.row])
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.item)
    }
}
