//
//  WindowController.swift
//  LocalizationEditor
//
//  Created by Igor Kulman on 05/03/2019.
//  Copyright © 2019 Igor Kulman. All rights reserved.
//

import Cocoa

/**
Protocol for announcing user interaction with the toolbar
 */
protocol WindowControllerToolbarDelegate: AnyObject {
    /**
     Invoked when user requests opening a folder
     */
    func userDidRequestFolderOpen()

}

final class WindowController: NSWindowController {

    // MARK: - Outlets

    @IBOutlet private weak var openButton: NSToolbarItem!
//    @IBOutlet private weak var searchField: NSSearchField!
//    @IBOutlet private weak var selectButton: NSPopUpButton!
//    @IBOutlet private weak var filterButton: NSPopUpButton!
//    @IBOutlet private weak var newButton: NSToolbarItem!

    // MARK: - Properties

    weak var delegate: WindowControllerToolbarDelegate?

    override func windowDidLoad() {
        super.windowDidLoad()

//        setupUI()
//        setupSearch()
//        setupFilter()
//        setupMenu()
//        setupDelegates()
    }

    // MARK: - Setup

    private func setupDelegates() {
        guard let contentViewController = window?.contentViewController, let mainViewController = contentViewController as? ViewController else {
            fatalError("Broken window hierarchy")
        }

//        // informing the window about toolbar appearence
//        mainViewController.delegate = self
//
//        // informing the VC about user interacting with the toolbar
//        self.delegate = mainViewController
    }

    private func setupUI() {
        openButton.image = NSImage(named: NSImage.folderName)
        openButton.toolTip = "Open folder"
//        filterButton.toolTip = "Filter"
//        selectButton.toolTip = "String table"
//        newButton.toolTip = "New translation"
    }

//    private func setupMenu() {
//        let appDelegate = NSApplication.shared.delegate as! AppDelegate
//        appDelegate.openFolderMenuItem.action = #selector(WindowController.openAction(sender:))
//    }
//
//    private func setupSearch() {
//        searchField.delegate = self
//        searchField.stringValue = ""
//
//        _ = searchField.resignFirstResponder()
//    }
//
//    private func setupFilter() {
//        filterButton.menu?.removeAllItems()
//
//        for option in Filter.allCases {
//            let item = NSMenuItem(title: "\(option)".capitalizedFirstLetter, action: #selector(WindowController.filterAction(sender:)), keyEquivalent: "")
//            item.tag = option.rawValue
//            filterButton.menu?.addItem(item)
//        }
//    }
//
//    private func enableControls() {
//        searchField.isEnabled = true
//        filterButton.isEnabled = true
//        selectButton.isEnabled = true
//        newButton.isEnabled = true
//    }
//
//    // MARK: - Actions
//
//    @objc private func selectAction(sender: NSMenuItem) {
//        let groupName = sender.title
//        delegate?.userDidRequestLocalizationGroupChange(group: groupName)
//    }
//
//    @objc private func filterAction(sender: NSMenuItem) {
//        guard let filter = Filter(rawValue: sender.tag) else {
//            return
//        }
//
//        delegate?.userDidRequestFilterChange(filter: filter)
//    }
//
//    @IBAction private func openFolder(_ sender: Any) {
//        delegate?.userDidRequestFolderOpen()
//    }
//
//    @IBAction private func addAction(_ sender: Any) {
//        guard newButton.isEnabled else {
//            return
//        }
//
//        delegate?.userDidRequestAddNewTranslation()
//    }
//
//    @objc private func openAction(sender _: NSMenuItem) {
//       delegate?.userDidRequestFolderOpen()
//    }
}


