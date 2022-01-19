//
//  File.swift
//  project 5
//
//  Created by Alexey Bondarev on 19.01.2022.
//

import UIKit

class DataService{
    static let shared = DataService()
    
    var bikes : [Bikes] = []
    
func getImageURL(name: String) -> URL?{
        let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentsDirectoryURL.appendingPathComponent(name + ".png")
        if FileManager.default.fileExists(atPath: fileURL.path) {
            print("Url = ", fileURL)
            return fileURL
        } else {
            print("Файл не найден")
            return nil
        }
    }
    
    static func loadImage(name: String) -> UIImage? {
        if let url = self.shared.getImageURL(name: name),
           let fileData = FileManager.default.contents(atPath: url.path),
           let image = UIImage(data: fileData) {
            return image
        }
        return nil
    }
    
    static func saveImageDocumentDirectory(tempImage: UIImage, name: String){
        DispatchQueue.main.async {
            let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentsDirectoryURL.appendingPathComponent(name + ".png")
            do {
                try tempImage.pngData()?.write(to: fileURL)
            } catch {
                print(error)
            }
        }
    }
    
//    static func removeDocumentDirectory(name: String){
//        DispatchQueue.main.async {
//            let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            let fileURL = documentsDirectoryURL.appendingPathComponent(name + ".png")
//            do {
//                try FileManager.default.removeItem(at: fileURL)
//                print("File REMOVED !")
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }


}
