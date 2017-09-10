//
//  Speech.swift
//  Speech
//
//  Created by Mac on 2017/9/10.
//  Copyright © 2017年 LiYou. All rights reserved.
//

import UIKit
import AVFoundation

protocol SpeechDelegate {
    func didStart(speech: Speech)
    func didFinish(speech: Speech)
    func didPause(speech: Speech)
    func didContinue(speech: Speech)
    func didCancel(speech: Speech)
}

public struct SpeechItem {
    //读字速度 0-1
    public var speed: CGFloat = 0.5
    //音色
    public var pitchMultiplier: CGFloat = 1
    //音量大小 0-1
    public var volume: CGFloat = 1
    //读一段话前停顿
    public var preDelay: CGFloat = 0
    //读一段话后停顿
    public var afterDelay: CGFloat = 0
    //重复次数
    public var repeatCount: Int = 1
    //内容
    public var speakWords: String?
}

class Speech: NSObject {
    
    fileprivate var speechSynthier: AVSpeechSynthesizer!
    fileprivate var speechUtterance: AVSpeechUtterance!
    fileprivate var speechVoice: AVSpeechSynthesisVoice!
    fileprivate var currentSpeakIndex: Int?
    fileprivate var currentSpeakWords: String?
    fileprivate var currentRepeatCount: Int?
    fileprivate var isComplete: Bool = false
    fileprivate var isPause: Bool = false
    
    public var speechItem: SpeechItem?
    public var delegate: SpeechDelegate?
    
    override init() {
        super.init()
        setDefault()
    }
    
    fileprivate func setDefault() {
        speechSynthier = AVSpeechSynthesizer()
    }
    
    public func start() {
        
    }
    
    public func stop() {
        
    }
    
    public func pause() {
        
    }
    
    public func continueSpeak() {
        
    }
}
