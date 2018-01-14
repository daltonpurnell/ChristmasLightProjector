//
//  ViewController.swift
//  DrawPad
//
//  Created by Jean-Pierre Distler on 13.11.14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit
import CoreBluetooth


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CBCentralManagerDelegate, CBPeripheralDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let kSettingsSegueId = "showSettings"
    let kColorsSegueId = "showColors"
    let kShapesSegueId = "showShapes"
    let kShowWaitingSegueId = "showWaitingVC"
    let kOptionsSegueId = "showOptions"
    
    let kSnowFlake =  "Snow Flake"
    let kStar = "Star"
    let kCandyCane = "Candy Cane"
    let kCircle = "Circle"
    let kHolly = "Holly"
    let kTree = "Tree"
    let kDeer = "Deer"
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var bluetoothSetupView: UIView!
    @IBOutlet weak var btInstructionsLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var skipSetupButton: UIButton!
    @IBOutlet weak var btImageView: UIImageView!
    @IBOutlet weak var btTableView: UITableView!
    
    
    
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var strokeButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var startOverButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
    @IBOutlet weak var shapeButton: UIButton!
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var lineButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var uploadImageButton: UIButton!
    
    var counter: Int = 0
    var snowFlakeCounter: Int = 0
    var candyCaneCounter: Int = 0
    var starCounter: Int = 0
    var circleCounter: Int = 0
    var hollyCounter: Int = 0
    var treeCounter: Int = 0
    var deerCounter: Int = 0
    var pointCounter: Int = 0
    var isRandomColor = false
    var lastPoint = CGPoint.zero
    var firstLinePoint = CGPoint.zero
    var secondLinePoint = CGPoint.zero
    
    var pointA = CGPoint.zero
    var pointB = CGPoint.zero

    var red: CGFloat = 234.0/255.0
    var green: CGFloat = 13.0/255.0
    var blue: CGFloat = 43.0/255.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    var pencilSelected = true
    var lineSelected = false
    var shapeSelected = false
    
    var selectedShape = "Star"
    var linePoints: [NSValue] = []

    
    let colors: [(CGFloat, CGFloat, CGFloat)] = [
        (1.0, 1.0, 1.0)
        ]
    
    var images: [UIImage] = []
    
    var pickerController = UIImagePickerController()
    
    var centralManager:CBCentralManager!
    var sensorTag:CBPeripheral?
    var keepScanning = true
    var isConnected = false
    var isOn = true
    var peripherals:[CBPeripheral] = []
    var connectedDeviceName = ""
    
    let sensorTagName = "CC2650 SensorTag"
    
    override func viewDidLoad() {
        counter = 0
        snowFlakeCounter = 0
        candyCaneCounter = 0
        starCounter = 0
        circleCounter = 0
        treeCounter = 0
        hollyCounter = 0
        deerCounter = 0
        pointCounter = 0

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerController.delegate = self
        btTableView.delegate = self
        btTableView.dataSource = self
        
        
        checkForDeviceAndSetupImages()
        
        
        eraserButton.isEnabled = false
        colorButton.setImage(UIImage(named:"color-red"), for: .normal)
        
        blurView.alpha = 0.0
        bluetoothSetupView.alpha = 0.0
        bluetoothSetupView.layer.cornerRadius = 10
        bluetoothSetupView.layer.shadowOpacity = 0.6
        bluetoothSetupView.layer.shadowRadius = 4

        centralManager = CBCentralManager(delegate: self,
                                          queue: nil)
        
        if !isConnected {
            showbtSetupView()
            toggleTryAgain(on: false)
            spinner.isHidden = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleToolBar(enabled: Bool) {
        submitButton.isHidden = !enabled
        startOverButton.isHidden = !enabled
        strokeButton.isHidden = !enabled
        colorButton.isHidden = !enabled
        clearButton.isHidden = !enabled
        shapeButton.isHidden = !enabled
        lineButton.isHidden = !enabled
        pencilButton.isHidden = !enabled
        eraserButton.isHidden = !enabled
        
        lineButton.setImage(UIImage(named:"line"), for: .normal)
        pencilButton.setImage(UIImage(named:"stroke"), for: .normal)
        shapeButton.setImage(UIImage(named:"star"), for: .normal)
        
        mainImageView.isHidden = !enabled
        tempImageView.isHidden = !enabled
        
        uploadImageButton.isHidden = enabled
        
        if !enabled {
            instructionsLabel.text = "Tap the house to upload an image of your house.\nFor best results, take photo from viewpoint of projector"
        } else {
            instructionsLabel.text = "Use the toolbar to draw your lights onto your house."
            submitButton.backgroundColor = UIColor(red: 254/255, green:254/255, blue: 205/255, alpha: 1.0)
//            startOverButton.tintColor = UIColor(red: 254/255, green:254/255, blue: 205/255, alpha: 1.0)
            startOverButton.titleLabel?.textColor = UIColor(red: 254/255, green:254/255, blue: 205/255, alpha: 1.0)
        }
    }
    
    
    // MARK: - Camera
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            pickerController.delegate = self
            self.pickerController.sourceType = UIImagePickerControllerSourceType.camera
            pickerController.allowsEditing = true
            self .present(self.pickerController, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController.init(title: "Warning", message: "No camera available", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            pickerController.allowsEditing = true
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        houseImageView.contentMode = .scaleAspectFill
        let image: UIImage = (info[UIImagePickerControllerEditedImage] as? UIImage)!
        houseImageView.image = image
        toggleToolBar(enabled: true)
        eraserButton.isEnabled = false
        pencilSelected = true
        lineSelected = false
        shapeSelected = false
        pencilButton.setImage(UIImage(named: "pencilSelected"), for: .normal)
        dismiss(animated:true, completion: nil)
    }
    
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancel")
        dismiss(animated:true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func shapeButtonTapped(_ sender: Any) {
        shapeSelected = true
        shapeButton.setImage(UIImage(named:"starSelected"), for: .normal)
        lineSelected = false
        lineButton.setImage(UIImage(named:"line"), for: .normal)
        pencilSelected = false
        pencilButton.setImage(UIImage(named:"stroke"), for: .normal)
    }
    @IBAction func pencilButtonTapped(_ sender: Any) {
        pencilSelected = true
        pencilButton.setImage(UIImage(named:"pencilSelected"), for: .normal)
        lineSelected = false
        lineButton.setImage(UIImage(named:"line"), for: .normal)
        shapeSelected = false
        shapeButton.setImage(UIImage(named:"star"), for: .normal)
    }
    @IBAction func lineButtonTapped(_ sender: Any) {
        
        self.lineSelected = true
        self.lineButton.setImage(UIImage(named:"lineSelected"), for: .normal)
        self.pencilSelected = false
        self.pencilButton.setImage(UIImage(named:"stroke"), for: .normal)
        self.shapeSelected = false
        self.shapeButton.setImage(UIImage(named:"star"), for: .normal)
        
        let alert = UIAlertController.init(title: "Straight Line", message: "Tap 2 different points on the screen to set the starting and ending point of each straight line.", preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (okAction) in }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func startOverButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController.init(title: "Start Over?", message: "Are you sure you want to start over? Your photo and drawing will both be erased. This cannot be undone.", preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (okAction) in
            self.houseImageView.contentMode = .center
            let image: UIImage = UIImage.init(named: "house.png")!
            self.houseImageView.image = image
            self.mainImageView.image = nil
            self.toggleToolBar(enabled: false)
            if !self.connectedDeviceName.isEmpty {
                if let images = UserDefaults.standard.object(forKey: self.connectedDeviceName) {
                    UserDefaults.standard.removeObject(forKey: self.connectedDeviceName)
                }
            }
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func uploadImageButtonTapped(_ sender: Any) {
        let alertViewController = UIAlertController(title: "", message: "Choose your option", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default, handler: { (alert) in
            self.openCamera()
        })
        let gallery = UIAlertAction(title: "Gallery", style: .default) { (alert) in
            self.openGallery()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            
        }
        alertViewController.addAction(camera)
        alertViewController.addAction(gallery)
        alertViewController.addAction(cancel)
        self.present(alertViewController, animated: true, completion: nil)
    }

    
    @IBAction func reset(_ sender: AnyObject) {
        
        let alert = UIAlertController.init(title: "Delete?", message: "Are you sure you want to delete your drawing? Your photo will remain, but your drawing will be erased. This cannot be undone.", preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (okAction) in
            self.images.removeAll()
            self.eraserButton.isEnabled = false
            self.mainImageView.image = nil
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func saveAndSendToProjector(_ sender: AnyObject) {
        UIGraphicsBeginImageContext(contentView.bounds.size)
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
//            let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
//            present(activity, animated: true, completion: nil)
            if !isConnected {
                let alert = UIAlertController.init(title: "Oops!", message: "You must be connected to your device", preferredStyle: .alert)
                let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            } else {
                let houseImage = houseImageView.image
                let houseImageDataString:String = convertImageToBase64(image: houseImage!)
                let mainImageDataString:String = convertImageToBase64(image: image)
                let imagesArray:[String] = [houseImageDataString, mainImageDataString]
                let commaSeparatedString:String = imagesArray.joined(separator:",")
                saveToDefaults(key: connectedDeviceName, value: commaSeparatedString)
                performSegue(withIdentifier: kShowWaitingSegueId, sender: self)
            }
        }
    }
    
    @IBAction func undoPressed(_ sender: AnyObject) {
        
        if images.count >= 2 {
            mainImageView.image = images[images.count - 2]
            images.removeLast()
        } else if images.count == 1 {
            mainImageView.image = nil
            images.removeAll()
        }
    }
    
    
    // MARK: - User Defaults
    func saveToDefaults(key:String, value: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func retrieveFromDefaults(key:String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    // MARK: - Image Conversion
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)
        let base64String = imageData?.base64EncodedString()
        
        return base64String!
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        let decodedData = NSData(base64Encoded: base64String, options: NSData.Base64DecodingOptions(rawValue: 0) )
        let decodedimage = UIImage(data: decodedData! as Data)
        
        return decodedimage!
    }
    
    // MARK: - Drawing
    
    func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
    }
    
    func getNextPoint(startPoint : CGPoint, endPoint : CGPoint, value: CGFloat) -> CGPoint {
        
        // calculate the radians
        let radians: CGFloat = atan2(endPoint.y - startPoint.y, endPoint.x - startPoint.x)
        //Then get the coordinates
        let x: CGFloat = startPoint.x + value * cos(radians)
        let y: CGFloat = startPoint.y + value * sin(radians)
        let nextPoint:CGPoint = CGPoint(x:x, y: y)

        return nextPoint
    }

    
    func drawShape(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(contentView.frame.size)
        
        let center = toPoint;
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        
        ctx.beginPath()
        ctx.setLineWidth(brushWidth)
        
        if selectedShape == kCircle {
            
            drawCircle(center: center, ctx:ctx)
            
        } else if selectedShape == kStar {
            
            drawStar(center: center, ctx:ctx)
            
        } else if selectedShape == kCandyCane {
            
            drawCandyCane(center: center)
            
        } else if selectedShape == kSnowFlake {
            
            drawSnowFlake(center: center)

        } else if selectedShape == kHolly {
            
            drawHolly(center: center)
            
        } else if selectedShape == kTree {
            
            drawTree(center:center)
            
        } else if selectedShape == kDeer {
            
            drawDeer(center:center)

        }
        
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    
    func drawPencilLine(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(contentView.frame.size)
        
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))

        let path = UIBezierPath()
        path.move(to: fromPoint)
        path.addLine(to: toPoint)
        path.lineWidth = brushWidth
        
        let dashes: [CGFloat] = [0, path.lineWidth * 4]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        path.lineCapStyle = CGLineCap.round
        
        var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)

        if isRandomColor {
            
            if counter >= 4 {
                counter = 0
            } else {
                counter += 1
            }
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            let randomColor: (CGFloat, CGFloat, CGFloat) = colors[counter]
                
            var redd: CGFloat = 1.0
            var greenn: CGFloat = 1.0
            var bluee: CGFloat = 0.0
            
            (redd, greenn, bluee) = randomColor
            color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
        }
        color.setStroke()
        path.stroke()
        
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    
    func drawStraightLine(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(contentView.frame.size)
        
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        
        if isRandomColor {
            
            let colors: [(CGFloat, CGFloat, CGFloat)] = [
                (234.0/255.0, 13.0/255.0, 43.0/255.0),
                (34.0/255.0, 84.0/255.0, 251.0/255.0),
                (60.0/255.0, 218.0/255.0, 34.0/255.0),
                (242.0/255.0, 175.0/255.0, 35.0/255.0),
                (255.0/255.0, 254.0/255.0, 208.0/255.0),
                ]
            
            var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            
            let value = brushWidth * 2
            let dist = distance(fromPoint, toPoint)
            let numberOfSegments = Int(floor(dist / value)) // number of segments to render
            
            let nextPoint = getNextPoint(startPoint: fromPoint, endPoint: toPoint, value: value)
//            let filteredPoints = stride(from:0, to: points.count, by: (numberOfSegments)).map { points[$0] }
            
            pointA = fromPoint
            pointB = nextPoint
            
//            let values:[CGFloat] = Array(repeating: value, count: numberOfSegments)
//            var cumulativeValue:CGFloat = 0 // store a cumulative value in order to start each line after the last one
            for i in 0..<numberOfSegments {
                
                if counter >= 4 {
                    counter = 0
                } else {
                    counter += 1
                }
                
                let randomColor: (CGFloat, CGFloat, CGFloat) = colors[counter]
                
                var redd: CGFloat = 1.0
                var greenn: CGFloat = 1.0
                var bluee: CGFloat = 0.0
                
                (redd, greenn, bluee) = randomColor
                color = UIColor(red: redd, green: greenn, blue: bluee, alpha: 1.0)
                
                let path = UIBezierPath()
                path.move(to: pointA)
                path.addLine(to: pointB)
                path.lineWidth = brushWidth
                
                let dashes: [CGFloat] = [0, path.lineWidth * 2]
                path.setLineDash(dashes, count: dashes.count, phase: 0)
                path.lineCapStyle = CGLineCap.round
                
                color.setStroke()
                path.stroke()
                
                pointA = pointB
                pointB = getNextPoint(startPoint: pointA, endPoint: toPoint, value: value)
            }
        } else {
            let path = UIBezierPath()
            path.move(to: fromPoint)
            path.addLine(to: toPoint)
            path.lineWidth = brushWidth
            
            let dashes: [CGFloat] = [0, path.lineWidth * 2]
            path.setLineDash(dashes, count: dashes.count, phase: 0)
            path.lineCapStyle = CGLineCap.round
            
            var color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            
            color.setStroke()
            path.stroke()
        }

        
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: contentView)
            
            if shapeSelected {
                drawShape(fromPoint: lastPoint, toPoint: lastPoint)
            }
        }
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: contentView)
            
            let distance = sqrtf(powf((Float(lastPoint.x - currentPoint.x)), 2) + powf((Float(lastPoint.y - currentPoint.y)), 2));
            if (distance > 20) // TODO: define magic number after some testing
            {
                if pencilSelected {
                    drawPencilLine(fromPoint: lastPoint, toPoint: currentPoint)
    //            } else if lineSelected {
    //                drawStraightLine(fromPoint: lastPoint, toPoint: currentPoint)
                } else if shapeSelected {
                    drawShape(fromPoint: lastPoint, toPoint: currentPoint)
                }
                lastPoint = currentPoint
            }

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            
            if lineSelected {
                if pointCounter >= 2 {
                    pointCounter = 1
                } else {
                    pointCounter += 1
                }
                
                if pointCounter == 1 {
                    firstLinePoint = (touches.first?.location(in: contentView))!
                } else if pointCounter == 2 {
                    secondLinePoint = (touches.first?.location(in: contentView))!
                    drawStraightLine(fromPoint: firstLinePoint, toPoint: secondLinePoint)
                }
            } else {
                let currentPoint = touches.first?.location(in: contentView)
                let distance = sqrtf(powf((Float(lastPoint.x - (currentPoint?.x)!)), 2) + powf((Float(lastPoint.y - (currentPoint?.y)!)), 2));
                
                if (distance > 20) // TODO: define magic number after some testing
                {
                    if pencilSelected {
                        drawPencilLine(fromPoint: lastPoint, toPoint: lastPoint)
                        //                } else if lineSelected {
                        //                    drawStraightLine(fromPoint: lastPoint, toPoint: lastPoint)
                    }  else if shapeSelected {
                        drawShape(fromPoint: lastPoint, toPoint: lastPoint)
                    }
                }
            }
            
        }
        
        UIGraphicsBeginImageContext(contentView.frame.size)
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height), blendMode: .normal, alpha: 1.0)
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height), blendMode: .normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        images.append(mainImageView.image!)
        eraserButton.isEnabled = true
        tempImageView.image = nil
    }
    
    
    
    // MARK: - BLE stuff
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        var message = ""
        
        switch central.state {
        case .poweredOff:
            message = "Bluetooth on this device is currently powered off."
            spinner.isHidden = true
            toggleTryAgain(on: true)
        case .unsupported:
            message = "This device does not support Bluetooth Low Energy."
            spinner.isHidden = true
            toggleTryAgain(on: true)
        case .unauthorized:
            message = "This app is not authorized to use Bluetooth Low Energy."
            spinner.isHidden = true
            toggleTryAgain(on: true)
        case .resetting:
            message = "The Bluetooth LE Manager is resetting; a state update is pending."
            spinner.isHidden = true
            toggleTryAgain(on: true)
        case .unknown:
            message = "The state of the Bluetooth LE Manager is unknown."
            spinner.isHidden = true
            toggleTryAgain(on: true)
        case .poweredOn:
            message = "Bluetooth LE is turned on and ready for communication.\n\nSearching for device..."
            
            print(message)
            keepScanning = true
            
            // Initiate Scan for Peripherals
            //Option 1: Scan for all devices
            centralManager.scanForPeripherals(withServices: nil, options: nil)
            
            // Option 2: Scan for devices that have the service you're interested in...
            //let sensorTagAdvertisingUUID = CBUUID(string: Device.SensorTagAdvertisingUUID)
            //print("Scanning for SensorTag advertising with UUID: \(sensorTagAdvertisingUUID)")
            //centralManager.scanForPeripheralsWithServices([sensorTagAdvertisingUUID], options: nil)
            
            let when = DispatchTime.now() + 2 // change to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.pauseScan()
            }
            
        }
        btInstructionsLabel.text = message
        
    }
    
    func pauseScan() {
        // Scanning uses up battery on phone, so pause the scan process for the designated interval.
        print("*** PAUSING SCAN...")
        let when = DispatchTime.now() + 2 // change to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            self.resumeScan()
        }
        centralManager.stopScan()
    }
    
    func resumeScan() {
        if keepScanning {
            // Start scanning again...
            print("*** RESUMING SCAN!")
            let when = DispatchTime.now() + 2 // change to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.pauseScan()
            }
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            //            disconnectButton.enabled = true
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("centralManager didDiscoverPeripheral - CBAdvertisementDataLocalNameKey is \"\(CBAdvertisementDataLocalNameKey)\"")
        
        
        
        // Retrieve the peripheral name from the advertisement data using the "kCBAdvDataLocalName" key
        if let peripheralName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
//            print("NEXT PERIPHERAL NAME: \(peripheral)")
            if !peripherals.contains(peripheral) {
                peripherals.append(peripheral)
            }
            toggleTableView(show: true)
            btTableView.reloadData()
            
            print("NEXT PERIPHERAL UUID: \(peripheral.identifier.uuidString)")
            btInstructionsLabel.text = "Choose a device to connect to"
            //            if peripheralName == sensorTagName {
//            print("SENSOR TAG FOUND! ADDING NOW!!!")
            // to save power, stop scanning for other devices
            keepScanning = false
            //                disconnectButton.enabled = true
            //            }
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        spinner.isHidden = true
        skipSetupButton.setTitle("NEXT", for: .normal)
        btImageView.image = UIImage(named: "check-mark")
        isConnected = true
        connectedDeviceName = peripheral.name!
        btInstructionsLabel.text = "Connected to \(connectedDeviceName)"
        checkForDeviceAndSetupImages()
        // uncomment discoverServices when we know what services to look for
        //        peripheral.discoverServices(nil)
        
    }
    
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        btInstructionsLabel.text = "Could not connect to device."
        toggleTryAgain(on: true)
        spinner.isHidden = true
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if error != nil {
            print("ERROR DISCOVERING SERVICES: \(String(describing: error?.localizedDescription))")
            return
        }
        
        // Core Bluetooth creates an array of CBService objects —- one for each service that is discovered on the peripheral.
        if let services = peripheral.services {
            for service in services {
                print("Discovered service \(String(describing: service.uuid))")
                //                 If we found either the temperature or the humidity service, discover the characteristics for those services.
                //                if (service.UUID == CBUUID(string: UIDevice.TemperatureServiceUUID)) ||
                //                    (service.UUID == CBUUID(string: UIDevice.HumidityServiceUUID)) {
                peripheral.discoverCharacteristics(nil, for: service)
                //                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if error != nil {
            print("ERROR DISCOVERING CHARACTERISTICS: \(String(describing: error?.localizedDescription))")
            return
        }
        
        if let characteristics = service.characteristics {
            //            var enableValue:UInt8 = 1
            //            let enableBytes = NSData(bytes: &enableValue, length: MemoryLayout<UInt8>.size)
            for characteristic in characteristics {
                print("characteristic: \(characteristic)")
                //                btInstructionsLabel.text?.append("\n\(characteristic.uuid)")
            }
        }
    }
    
    func disconnect() {
        if let sensorTag = self.sensorTag {
            
            /*
             NOTE: The cancelPeripheralConnection: method is nonblocking, and any CBPeripheral class commands
             that are still pending to the peripheral you’re trying to disconnect may or may not finish executing.
             Because other apps may still have a connection to the peripheral, canceling a local connection
             does not guarantee that the underlying physical link is immediately disconnected.
             
             From your app’s perspective, however, the peripheral is considered disconnected, and the central manager
             object calls the centralManager:didDisconnectPeripheral:error: method of its delegate object.
             */
            centralManager.cancelPeripheralConnection(sensorTag)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("**** DISCONNECTED FROM SENSOR TAG!!!")
        skipSetupButton.setTitle("OK", for: .normal)
        spinner.isHidden = true
        btInstructionsLabel.text = "Disconnected"
        btImageView.image = UIImage(named: "check-mark")
        isConnected = false
        if error != nil {
            print("****** DISCONNECTION DETAILS: \(error!.localizedDescription)")
        }
        sensorTag = nil
    }
    
    // MARK: - tableView delegate & datasource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toggleTableView(show: false)
        btImageView.image = UIImage(named: "connecting")

        // save a reference to the sensor tag
        sensorTag = peripherals[indexPath.row]
        sensorTag!.delegate = self
        // Request a connection to the peripheral
        centralManager.connect(sensorTag!, options: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = peripherals[indexPath.row].name
        cell.backgroundColor = .clear
        return cell
    }
    
    
    // MARK: - naviation & custom views
    
    func showMainVC() {
        keepScanning = false
        centralManager.stopScan()
        hidebtSetupView()
    }
    
    @IBAction func skipSetupButtonTapped(_ sender: Any) {
        showMainVC()
    }
    
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
//        toggleTryAgain(on: false)
//        resumeScan()
        viewDidLoad()
//        btInstructionsLabel.text = "Bluetooth LE is turned on and ready for communication.\n\nSearching for device..."
    }
    
    
    func checkForDeviceAndSetupImages() {
        
        houseImageView.contentMode = .center
        var houseImage: UIImage = UIImage.init(named: "house.png")!
        houseImageView.image = houseImage
        toggleToolBar(enabled: false)
        
        if !connectedDeviceName.isEmpty {
            if let savedImages: String = retrieveFromDefaults(key: connectedDeviceName) as? String {
                let savedImagesArray:[String] = savedImages.components(separatedBy: ",")
                houseImage = convertBase64ToImage(base64String: savedImagesArray[0])
                let mainImage:UIImage = convertBase64ToImage(base64String: savedImagesArray[1])
                houseImageView.image = houseImage
                houseImageView.contentMode = .scaleAspectFill
                mainImageView.image = mainImage
                tempImageView.image = mainImage
                toggleToolBar(enabled: true)
            } else {
                print("NO SAVED IMAGES")
            }
        } else {
            print("NO CONNECTED DEVICE")
        }
    }
    
    func toggleTryAgain(on: Bool) {
        if on {
            tryAgainButton.isHidden = false
            btImageView.image = UIImage(named: "offline")
            
        } else {
            tryAgainButton.isHidden = true
            btImageView.image = UIImage(named: "magnifying-glass")
        }
    }
    
    func toggleTableView(show: Bool) {
        btTableView.isHidden = !show
        btImageView.isHidden = show
        btTableView.backgroundColor = .clear
        btTableView.separatorStyle = .none
        
    }
    
    
    func hidebtSetupView() {

        blurView.alpha = 1.0
        bluetoothSetupView.alpha = 1.0
        spinner.isHidden = true
        
        // fade out
        UIView.animate(withDuration: 0.2, animations: {
            self.blurView.alpha = 0.0
            self.bluetoothSetupView.alpha = 0.0
        })
        
//        bluetoothSetupView.isHidden = true
//        blurView.isHidden = true
    }
    
    func showbtSetupView() {
        btTableView.isHidden = true
        spinner.isHidden = false
        skipSetupButton.setTitle("SKIP SETUP", for: .normal)
        blurView.alpha = 0.0
        bluetoothSetupView.alpha = 0.0
        
        // fade in
        UIView.animate(withDuration: 0.2, animations: {
            self.blurView.alpha = 1.0
            self.bluetoothSetupView.alpha = 1.0
        })
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == kSettingsSegueId  {
            let settingsViewController = segue.destination as! SettingsViewController
            settingsViewController.delegate = self
            settingsViewController.brush = brushWidth
            settingsViewController.red = red
            settingsViewController.green = green
            settingsViewController.blue = blue
            
        } else if segue.identifier == kColorsSegueId {
            let colorsViewController = segue.destination as! ColorsViewController
            colorsViewController.delegate = self
            colorsViewController.selectedColor = (red, green, blue)
            
        } else if segue.identifier == kShapesSegueId {
            let shapesViewController = segue.destination as! ShapesViewController
            shapesViewController.delegate = self
            shapesViewController.selectedShape = "Star"
            
        } else if segue.identifier == kOptionsSegueId {
            let optionsViewController = segue.destination as! OptionsViewController
            optionsViewController.delegate = self
            optionsViewController.isConnected = isConnected
            optionsViewController.isOn = isOn
            if !connectedDeviceName.isEmpty {
                optionsViewController.connectedDeviceName = connectedDeviceName
            }
        }
    }

}

