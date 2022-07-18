//
//  ViewController.swift
//  SendClick
//
//  Created by ISAAC DAVID SANTIAGO on 10/07/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var screen: NSImageView!
    let kDelayUSec : useconds_t = 500_000

    func moveMouseClick(p: CGPoint) {

        let mouseMove = CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseDragged, mouseCursorPosition: p, mouseButton: CGMouseButton.left)
        let mouseDown = CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseDown, mouseCursorPosition: p, mouseButton: CGMouseButton.left)
        let mouseUp = CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseUp, mouseCursorPosition: p, mouseButton: CGMouseButton.left)

        mouseMove?.post(tap: CGEventTapLocation.cghidEventTap)

        usleep(kDelayUSec)
        mouseDown?.post(tap: CGEventTapLocation.cghidEventTap)

        usleep(kDelayUSec)
        mouseUp?.post(tap: CGEventTapLocation.cghidEventTap)
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


    func screenCapture(){
        var displayCount: UInt32 = 0;
            var result = CGGetActiveDisplayList(0, nil, &displayCount)
            if (result != CGError.success) {
                print("error: \(result)")
                return
            }
            let allocated = Int(displayCount)
            let activeDisplays = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: allocated)
            result = CGGetActiveDisplayList(displayCount, activeDisplays, &displayCount)
            
            if (result != CGError.success) {
                print("error: \(result)")
                return
            }
               
            let screenShot:CGImage = CGDisplayCreateImage(activeDisplays[Int(0)])!
            
            let myNsImage = NSImage(cgImage: screenShot, size: .zero)

            screen.image = myNsImage
        
    }
    
    @IBAction func sendAction(_ sender: Any) {
        print("sending click")
        
        let pointX = 300
        let pointY = 200

        let p = CGPoint(x: CGFloat(pointX), y: CGFloat(pointY))
        //moveMouseClick(p: p)
        
        screenCapture()
    }
    
    
}

