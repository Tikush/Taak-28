//
//  NewsCell.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!

    // MAKR: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
