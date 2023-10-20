//
//  PlaceCalloutView.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import AppKit
import MapKit

final class PlaceCallOutView: NSView {
    
    private var annotation: PlaceAnnotation
    
    private var selectShowDirections: (PlaceAnnotation) -> Void
    
    private lazy var directionButton: NSButton = {
        let button = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        button.title = "Get Directions"
        button.wantsLayer = true
        button.isBordered = false
        button.target = self
        button.action = #selector(self.handleShowDirection)
        return button
    }()
    
    @objc
    private func handleShowDirection() {
        self.selectShowDirections(self.annotation)
    }
    
    private lazy var phoneTextField: NSTextField = {
        let textField = NSTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        textField.stringValue = "Phone \n \(self.annotation.phone)"
        textField.isEditable = false
        textField.isBezeled = false
        return textField
    }()
    
    private lazy var addressTextField: NSTextField = {
        let textField = NSTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        textField.stringValue = self.annotation.address
        textField.isEditable = false
        textField.isBezeled = false
        return textField
    }()
    
    init(
        annotation: PlaceAnnotation,
        selectShowDirections: @escaping(PlaceAnnotation) -> Void,
        frame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 400)
    ) {
        self.annotation = annotation
        self.selectShowDirections = selectShowDirections
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented...")
    }
    
    private func configure() {
        
        let stackView = NSStackView(frame: self.frame)
        stackView.alignment = .left
        stackView.orientation = .vertical
        stackView.edgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        /// Snapshot  for  image of the place
        let options = MKMapSnapshotter.Options()
        options.size = CGSize(width: self.frame.width, height: self.frame.height / 2)
        options.mapType = .standard
        options.camera = MKMapCamera(
            lookingAtCenter: self.annotation.coordinate,
            fromDistance: 250,
            pitch: 65,
            heading: 0
        )
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, error in
            if let error { print(error) }
            guard let snapshot = snapshot, error == nil else { return }
            DispatchQueue.main.async {
                let imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
                imageView.image = snapshot.image
                // Insert Image Later
                stackView.insertView(imageView, at: 0, in: .top)
            }
        }
        
        stackView.addArrangedSubview(self.directionButton)
        stackView.addArrangedSubview(self.phoneTextField)
        stackView.addArrangedSubview(self.addressTextField)
        
        let scrollView = NSScrollView(frame: self.frame)
        scrollView.hasVerticalScroller = true
        scrollView.documentView = stackView
        
        self.addSubview(scrollView)
        
    }
    
}
