//
//  ViewController.swift
//  LocalizedEditor
//
//  Created by vitotse88 on 2019/8/19.
//  Copyright © 2019 com.vito.Tool. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var swiftPaths: [String] = [String]()
    var ocPaths: [String] = [String]()
    
    var localizeInFileKeys: [FileLocalizeModel] = [FileLocalizeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func openfile(_ sender: Any) {
        self.openFolder()
        
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func openFolder() {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = true
        openPanel.canChooseFiles = false
        openPanel.begin { [unowned self] result -> Void in
            guard result.rawValue == NSApplication.ModalResponse.OK.rawValue, let url = openPanel.url else {
                return
            }
            
            
            //            self.progressIndicator.startAnimation(self)
            //            self.dataSource.load(folder: url) { [unowned self] languages, title, localizationFiles in
            //                self.reloadData(with: languages, title: title)
            //                self.progressIndicator.stopAnimation(self)
            //
            //                if let title = title {
            //                    self.delegate?.shouldSetLocalizationGroups(groups: localizationFiles)
            //                    self.delegate?.shouldSelectLocalizationGroup(title: title)
            //                }
            //            }
            
            
            self.getWholeFile(path: url.absoluteString)
            
            let data = self.loadFile(path: self.swiftPaths.first!)
            print("data - \(data)")
            
            let swiftFile = String.init(data: data, encoding: .utf8)
            
            NSLocalizedString("", comment: "")
            
            
            print("swift - \(swiftFile)")
        
        }
        
    }
    
    // 遍历文件夹文件
    func getWholeFile(path: String){
        
        let directoryURL: URL = URL(fileURLWithPath: path.replacingOccurrences(of: "file://", with: ""))
        
        var swiftFiles = 0
        var ocFiles = 0
        
        if let enumerator =
            FileManager.default.enumerator(atPath: directoryURL.path){
            for case let path as String in enumerator {
                // Skip entries with '_' prefix, for example
                if path.hasPrefix("_") {
                    enumerator.skipDescendants()
                }
                
                if path.hasSuffix(".swift") {
                    
                    swiftFiles += 1
                    print("swift file path: \(path)")
                    swiftPaths.append(directoryURL.path + "/" + path)
                }
                
                if path.hasSuffix(".m") {
                    ocFiles += 1
                    print("oc file path: \(path)")
                    
                    ocPaths.append(directoryURL.path + "/" + path)
                }
            }
        }
        
        print("swift total:\(swiftFiles)\n oc total:\(ocFiles)")

    }
    
    // 读取文件内容
    func loadFile(path: String) -> Data {
        let manager = FileManager.default
        
        let data = manager.contents(atPath:"\(path)")
        
        return data!
    }

    func findLocalizeKey(file: String) {
        
    }
    
}
