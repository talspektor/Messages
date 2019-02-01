//
//  TableViewCell.swift
//  Messages
//
//  Created by user140592 on 1/28/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    var leadingConstriant:NSLayoutConstraint!
    var trailingConstraint:NSLayoutConstraint!

    let messageLable = UILabel()
    let bubbleBackgroundView = UIView()
    var isIncoming:Bool!
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLable.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLable.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstriant.isActive = true
                trailingConstraint.isActive = false
            }else {
                leadingConstriant.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLable)
        messageLable.text = "Test sdfg shst h shjyjytdjytjf sr tsrrsrt j fj djd dgj df  yjsf jsfh sfrj dyfjf  ery jdfjf dg   trhrsttrshtsrtjr   rjjyjydjy"
        messageLable.numberOfLines = 0
        messageLable.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints for label
        messageLable.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        messageLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        messageLable.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        bubbleBackgroundView.topAnchor.constraint(equalTo: messageLable.topAnchor, constant: -16).isActive = true
        bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLable.leadingAnchor, constant: -16).isActive = true
        bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLable.bottomAnchor, constant: 16).isActive = true
        bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLable.trailingAnchor, constant: 16).isActive = true

        leadingConstriant = messageLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstriant.isActive = false
        
        trailingConstraint = messageLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
