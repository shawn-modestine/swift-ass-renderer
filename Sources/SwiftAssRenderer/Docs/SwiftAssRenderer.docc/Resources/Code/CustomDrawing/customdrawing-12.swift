import UIKit
import Combine
import SwiftAssRenderer

final class SubtitlesViewController: UIViewController {
    private let renderer = AssSubtitlesRenderer(fontConfig: FontConfig(fontsPath: ...))
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSubtitleTrack()
        setupSubtitlesTimer()
        setupSubtitlesFrame()
    }

    private func loadSubtitleTrack() {
        Task {
            do {
                let contents = try await ...
                renderer.loadTrack(content: contents)
            } catch {
                print(error)
            }
        }
    }

    private func setupSubtitlesTimer() {
        let startDate = Date()
        Timer
            .publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.renderer.setTimeOffset(date.timeIntervalSince(startDate))
            }
            .store(in: &cancellables)
    }

    private func setupSubtitlesFrame() {
        view
            .publisher(for: \.frame, options: [.initial, .new])
            .sink { [weak self] frame in
                self?.renderer.setCanvasSize(frame.size, scale: UITraitCollection.current.displayScale)
            }
            .store(in: &cancellables)
    }
}
