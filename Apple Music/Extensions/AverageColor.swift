//
//  AverageColor.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.01.2025.
//

import SwiftUI

extension UIImage {
    // Конвертация SwiftUI.Image в UIImage
    convenience init?(from image: Image) {
        let controller = UIHostingController(rootView: image)
        let view = controller.view

        let targetSize = CGSize(width: 100, height: 100) // Укажите размер
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let uiImage = renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
        self.init(cgImage: uiImage.cgImage!)
    }
}

extension UIImage {
    func averageColor() -> UIColor? {
        guard let cgImage = self.cgImage else { return nil }
        let width = 1
        let height = 1
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: colorSpace,
            bitmapInfo: bitmapInfo
        ) else { return nil }

        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        guard let data = context.data else { return nil }
        let pixels = data.bindMemory(to: UInt8.self, capacity: 4)
        
        let red = CGFloat(pixels[0]) / 255.0
        let green = CGFloat(pixels[1]) / 255.0
        let blue = CGFloat(pixels[2]) / 255.0
        let alpha = CGFloat(pixels[3]) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
