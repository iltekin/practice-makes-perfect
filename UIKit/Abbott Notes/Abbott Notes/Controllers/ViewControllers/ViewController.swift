import UIKit
import PencilKit
import PhotosUI

class ViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {
    //MARK: - IBOutlets
    @IBOutlet var canvasView: PKCanvasView!
    
    //MARK: - Properties
    let toolPicker = PKToolPicker()
    
    var drawing = PKDrawing()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup the canvas View.
        canvasView.delegate = self
        canvasView.drawing = drawing
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        
        //Initialize and show the Tool Picker
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //zoom out amount 1 or less
        canvasView.minimumZoomScale = 1
        //zoom in amount 1 or more
        canvasView.maximumZoomScale = 5
        //Set current zoom
        canvasView.zoomScale = 1
    }
    
    func clearCanvas() {
        canvasView.drawing = PKDrawing()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearCanvas()
    }
    
    @IBAction func SaveToCameraRoll(_ sender: Any) {

        UIGraphicsBeginImageContext(view.bounds.size)
        
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image!)
            }) { sucess, error in
                if let error = error {
                    DispatchQueue.main.async {
                        let displayError = UIAlertController(title: "Error", message: "Error saving image to photos, please check permissions in privacy settings or else", preferredStyle: .alert)
                        let okay = UIAlertAction(title: "Okay", style: .default)
                        displayError.addAction(okay)
                        self.present(displayError, animated: true, completion: nil)
                        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    }
                }
                if sucess {
                    DispatchQueue.main.async {
                        let message = UIAlertController(title: "Thank you", message: "Your note was successfully saved", preferredStyle: .alert)
                        let okay = UIAlertAction(title: "Okay", style: .default)
                        message.addAction(okay)
                        self.present(message, animated: true, completion: nil)
                    }
                    self.clearCanvas()
                }
            }
        }
    }
    
    
    @IBAction func pencilFingerSwitch(_ sender: UISegmentedControl) {
        canvasView.drawingPolicy = canvasView.drawingPolicy == .anyInput ? .pencilOnly : .anyInput
    }
    
    //MARK: - PencilKit Functions
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
        
}

