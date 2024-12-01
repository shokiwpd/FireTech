//
//  MLTechView.swift
//  FireTech
//
//  Created by Павел Уланов on 27.11.2024.
//
import UIKit
import CoreML
import AVKit
import Vision

class MLTechView: UIView {
    //
    weak var MLTechControllerRoot: MLTechController?
    //MARK: UIKit elements
    let viewCamera = UIView()
    let openInfoButton = UIButton()
    //MARK: varible
    var getMLresult = ""
    //MARK: GCD
    let dispatchGlobal = DispatchQueue.global()
    //MARK: AVKit elements
    let captureSessionML = AVCaptureSession()
    let captureVideoDataOutputML  = AVCaptureVideoDataOutput()
    
    func AVelemets(_ VC: UIView) {
        guard let captureDeviceML = AVCaptureDevice.default(for: .video) else {return}
        guard let inputDevice = try?  AVCaptureDeviceInput(device: captureDeviceML) else {return}
        captureSessionML.addInput(inputDevice)
        
        let capturePreviewLayerML = AVCaptureVideoPreviewLayer(session: captureSessionML)
        capturePreviewLayerML.frame = VC.frame
        capturePreviewLayerML.masksToBounds = false
        capturePreviewLayerML.videoGravity = .resizeAspectFill
        viewCamera.layer.addSublayer(capturePreviewLayerML)
    }
    func createLayoutUIElementML(_ VC: UIView){
        viewCamera.positionOfElements(VC.topAnchor, 0,
                                      VC.leadingAnchor, 0,
                                      VC.trailingAnchor, 0,
                                      VC.bottomAnchor, 0)
        openInfoButton.positionOfElements(nil, 0,
                                          VC.leadingAnchor, 20,
                                          VC.trailingAnchor, -20,
                                          VC.bottomAnchor, -100)
        openInfoButton.settingButtonFunc(.appActiveButtonStyle)
    }
    func addElementToControllerML(_ VC: UIView){
        VC.creatingElements([viewCamera,openInfoButton])
    }
    
    func GCDsetting() {
        dispatchGlobal.async {
            self.captureSessionML.startRunning()
        }
        captureVideoDataOutputML.setSampleBufferDelegate(MLTechControllerRoot, queue: DispatchQueue(label: "MLImageQueue"))
        captureSessionML.addOutput(captureVideoDataOutputML)
    }
    func startAllFunc(_ VC: UIView) {
        addElementToControllerML(VC)
        createLayoutUIElementML(VC)
        AVelemets(VC)
        GCDsetting()
    }
}
extension MLTechController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let PTVModel = try? VNCoreMLModel(for: FireTechML().model) else {return}
        guard let pixelBuffer: CVPixelBuffer =  CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        let requestML = VNCoreMLRequest(model: PTVModel) { finichReq, error in
            guard let resultPTV = finichReq.results as? [VNClassificationObservation] else {return}
            guard let firstResultPTV = resultPTV.first else {return}
            DispatchQueue.main.async {
                self.classsMLView.openInfoButton.setTitle(firstResultPTV.identifier, for: .normal)
                self.classsMLView.getMLresult = firstResultPTV.identifier
                print(firstResultPTV.identifier)
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([requestML])
    }
}
