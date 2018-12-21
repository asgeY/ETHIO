//
//  PlaceViewModel.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 12..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

protocol PlaceViewModelDelegate: class {
    func didSelect(Place: Place)
}

class PlaceViewModel: CollectionViewViewModel<PlaceCell, Place> {

    weak var delegate: PlaceViewModelDelegate?
    
    override func config(cell: PlaceCell, data: Place, indexPath: IndexPath, grid: Grid) {
        cell.textLabel.text = data.artirst
        cell.detailTextLabel.text = data.name
        cell.imageView.image = UIImage(named: data.image)
    }
    
    override func size(data: Place, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        if
            (view.traitCollection.userInterfaceIdiom == .phone && view.traitCollection.verticalSizeClass == .compact) ||
            view.traitCollection.userInterfaceIdiom == .pad
        {
            return grid.size(for: view, ratio: 1.2, items: grid.columns / 4, gaps: grid.columns - 1)
        }
        if grid.columns == 1 {
            return grid.size(for: view, ratio: 1.1)
        }
        return grid.size(for: view, ratio: 1.2, items: grid.columns / 2, gaps: grid.columns - 1)
    }

    override func callback(data: Place, indexPath: IndexPath) {
        self.delegate?.didSelect(Place: data)
    }
}
