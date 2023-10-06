//
//  AudioManager.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 04.10.2023.
//

import Foundation
import AVFoundation

final class AudioManager {
    static let shared = AudioManager()
    
    // MARK: - Private Properties
    private var player: AVPlayer?
    
    private(set) var isPlaying = false
    private(set) var isPause = false
    
    // MARK: - Public Properties
    var currentTime: CMTime {
        guard let currentTime = player?.currentTime() else { return CMTime() }
        return currentTime
    }
    
    var currentItemDuration: CMTime  {
        let currentItem = player?.currentItem?.duration ?? CMTime.zero
        return currentItem
    }
    
    var podcasts: [TestModel] = []
    var currentSongIndex = 0
    
    // MARK: - Private Init
    private init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Ошибка настройки аудиосесии \(error)")
        }
    }
    
    // MARK: - Public Methods
    func playAudio() {
        isPlaying = true
        
        let currentURL = podcasts[currentSongIndex].url
        if let audioURL = URL(string: currentURL) {
            let playerItem = AVPlayerItem(url: audioURL)
            player = AVPlayer(playerItem: playerItem)
        }
        
        player?.play()
    }
    
    func setNextSong() {
        guard !podcasts.isEmpty else { return }
        
        let wasPlaying = isPlaying
        currentSongIndex += 1
        
        if currentSongIndex >= podcasts.count {
            currentSongIndex = podcasts.count - 1 
            stopAudio()
            return
        }
        
        player = nil
        isPlaying = false
        isPause = false
        
        if wasPlaying {
            playAudio()
        }
    }
    
    func setPreviousSong() {
        guard !podcasts.isEmpty else { return }
        
        let wasPlaying = isPlaying
        
        currentSongIndex = max(0, currentSongIndex - 1)
        
        player = nil
        isPlaying = false
        isPause = false
        
        if wasPlaying {
            playAudio()
        }
    }
    
    func playNextSong() {
        setNextSong()
        if isPlaying {
            playAudio()
        }
    }
    
    func playPreviousSong() {
        setPreviousSong()
        if isPlaying {
            playAudio()
        }
    }
    
    func pauseAudio() {
        isPause = true
        isPlaying = false
        player?.pause()
    }
    
    func resumeAudio() {
        isPause = false
        isPlaying = true
        player?.play()
    }
    
    func stopAudio() {
        isPlaying = false
        isPause = false
        player?.pause()
        player?.seek(to: CMTime.zero) // Перемещаемся в начало трека
    }
    
    func setPodcasts(_ podcasts: [TestModel], index: Int) {
        self.podcasts = podcasts
        self.currentSongIndex = index
    }
}

extension AudioManager {
    func seek(to time: CMTime) {
        player?.seek(to: time)
    }
}

extension AudioManager {
    // получение длительности подкаста для отобржанения
    func getDuration(for url: URL, completion: @escaping (CMTime?) -> Void) {
        let asset = AVAsset(url: url)
        let durationKey = "duration"
        
        // Загружаем метаданные
        asset.loadValuesAsynchronously(forKeys: [durationKey]) {
            var error: NSError? = nil
            let status = asset.statusOfValue(forKey: durationKey, error: &error)
            switch status {
            case .loaded:
                completion(asset.duration)
            case .failed, .cancelled, .loading, .unknown:
                completion(nil)
            @unknown default:
                completion(nil)
            }
        }
    }
}
