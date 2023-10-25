//
//  ItemTableViewCell.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import UIKit
import SDWebImage

class ItemTableViewCell: UITableViewCell {
    
    let margin: CGFloat = 10.0
    
    private let itemTitle: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = Colors.defaultTextColor
        label.font = Fonts.subtitle
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let itemDescription: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = Colors.defaultTextColor
        label.font = Fonts.subtitle
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let containerView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.itemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(itemTitle)
        containerView.addSubview(itemImage)
        containerView.addSubview(itemDescription)
        NSLayoutConstraint.activate([
            itemTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: margin),
            itemTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: margin),
            itemTitle.rightAnchor.constraint(equalTo: itemImage.leftAnchor, constant: -margin),
            
            itemImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: margin),
            itemImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -margin),
            itemImage.widthAnchor.constraint(equalToConstant: 50.0),
            itemImage.heightAnchor.constraint(equalToConstant: 50.0),
            
            itemDescription.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: margin),
            itemDescription.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: margin),
            itemDescription.rightAnchor.constraint(equalTo: itemImage.leftAnchor, constant: -margin),
            itemDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -margin),
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
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
