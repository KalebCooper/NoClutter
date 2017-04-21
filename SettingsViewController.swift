//
//  SettingsViewController.swift
//  NoClutter
//
//  Created by Kaleb Cooper on 4/19/17.
//  Copyright © 2017 Kaleb Cooper. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {
    
    let downloadUrl = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
    
    
    //MARK: Outlets
    @IBOutlet weak var outletTargetFolder: NSPathControl!
    @IBOutlet weak var outletImages: NSButton!
    @IBOutlet weak var outletVideos: NSButton!
    @IBOutlet weak var outletAudio: NSButton!
    @IBOutlet weak var outletZip: NSButton!
    @IBOutlet weak var outletDmg: NSButton!
    @IBOutlet weak var outletDocuments: NSButton!
    @IBOutlet weak var outletDelete: NSButton!
    @IBOutlet weak var outletFrequency: NSComboBox!
    
    //MARK: Actions
    
    @IBAction func actionTargetFolder(_ sender: NSPathControl){
    }
    @IBAction func actionImages(_ sender: NSButton) {
        if(outletImages.state == NSOnState){
            setImageActive()
        }
        else{
            setImageInActive()
        }
        
    }
    @IBAction func actionVideos(_ sender: NSButton) {
    }
    @IBAction func actionAudio(_ sender: NSButton) {
    }
    @IBAction func actionZip(_ sender: NSButton) {
    }
    @IBAction func actionDmg(_ sender: NSButton) {
    }
    @IBAction func actionDocuments(_ sender: NSButton) {
    }
    @IBAction func actionDelete(_ sender: NSButton) {
    }
    @IBAction func actionFrequency(_ sender: NSComboBox) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    func setImageActive(){
        
       
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let dataPath = downloadsDirectory.appendingPathComponent("Images")
        
        do {
            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error creating directory: \(error.localizedDescription)")
        }
        
        moveImageToImages()
        

        
    }
    
    func moveImageToImages(){
        let fileManager = FileManager.default
        let downloadsDirectory = fileManager.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let imagePath = downloadsDirectory.appendingPathComponent("Images")
        // Get the document directory url
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try fileManager.contentsOfDirectory(at: downloadsDirectory, includingPropertiesForKeys: nil, options: [])
            //print(directoryContents)
            
            // if you want to filter the directory contents you can do like this:
            let pngFiles = directoryContents.filter{ $0.pathExtension == "png" }
            //print("png urls:",pngFiles)
            let pngFileNames = pngFiles.map{ $0.deletingPathExtension().lastPathComponent }
            //print("PNG list:", pngFileNames)
            
            print(imagePath)
            print(downloadsDirectory)
            
            let path = NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true)[0] as String
            let url = NSURL(fileURLWithPath: path)
            let filePath = url.appendingPathComponent(pngFileNames)?.path
            //let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath!) {
                print("FILE AVAILABLE")
            } else {
                print("FILE NOT AVAILABLE")
            }
            //try fileManager.moveItem(atPath: "/Users/Kaleb/Downloads/test.txt/", toPath: "file:///Users/Kaleb/Downloads/Images/test.txt/")
            //try fileManager.moveItem(at: <#T##URL#>, to: <#T##URL#>)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }

        
    }


    func setImageInActive(){
    
    
//        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
//        let dataPath = downloadsDirectory.appendingPathComponent("Images")
//    
//        do {
//            try FileManager.default.removeDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//        } catch let error as NSError {
//        print("Error creating directory: \(error.localizedDescription)")
//        }
    }
}

