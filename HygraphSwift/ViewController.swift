//
//  ViewController.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section,Product>?
    var products: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Products"
        Task {
               do {
                   await loadProducts()
                   
                   //Updating the Snapshot
                   var updatesnapshot = NSDiffableDataSourceSnapshot<Section, Product>()
                  updatesnapshot.appendSections([.main])
                   //Problem loading this information
                   updatesnapshot.appendItems(products, toSection: .main)
                   await dataSource?.apply(updatesnapshot, animatingDifferences: false)
               } catch {
                   print("Can't load your products")
               }
            
            
           }

        
        //Uncomment when needed
        configureHierarchy()
        configureDataSource()
        //collectionView.register(ListCell.self, forCellWithReuseIdentifier: "ListCell")
            
    }
    
    func loadProducts() async {
            products = await APIService().listProducts()
        }
    
   
         
    
    func configure<T: SelfConfiguringCell>(with product: Product, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? T else {
            fatalError("Unable to dequeue Cell")
        }
        cell.configure(with: product)
        return cell
    }
    
    
    
    
}

extension ViewController {
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}




extension ViewController {
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    
    
    
    private func configureDataSource() {
        
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Product> { (cell, indexPath, product) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(product.name)"
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Product>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Product) -> UICollectionViewCell? in

            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        //inital data
       
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        //Problem loading this information
        snapshot.appendItems([], toSection: .main)
        dataSource?.apply(snapshot, animatingDifferences: false)
        
        
    }
    
}



extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
