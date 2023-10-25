//
//  UIItemTableViewCell.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 23/10/23.
//

import UIKit

class UIItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureView(item: ItemViewModel) {
        itemTitle.text = item.title
        itemImage.sd_setImage(with: URL(string: item.imageUrl), placeholderImage: UIImage(systemName: "circle.fill"))
        itemDescription.text = generateRandomParagraph()
    }
    
    func generateRandomParagraph() -> String {
        let words = ["Lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit", "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua", "Ut", "enim", "ad", "minim", "veniam", "quis", "nostrud", "exercitation", "ullamco", "laboris", "nisi", "ut", "aliquip", "ex", "ea", "commodo", "consequat", "Duis", "aute", "irure", "dolor", "in", "reprehenderit", "in", "voluptate", "velit", "esse", "cillum", "dolore", "eu", "fugiat", "nulla", "pariatur"]
        
        let paragraphLength = Int.random(in: 20...250)
        var paragraph = ""
        
        for _ in 1...paragraphLength {
            let wordIndex = Int.random(in: 0..<words.count)
            paragraph += words[wordIndex] + " "
        }
        
        return paragraph
    }
    
}
