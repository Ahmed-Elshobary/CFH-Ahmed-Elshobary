//
//  Counter.swift
//  CFH-Task-Ahmed-Elshobary
//
// Created by ahmed elshobary on 16/03/2024.
//

import Foundation
import UIKit

class CountdownTimer {
    var timer: Timer?
    var remainingTime: TimeInterval = 0
    var label: UILabel?
    
    init(initialTime: TimeInterval, label: UILabel) {
        self.remainingTime = initialTime
        self.label = label
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            
            let minutes = Int(remainingTime) / 60
            let seconds = Int(remainingTime) % 60
            
            let formattedTime = String(format: "%02d:%02d", minutes, seconds)
            
            DispatchQueue.main.async {
                self.label?.text = formattedTime
            }
            
        } else {
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer(newTime: TimeInterval) {
        stopTimer()
        remainingTime = newTime
        startTimer()
    }
}
