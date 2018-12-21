//
//  EthioViewModel.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

protocol EthioViewModelDelegate: class {
    func didSelect(Ethio: Ethio)
}

class EthioViewModel: CollectionViewViewModel<EthioCell, Ethio> {
    
    weak var delegate: EthioViewModelDelegate?
    
    override func config(cell: EthioCell, data: Ethio, indexPath: IndexPath, grid: Grid) {
        cell.textLabel.text = data.name
        cell.imageView.image = UIImage(named: data.image)
       
    }
    
    override func size(data: Ethio, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        // note: this is a "complex" displaying the same cell in multiple grids, never done this like before haha
        if grid.columns == 1 {
            return grid.size(for: view, ratio: 1.2)
        }
        if
            (view.traitCollection.userInterfaceIdiom == .phone &&
                view.traitCollection.verticalSizeClass == .compact) ||
            view.traitCollection.userInterfaceIdiom == .pad
        {
            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 3)
        }
        return grid.size(for: view, ratio: 1.2, items: 2, gaps: 1)
    }
    
    override func callback(data: Ethio, indexPath: IndexPath) {
        self.delegate?.didSelect(Ethio: data)
    }
}

class HorizontalEthioViewModel: EthioViewModel {

    override func size(data: Ethio, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        return CGSize(width: 140, height: 164)
    }
}
