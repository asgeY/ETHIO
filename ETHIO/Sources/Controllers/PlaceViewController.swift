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
        
        let tours = """
             A diverse group of people live in the Omo Valley.  But the various tribes in the region do share some commonalities,such as their reliance on the Omo River as an essential resource.  Most tribes rely on the annual flooding of the river.  Cattle, goats and sheep are also essential to most of the tribes’ livelihoods.

        """
        
        let TourSection = CollectionViewSection(items: [DynamicTextViewModel(tours)])
        TourSection.header = HeaderViewModel("Tours")
        
        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))
        self.source = CollectionViewSource(grid: grid, sections: [PlaceSection, TourSection])
        self.collectionView.reloadData()
    }
    
}
