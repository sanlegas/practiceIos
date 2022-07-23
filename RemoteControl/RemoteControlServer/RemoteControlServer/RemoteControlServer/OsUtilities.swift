//
//  OsUtilities.swift
//  RemoteControlServer
//
//  Created by ISAAC DAVID SANTIAGO on 19/07/22.
//

import Foundation
import Cocoa
import SwiftUI

class OsUtilities {
    let kDelayUSec : useconds_t = 500_000
    let scale: Int = 2
    
    func moveMouseClick(x:Int, y: Int) {
        let p = CGPoint(x:CGFloat(x * scale),y:CGFloat(y * scale))
        
        let mouseMove = CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseDragged, mouseCursorPosition: p, mouseButton: CGMouseButton.left)
        let mouseDown = CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseDown, mouseCursorPosition: p, mouseButton: CGMouseButton.left)
        let mouseUp = CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseUp, mouseCursorPosition: p, mouseButton: CGMouseButton.left)

        mouseMove?.post(tap: CGEventTapLocation.cghidEventTap)
        usleep(kDelayUSec)
        mouseDown?.post(tap: CGEventTapLocation.cghidEventTap)
        usleep(kDelayUSec)
        mouseUp?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    func resize(image: NSImage,scale: Int) -> NSImage {
        let w = CGFloat(image.size.width / CGFloat(scale))
        let h = CGFloat(image.size.height / CGFloat(scale))
        
        var destSize = NSMakeSize(w,h)
    
        var newImage = NSImage(size: destSize)
        newImage.lockFocus()
        image.draw(in: NSMakeRect(0, 0, destSize.width, destSize.height), from: NSMakeRect(0, 0, image.size.width, image.size.height), operation: NSCompositingOperation.sourceOver, fraction: CGFloat(1))
        newImage.unlockFocus()
        newImage.size = destSize
        return NSImage(data: newImage.tiffRepresentation!)!
    }
    
    func jpegDataFrom(image:NSImage) -> Data {
            let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
            let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
            let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
            return jpegData
        }
    
    func screenCapture() -> Data?{
        var displayCount: UInt32 = 0;
            var result = CGGetActiveDisplayList(0, nil, &displayCount)
            if (result != CGError.success) {
                print("error: \(result)")
                return nil
            }
            let allocated = Int(displayCount)
            let activeDisplays = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: allocated)
            result = CGGetActiveDisplayList(displayCount, activeDisplays, &displayCount)
            
            if (result != CGError.success) {
                print("error: \(result)")
                return nil
            }
               
            let screenShot:CGImage = CGDisplayCreateImage(activeDisplays[Int(0)])!
            var myNsImage = NSImage(cgImage: screenShot, size: .zero)
            myNsImage = myNsImage.compressUnderMegaBytes(megabytes:1)!
            myNsImage = resize(image: myNsImage, scale: self.scale)
          
            return jpegDataFrom(image: myNsImage)
    }

    
}

extension NSImage {
    func compressUnderMegaBytes(megabytes: CGFloat) -> NSImage? {

        var compressionRatio = 1.0
        guard let tiff = self.tiffRepresentation, let imageRep = NSBitmapImageRep(data: tiff) else { return nil }
        var compressedData = imageRep.representation(using: .jpeg, properties: [.compressionFactor : compressionRatio])
        if compressedData == nil { return self }
        while CGFloat(compressedData!.count) > megabytes * 1024 * 1024 {
            compressionRatio = compressionRatio * 0.9
            let newCompressedData = imageRep.representation(using: .png, properties:  [.compressionFactor : compressionRatio])
            if compressionRatio <= 0.4 || newCompressedData == nil {
                break
            }
            compressedData = newCompressedData
        }
        return NSImage(data: compressedData!)
    }
}
