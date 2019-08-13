//
//  CustomTableCellView.swift
//  SeudoSkull
//
//  Created by Vo Tuan Thanh on 8/12/19.
//  Copyright © 2019 Vo Tuan Thanh. All rights reserved.
//

import Cocoa

protocol NewNSTableView {
    func exportCSV (index: Int)
}

class CustomTableCellView: NSTableCellView {

    @IBOutlet weak var exportButton: NSButton!
    var cellDelgate: NewNSTableView?
    var index: Int?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        exportButton.layer?.backgroundColor = CGColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1)
        exportButton.layer?.cornerRadius = 6
    }
    
    @IBAction func exportCSV(_ sender: Any) {
        cellDelgate?.exportCSV(index: self.index!)
    }
}
