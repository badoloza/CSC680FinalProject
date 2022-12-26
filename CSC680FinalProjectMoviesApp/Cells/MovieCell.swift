//
//  MovieCell.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/24/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var posterLabel: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
