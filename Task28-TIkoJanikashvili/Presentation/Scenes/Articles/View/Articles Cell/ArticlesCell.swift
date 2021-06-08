//
//  NewsCell.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import UIKit
import Kingfisher

class ArticlesCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var articlesImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var publishedAtLabel: UILabel!

    // MAKR: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.articlesImageView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(at article: ArticlesViewModel) {
        self.authorLabel.text = article.author
        self.descriptionLabel.text = article.description
        self.publishedAtLabel.text = article.time
        self.setupImage(with: article.imageURL)
    }
    
    private func getTime(df: String) -> String {
        print(df)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let dataformater = dateFormatter.date(from: df) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "HH:mm"
            let dateString = dateFormatter.string(from: dataformater)
            return dateString
        } else {
            return ""
        }
    }
    
    private func setupImage(with url: URL?) {
//        let url = URL(string: url)
        articlesImageView.kf.indicatorType = .activity
        articlesImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
//                print("")
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
//                print("ssd")
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
