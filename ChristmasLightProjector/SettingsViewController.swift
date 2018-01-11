import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var sliderBrush: UISlider!
    @IBOutlet weak var imageViewBrush: UIImageView!
    @IBOutlet weak var labelBrush: UILabel!
    
    var red: CGFloat = 255.0/255.0
    var green: CGFloat = 254.0/255.0
    var blue: CGFloat = 208.0/255.0

    
    var brush: CGFloat = 10.0
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sliderBrush.value = Float(brush)
        labelBrush.text = String(format: "%.1f", brush.native / 5)
        
        drawPreview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        self.delegate?.settingsViewControllerFinished(self)
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if sender == sliderBrush {
            brush = CGFloat(sender.value)
            labelBrush.text = String(format: "%.2f", brush.native / 5)
        }
        drawPreview()
    }
    
    func drawPreview() {
        UIGraphicsBeginImageContext(imageViewBrush.frame.size)
        var context = UIGraphicsGetCurrentContext()
        
        context?.setLineCap(.round)
        context?.setLineWidth(brush)
        let previewColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        context?.setStrokeColor(previewColor.cgColor)
        context?.setFillColor(previewColor.cgColor)
        
        context?.move(to: CGPoint(x: 45.0, y: 45.0))
        context?.addLine(to: CGPoint(x: 45.0, y: 45.0))
        context?.strokePath()

        imageViewBrush.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        context = UIGraphicsGetCurrentContext()
    }
    
}
