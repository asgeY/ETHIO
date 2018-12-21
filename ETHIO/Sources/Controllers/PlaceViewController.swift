//
//  DetailViewController.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class PlaceViewController: CollectionViewController {
    
    var Place: Place!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.Place.artirst

        let PlaceSection = CollectionViewSection(items: [PlaceViewModel(self.Place)])
        PlaceSection.header = HeaderViewModel(self.Place.name)

        let Tours = Array<Tour>(repeating: Tour(name: "Lorem ipsum dolor sit amet", duration: "04:13"), count: 12)
        let items = Tours.map { TourViewModel($0) }
        let newItems: [CollectionViewViewModelProtocol] = Array(items.map { [$0] }
                                                            .joined(separator: [SeparatorViewModel(2)]))

        let TourSection = CollectionViewSection(items: newItems)
        TourSection.header = HeaderViewModel("Tours")

        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))
        self.source = CollectionViewSource(grid: grid, sections: [PlaceSection, TourSection])
        self.collectionView.reloadData()
    }
    
}
