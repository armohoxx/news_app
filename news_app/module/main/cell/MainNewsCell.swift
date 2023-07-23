//
//  MainNewsCell.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 23/7/2566 BE.
//

import UIKit
import Kingfisher

class MainNewsCell: UICollectionViewCell {
    
    @IBOutlet weak var contentNewsView: UIView!
    @IBOutlet weak var imageNewsView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var dateNewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.newsTextView.isUserInteractionEnabled = false
    }
    
    func displayNews(newsData: ArticlesEntity) {
        self.contentNewsView.layer.borderWidth = 1
        self.contentNewsView.layer.cornerRadius = 15
        self.contentNewsView.layer.borderColor = UIColor.systemGray.cgColor
        self.imageNewsView.contentMode = .scaleToFill
        self.imageNewsView.layer.cornerRadius = 15
        self.imageNewsView.clipsToBounds = true
        self.imageNewsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.titleLabel.textAlignment = .center
        self.newsTextView.textAlignment = .center
        self.dateNewLabel.textAlignment = .center
        
        if let url = URL(string: newsData.urlToImage) {
            KingfisherManager.shared.retrieveImage(with: url) { (result) in
                switch result {
                case let .success(value):
                    self.imageNewsView.image = value.image
                    break
                default:
                    print("cannot load an image")
                }
            }
        }
        
        self.titleLabel.text = newsData.title
        self.newsTextView.text = newsData.descriptionNews
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let timeDate = formatter.date(from: newsData.publishedAt) ?? Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let timeUpdated = dateFormatter.string(from: timeDate)
        
        self.dateNewLabel.text = "Updated: " + timeUpdated
    }
    
    func displayNewsDetail(newsData: ArticlesEntity) {
        self.contentNewsView.layer.borderWidth = 0
        self.contentNewsView.layer.cornerRadius = 0
        self.imageNewsView.contentMode = .scaleToFill
        self.imageNewsView.layer.cornerRadius = 0
        self.imageNewsView.clipsToBounds = true
        self.imageNewsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.titleLabel.textAlignment = .left
        self.newsTextView.textAlignment = .left
        self.dateNewLabel.textAlignment = .left
        
        if let url = URL(string: newsData.urlToImage) {
            KingfisherManager.shared.retrieveImage(with: url) { (result) in
                switch result {
                case let .success(value):
                    self.imageNewsView.image = value.image
                    break
                default:
                    print("cannot load an image")
                }
            }
        }
        
        self.titleLabel.text = newsData.title
        self.newsTextView.text = newsData.content
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let timeDate = formatter.date(from: newsData.publishedAt) ?? Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let timeUpdated = dateFormatter.string(from: timeDate)
        
        self.dateNewLabel.text = "Updated: " + timeUpdated
    }

}
