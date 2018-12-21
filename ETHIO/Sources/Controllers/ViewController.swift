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
            Place(artirst: "August Burns Red", name: "Constellations", image: "01"),
            Place(artirst: "Breakdown of Sanity", name: "Mirrors", image: "02"),
            Place(artirst: "Currents", name: "The place I feel safest", image: "03"),
            Place(artirst: "Make Them Suffer", name: "Neverbloom", image: "04"),
            Place(artirst: "Parkway Drive", name: "Reverence", image: "05"),
            Place(artirst: "The Haunted", name: "Exit wounds", image: "06"),
            Place(artirst: "Upon a Burning Body", name: "Red White Green", image: "07"),
            Place(artirst: "Whitechapel", name: "Our endless war", image: "08"),
        ]
        
        let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8))
        
        let EthioSection = CollectionViewSection(items: [self.createHorizontal()])
        EthioSection.header = HeaderViewModel("Top metal Ethios")
        
        let items = Places.map { Place -> PlaceViewModel in
            let viewModel = PlaceViewModel(Place)
            viewModel.delegate = self
            return viewModel
        }
        let PlaceSection = CollectionViewSection(items: items)
        PlaceSection.header = HeaderViewModel("Top metal Places")
        
        self.source  = CollectionViewSource(grid: grid, sections: [EthioSection, PlaceSection])
        self.collectionView.reloadData()
    }
    
    func createHorizontal() -> CollectionViewModel {
        let Ethios = [
            Ethio(name: "August Burns Red", image: "a01"),
            Ethio(name: "Breakdown of Sanity", image: "a02"),
            Ethio(name: "Currents", image: "a03"),
            Ethio(name: "Make Them Suffer", image: "a04"),
            Ethio(name: "Parkway Drive", image: "a05"),
            Ethio(name: "The Haunted", image: "a06"),
            Ethio(name: "Upon a Burning Body", image: "a07"),
            Ethio(name: "Whitechapel", image: "a08"),
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