// MARK: - ViewController extensions

extension ViewController:SettingsViewControllerDelegate {
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController) {
        self.brushWidth = settingsViewController.brush
    }
}

extension ViewController:ColorsViewControllerDelegate {
    func colorsViewControllerFinished(_ colorsViewController: ColorsViewController) {
        (red, green, blue) = colorsViewController.selectedColor
        isRandomColor = colorsViewController.isRandomColor
        if colorsViewController.selectedIndex == 0 {
            colorButton.setImage(UIImage(named: "color-red"), for: .normal)
        } else if colorsViewController.selectedIndex == 1 {
            colorButton.setImage(UIImage(named: "color-blue"), for: .normal)
        } else if colorsViewController.selectedIndex == 2 {
            colorButton.setImage(UIImage(named:"color-green"), for: .normal)
        } else if colorsViewController.selectedIndex == 3 {
            colorButton.setImage(UIImage(named:"color-yellow"), for: .normal)
        } else if colorsViewController.selectedIndex == 4 {
            colorButton.setImage(UIImage(named:"color-white"), for: .normal)
        } else if colorsViewController.selectedIndex == 5 {
            colorButton.setImage(UIImage(named:"Multi"), for: .normal)
        }
        
        opacity = 1.0
        
    }
}

extension ViewController:ShapesViewControllerDelegate {
    func shapesViewControllerFinished(_ shapesViewController: ShapesViewController) {
        selectedShape = shapesViewController.selectedShape
        print("SELECTED SHAPE: \(selectedShape)")
    }
}

extension ViewController:OptionsViewControllerDelegate {
    func optionsViewControllerFinished(_ optionsViewController: OptionsViewController) {
        if optionsViewController.connectSelected {
            showbtSetupView()
            toggleTryAgain(on: false)
            spinner.isHidden = false
            skipSetupButton.setTitle("CANCEL", for: .normal)
            centralManager.delegate?.centralManagerDidUpdateState(centralManager)
        } else if optionsViewController.disconnectSelected {
            showbtSetupView()
            toggleTryAgain(on: false)
            spinner.isHidden = false
            disconnect()
            btInstructionsLabel.text = "Disconnecting..."
            skipSetupButton.setTitle("CANCEL", for: .normal)
            btImageView.image = UIImage(named: "disconnect")
        }
        
        if optionsViewController.turnOnSelected {
            // turn lights on via BLE
            print("TURN LIGHTS ON")
            isOn = true
        } else if optionsViewController.turnOffSelected {
            // turn lights off via BLE
            print("TURN LIGHTS OFF")
            isOn = false
        }

    }
}

