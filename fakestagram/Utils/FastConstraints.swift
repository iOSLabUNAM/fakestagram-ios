//
//  FastConstraints.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 9/28/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    
    /// Pins all the edges of the view to the specified Anchors, with the option to add a padding.
    ///
    /// This function in particular sets the borders to specified anchors, so it is not required to sepcifie an X , Y position, and neither
    /// a width or height.
    /// - Parameters:
    ///   - topAnchor: Anchor where the top will be pined
    ///   - bottomAnchor: Anchor where the bottom will be pined
    ///   - leadingAnchor: Anchor where the leading will be pined
    ///   - trailingAnchor: Anchor where the trailing will be pined
    ///   - padding: The padding to each border
    func pinConstraintsToEdges(topAnchor: NSLayoutYAxisAnchor, bottomAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right).isActive = true
        
    }
    
    /// Pins constraints of the borders, with the option to specify sizes
    ///
    /// Ths function has the capabilitie to accept some border anchors as nil, in case that it is only required to specify position
    /// relating borders to another UI element, but it is still required to specify sizes so width and height parameters.
    /// - Parameters:
    ///   - topAnchor: Anchor where top will be pined
    ///   - bottomAnchor: Anchor where the bottom will be pined
    ///   - leadingAnchor: Anchor where the leading will be pined
    ///   - trailingAnchor: Anchor where the trailing will be pined
    ///   - width: An specified width
    ///   - height: An specified height
    ///   - padding: Paddign added to the borders
    func setConstraintsToBordersAndSizes(topAnchor: NSLayoutYAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, width: CGFloat? , height: CGFloat?, padding: UIEdgeInsets = .zero)
    {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topAnchor = topAnchor
        {
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        }
        if let bottomAnchor = bottomAnchor
        {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom).isActive = true
        }
        if let leadingAnchor = leadingAnchor
        {
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        }
        if let trailingAnchor = trailingAnchor
        {
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right).isActive = true
        }
        if let width = width
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height
        {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Pins constraints to the borders and sizes, with the option to not specify all the borders. This function can be unsafe because it permits to not stablish all the neccesary constraints.
    ///
    /// - Parameters:
    ///   - topAnchor: Anchor where top will be pined
    ///   - bottomAnchor: Anchor where bottom will be pined
    ///   - leadingAnchor: Anchor where leaaing will be pined
    ///   - trailingAnchor: Anchor where trailing will be pinned
    ///   - padding: Padding added to the borders
    func unsafeSetConstraintsToBorders(topAnchor: NSLayoutYAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero)
    {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topAnchor = topAnchor
        {
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        }
        if let bottomAnchor = bottomAnchor
        {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom).isActive = true
        }
        if let leadingAnchor = leadingAnchor
        {
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        }
        if let trailingAnchor = trailingAnchor
        {
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right).isActive = true
        }
    }
    
    /// Sets constraints to width and height
    ///
    /// - Parameters:
    ///   - width: Specified Width
    ///   - height: Specified height
    func setSizeConstraints(width: CGFloat, height: CGFloat)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: width)
        self.widthAnchor.constraint(equalToConstant: height)
    }
    /// Center the axis of the view to the specified anchor.
    ///
    /// - Parameters:
    ///   - xAxis: Anchor where X center will be pined
    ///   - yAxis: Anchor where Y center wil bi pined
    ///   - xPadding: Added space to X axis
    ///   - yPadding: Added space to Y axis
    func centerAxis(centerXto xAxis: NSLayoutXAxisAnchor?, centerYto yAxis: NSLayoutYAxisAnchor?, xPadding : CGFloat = 0.0, yPadding : CGFloat = 0.0)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let xAxis = xAxis
        {
            self.centerXAnchor.constraint(equalTo: xAxis, constant: xPadding).isActive = true
        }
        if let yAxis = yAxis
        {
            self.centerYAnchor.constraint(equalTo: yAxis, constant: yPadding).isActive = true
        }
    }
    /// Center the axis to an specified anchor, and sets sizes constraints
    ///
    /// - Parameters:
    ///   - width: Widht size
    ///   - height: Height Size
    ///   - centerXPosition: Anchor where center X will be pined
    ///   - centerYPosition: Anchor where center Y will be pined
    ///   - xPadding: Added space to X axis
    ///   - yPadding: Added space to Y axis
    func centerAxisWithSizes(width: CGFloat, height: CGFloat,centerXTo centerXPosition: NSLayoutXAxisAnchor,centerYTo centerYPosition: NSLayoutYAxisAnchor, xPadding : CGFloat = 0.0, yPadding : CGFloat = 0.0)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.centerYAnchor.constraint(equalTo: centerYPosition, constant: xPadding).isActive = true
        self.centerXAnchor.constraint(equalTo: centerXPosition, constant: yPadding).isActive = true
    }
    
    /// Centers Y Axis to an anchor, sets constraints for sizes and sets for borders.
    ///
    /// - Parameters:
    ///   - width: Width specified
    ///   - height: height specified
    ///   - centerY: Anchor where will be pinned the center in Y axis
    ///   - leading: Anchor where leading will be pinned.
    ///   - trailing: Anchor where trailing wil be pinned.
    ///   - padding: Added space to the borders
    func centerYAxisToObject(width: CGFloat?, height: CGFloat, centerY: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding : UIEdgeInsets)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let width = width
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.centerYAnchor.constraint(equalTo: centerY, constant: padding.top).isActive = true
        if let leading = leading
        {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing
        {
            self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
    }
    
    /// Centers Y Axis to an anchor, sets constraints for sizes, sets constraints for borders. Each constraint will have an identifier.
    ///
    /// - Parameters:
    ///   - width: Width specified
    ///   - height: height specified
    ///   - centerY: Anchor where will be pinned the center in Y axis
    ///   - leading: Anchor where leading will be pinned.
    ///   - trailing: Anchor where trailing wil be pinned.
    ///   - padding: Added space to the borders
    func centerYAxisToObjectTag(width: CGFloat?, height: CGFloat, centerY: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding : UIEdgeInsets)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let width = width
        {
            let widhtConstraint = self.widthAnchor.constraint(equalToConstant: width)
            widhtConstraint.identifier = "\(self.tag)-Width"
            widhtConstraint.isActive = true
        }
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: height)
        heightConstraint.identifier = "\(self.tag)-Height"
        heightConstraint.isActive = true
        
        let centerConstraint = self.centerYAnchor.constraint(equalTo: centerY, constant: padding.top)
        centerConstraint.identifier = "\(self.tag)-centerY"
        centerConstraint.isActive = true
        if let leading = leading
        {
            let leadingConstraint = self.leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            leadingConstraint.identifier = "\(self.tag)-leading"
            leadingConstraint.isActive = true
        }
        if let trailing = trailing
        {
            let trailingConstrain = self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right)
            trailingConstrain.identifier = "\(self.tag)-trailing"
            trailingConstrain.isActive = true
        }
    }
    
    /// Pins constraints of the borders, with the option to specify sizes
    ///
    /// Ths function has the capabilitie to accept some border anchors as nil, in case that it is only required to specify position
    /// relating borders to another UI element, but it is still required to specify sizes so width and height parameters.
    /// - Parameters:
    ///   - topAnchor: Anchor where top will be pined
    ///   - bottomAnchor: Anchor where the bottom will be pined
    ///   - leftAnchor: Anchor where the leading will be pined
    ///   - rightAnchor: Anchor where the trailing will be pined
    ///   - width: An specified width
    ///   - height: An specified height
    ///   - padding: Paddign added to the borders
    func setConstraintsToBordersAndSizes(topAnchor: NSLayoutYAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, leftAnchor: NSLayoutXAxisAnchor?, rightAnchor: NSLayoutXAxisAnchor?, width: CGFloat? , height: CGFloat?, padding: UIEdgeInsets = .zero)
    {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topAnchor = topAnchor
        {
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        }
        if let bottomAnchor = bottomAnchor
        {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom).isActive = true
        }
        if let leftAnchor = leftAnchor
        {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding.left).isActive = true
        }
        if let rightAnchor = rightAnchor
        {
            self.rightAnchor.constraint(equalTo: rightAnchor, constant: padding.right).isActive = true
        }
        if let width = width
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height
        {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
