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
    public var postDelay: CGFloat = 0
    //重复次数
    public var repeatCount: Int = 1
    //内容
    public var speakWords: String?
}

class Speech: NSObject {
    
    fileprivate var speechSynthier: AVSpeechSynthesizer!
    fileprivate var speechUtterance: AVSpeechUtterance!
    fileprivate var speechVoice: AVSpeechSynthesisVoice! = {
       return AVSpeechSynthesisVoice(language: "zh_CN")
    }()
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
        speechSynthier.delegate = self
        speechItem?.pitchMultiplier = 1
        speechItem?.preDelay = 0
        speechItem?.postDelay = 0
        speechItem?.speed = 0.5
        speechItem?.volume = 1
        speechItem?.repeatCount = 1
        currentSpeakIndex = speechItem?.repeatCount
        isPause = true
    }
    
    public func start() {
        currentRepeatCount = speechItem?.repeatCount
        isPause = false
        startToSpeak()
    }
    
    public func stop() {
        currentRepeatCount = 1
        speechSynthier.stopSpeaking(at: AVSpeechBoundary.word)
    }
    
    public func pause() -> Bool {
        isPause = true
        return speechSynthier.pauseSpeaking(at: AVSpeechBoundary.word)
    }
    
    public func continueSpeak() {
        isPause = false
        speechSynthier.continueSpeaking()
    }
    
    fileprivate func startToSpeak() {
        speechSynthier.stopSpeaking(at: AVSpeechBoundary.immediate)
        guard let _ = currentSpeakWords else {
            return
        }
        speechSynthier.speak(speechUtterance(speakWords: currentSpeakWords!))
    }
    
    fileprivate func speechUtterance(speakWords: String) -> AVSpeechUtterance {
        speechUtterance = AVSpeechUtterance(string: speakWords)
        
        return speechUtterance
    }
    
}

extension Speech: AVSpeechSynthesizerDelegate {
    
}
