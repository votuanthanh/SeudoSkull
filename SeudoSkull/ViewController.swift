//
//  ViewController.swift
//  SeudoSkull
//
//  Created by Vo Tuan Thanh on 8/7/19.
//  Copyright © 2019 Vo Tuan Thanh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var logView: NSView!
    @IBOutlet weak var logoText: NSTextField!

    @IBOutlet weak var titleLogoText: NSTextField!
    
    @IBOutlet weak var sideBarView: NSView!
    var impactData = [ImpactData]()
    var data: [[String: String]] = [[:]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // loadData()
        // adding people
        data = [
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ],
            [
                "impact" : "1",
                "time" : "00:00:00:28"
            ]
        ]
        
        view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor.white
        
        
        sideBarView.wantsLayer = true
        sideBarView.layer?.borderWidth = 1
        sideBarView.layer?.borderColor = CGColor(red:222/255, green:225/255, blue:227/255, alpha: 1)
        
        logView.wantsLayer = true
        logView.layer?.backgroundColor = CGColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1)
        logView.layer?.cornerRadius = 10
        
        logoText.textColor = NSColor.white
        logoText.font = NSFont(name: "Roboto-Medium", size: 32)
        
        titleLogoText.textColor = NSColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1)
        titleLogoText.font = NSFont(name: "Roboto-Medium", size: 18)
        
        tableView.reloadData()
    }
    
//    override func awakeFromNib() {
//        var frame: NSRect = tableView.headerView!.frame;
//        frame.size.height = 50;
//        tableView.headerView?.frame = frame;
//    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func loadData() {
        guard let impactData1 = ImpactData(impact: 1, time: "00:00:00:28", name: "ABC") else {
            fatalError("Unable to instantiate impactData1")
        }
        
        guard let impactData2 = ImpactData(impact: 2, time: "00:00:00:28", name: "CDE") else {
            fatalError("Unable to instantiate impactData2")
        }
        
        guard let impactData3 = ImpactData(impact: 3, time: "00:00:00:28", name: "AAA") else {
            fatalError("Unable to instantiate impactData3")
        }
        
        impactData += [impactData1, impactData2, impactData3]
    }


}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return (data.count)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let person = data[row]

        if tableColumn?.identifier.rawValue == "action" {
            if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("action"), owner: self) as? CustomTableCellView {
                cell.cellDelgate = self
                cell.index = row

                return cell
            }
        } else {
            guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
            
            cell.textField?.stringValue = person[tableColumn!.identifier.rawValue]!
            
            return cell
        }
        return nil
    }
}

extension ViewController: NewNSTableView {
    func exportCSV(index: Int) {
        let savePanel = NSSavePanel()
        savePanel.allowedFileTypes = ["txt"]
        savePanel.nameFieldStringValue = "abc"
        
        savePanel.begin { (result) in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                do {
                    try "hello".write(to: savePanel.url!, atomically: false, encoding: .utf8)
                }
                catch {/* error handling here */}
            }
        }
    }
    
    
}
