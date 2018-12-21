//
//  ViewController.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 12..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: CollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ETHIO"
    
        let Places = [
            Place(artirst: "OMO Regions", name: "OMO", image: "C01"),
            Place(artirst: "South Regions", name: "South", image: "C02"),
            Place(artirst: "Amhara Regions", name: "Amhara", image: "C03"),
            Place(artirst: "Tigray Regions", name: "Tigray", image: "C04"),
            Place(artirst: "Oromo Regions", name: "Oromo", image: "C05"),
            Place(artirst: "Afar Regions", name: "Afar", image: "C06"),
            Place(artirst: "Semen Mountain", name: "Semen Mountain", image: "E07"),
            Place(artirst: "Religion", name: "Religion", image: "E03"),
            Place(artirst: "Lucy", name: "Lucy", image: "C07"),
            Place(artirst: "Walia ibex", name: "Walia", image: "C08"),
            Place(artirst: "Ethiopian wolf", name: "Red Fox", image: "C09"),
            Place(artirst: "Shaperd", name: "Mountains", image: "E05"),
        ]
        
        let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8))
        
        let EthioSection = CollectionViewSection(items: [self.createHorizontal()])
        EthioSection.header = HeaderViewModel("Top Places To Visit")
        
        let items = Places.map { Place -> PlaceViewModel in
            let viewModel = PlaceViewModel(Place)
            viewModel.delegate = self
            return viewModel
        }
        let PlaceSection = CollectionViewSection(items: items)
        PlaceSection.header = HeaderViewModel("Regions")
        
        self.source  = CollectionViewSource(grid: grid, sections: [EthioSection, PlaceSection])
        self.collectionView.reloadData()
    }
    
    func createHorizontal() -> CollectionViewModel {
        let Ethios = [
            Ethio(name: "Lalibela", image: "E09"),
            Ethio(name: "Ethiopian Coffee", image: "E10"),
            Ethio(name: "Axum", image: "E11"),
            Ethio(name: "Gonder Castel", image: "E12"),
            Ethio(name: "Nile River", image: "E13"),
            Ethio(name: "Addis Ababa", image: "E14"),
            Ethio(name: "Ethiopian Air Lines", image: "E15"),
            Ethio(name: "Erta Ale Active Volcano", image: "E16"),
        ]

        let items = Ethios.map { Ethio -> HorizontalEthioViewModel in
            let viewModel = HorizontalEthioViewModel(Ethio)
            viewModel.delegate = self
            return viewModel
        }

        let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8))
        let section = CollectionViewSection(items: items)
        let source  = CollectionViewSource(grid: grid, sections: [section])
        
        return CollectionViewModel(source)
    }
}

extension ViewController: EthioViewModelDelegate {
    
    func didSelect(Ethio: Ethio) {
        let viewController = EthioViewController(nibName: nil, bundle: nil)
        viewController.Ethio = Ethio
        self.show(viewController, sender: nil)
    }
}


extension ViewController: PlaceViewModelDelegate {

    func didSelect(Place: Place) {
        let viewController = PlaceViewController(nibName: nil, bundle: nil)
        viewController.Place = Place
        self.show(viewController, sender: nil)
    }
}
