//
//  OnboardingViewControllerCellCollectionViewCell.swift
//  Deltna
//
//  Created by Mohammad on 9/3/22.
//

import UIKit

class OnboardingViewControllerCell: UICollectionViewCell {
    
    
    static let identifire = "OnboardingViewControllerCell"
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    func setup(_ slide:OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}



