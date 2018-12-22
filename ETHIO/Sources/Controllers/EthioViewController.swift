//
//  EthioViewController.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class EthioViewController: CollectionViewController {
    
    var Ethio: Ethio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.Ethio.name
        
        let his = """
        A virtual guide to Ethiopia, the land formerly known as Abyssinia.
            Ethiopia is a landlocked country on the Horn of Africa, in the east of the continent. It is bordered by Djibouti, Eritrea, Kenya, Somalia, South Sudan, Sudan, and Somaliland (Somalia).Ethiopia covers an area of 1,126,829 km², this is about twice the size of France or the U.S. state of Texas. Highest elevation is Mount Ras Dashen with 4620 m. A population of more than 90 million inhabitants makes the country the second-most populous nation in Africa. The country comprises of more than 80 ethnic groups and as many languages.

        Background:
        Oldest independent country in Africa and one of the oldest in the world - at least 2,000 years. The country comprises of more than 80 ethnic groups and as many languages. Primarily their shared independent existence unites Ethiopia's many nations. Unique among African countries, Ethiopia has never been colonised, one exception being the occupation by Italy in 1936-41.

        In 1974 a military junta, the Derg, deposed Emperor Haile SELASSIE (who had ruled since 1930) and established a socialist state. Torn by bloody coups, uprisings, wide-scale drought, and massive refugee problems, the regime of Mengistu Hailemariam was finally toppled by a coalition of rebel forces, the Ethiopian People's Revolutionary Democratic Front (EPRDF), in 1991.A new constitution was adopted in 1994 which guaranteed the religious rights and the cultural and political rights of all ethnic groups. Ethiopia's first multiparty elections were held in 1995. With a peace treaty on 12 December 2000 a 30 year old struggle with Eritrea ended.
        """
        
        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))
        
        let hisSection = CollectionViewSection(items: [DynamicTextViewModel(his)])
        hisSection.header = HeaderViewModel("History")
        
        let Places = [
            Place(artirst: "Mother Land", name: "LandScape", image: "E01"),
            Place(artirst: "Farmer", name: "Farming", image: "E02"),
            Place(artirst: "Mother Land", name: "LandScape", image: "E08"),
            ]
        
        let items = Places.map { PlaceViewModel($0) }
        let PlaceSection = CollectionViewSection(items: items)
        PlaceSection.header = HeaderViewModel("Places")
        
        self.source = CollectionViewSource(grid: grid, sections: [hisSection, PlaceSection])
        self.collectionView.reloadData()
    }
    
}

