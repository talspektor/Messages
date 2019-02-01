//
//  ViewController.swift
//  Messages
//
//  Created by user140592 on 1/28/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateForCustomString(customString: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy"
        return dateFormatter.date(from: "10/31/2018") ?? Date()
        
    }
}
class ViewController: UITableViewController {

    private let cellId = "Id"
    
//    let chatMessages = [
//        [
//            ChatMessage(text: "dsfgfdg sdfhgh dgg ethdf sg dfh", isIncoming: true, date: Date.dateForCustomString(customString: "08/03/2018")),
//            ChatMessage(text: "shfsf fsjy io; sdugk t fweew i;oo wefsws true", isIncoming: true, date: Date.dateForCustomString(customString: "08/03/2018"))
//
//        ],
//        [
//                    ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlbl", isIncoming: true, date: Date.dateForCustomString(customString: "08/03/2018")),
//                    ChatMessage(text: "sulg glgil gluluig gliugi giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyug", isIncoming: true, date: Date.dateForCustomString(customString: "08/03/2018")),
//
//                    ChatMessage(text: "giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyug", isIncoming: false, date: Date()),
//                    ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd", isIncoming: false, date: Date()),
//                    ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd", isIncoming: false, date: Date()),
//                    ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd sdgdfh dhtsdgh stfhg strhjs", isIncoming: true, date: Date())
//        ],
//        [
//            ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlbl", isIncoming: true, date: Date()),
//            ChatMessage(text: "sulg glgil gluluig gliugi giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyug", isIncoming: true, date: Date()),
//
//            ChatMessage(text: "giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyug", isIncoming: false, date: Date()),
//            ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd", isIncoming: false, date: Date()),
//            ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd", isIncoming: false, date: Date()),
//            ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd sdgdfh dhtsdgh stfhg strhjs", isIncoming: true, date: Date())
//        ]
//    ]

    let messagesFromServer = [ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlbl", isIncoming: true, date: Date()),
                              ChatMessage(text: "sulg glgil gluluig gliugi giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyug", isIncoming: true, date: Date()),
                              
                              ChatMessage(text: "giugui gykuyugsdgdf,jdsh hrgdlugh lugerluagui lugulg glgil gluluig gliugi giugui gykuyug", isIncoming: false, date: Date()),
                              ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd", isIncoming: false, date: Date()),
                              ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd", isIncoming: false, date: Date()),
                              ChatMessage(text: "fdhjhjfd jjjl kjkjl lhlblsdg st h thsd sdgdfh dhtsdgh stfhg strhjs", isIncoming: true, date: Date()),
                              ChatMessage(text: "dsfgfdg sdfhgh dgg ethdf sg dfh", isIncoming: true, date: Date.dateForCustomString(customString: "08/03/2018")),
                              ChatMessage(text: "shfsf fsjy io; sdugk t fweew i;oo wefsws true", isIncoming: true, date: Date.dateForCustomString(customString: "08/03/2018"))
    ]
    var chatMessages = [[ChatMessage]]()
    
    private func attemptTpAssambleMessages() {
        
        //
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        //provide a sorting for the keys
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptTpAssambleMessages()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20 , height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstmessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyy"
            let dateString = dateFormatter.string(from: firstmessageInSection.date)
            
            let labed = DateHeaderLabel()
            
            labed.text = dateString
            
            let containerView = UIView()
            
            containerView.addSubview(labed)
            labed.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
            labed.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
            
            return containerView
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

//
//        return "Section: \(Date())"
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell

        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.messageLable.text = chatMessage.text
        
        cell.chatMessage = chatMessage
        
        return cell
    }
    
    


}

