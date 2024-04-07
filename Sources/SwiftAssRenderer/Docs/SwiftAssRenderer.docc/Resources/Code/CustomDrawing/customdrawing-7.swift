import UIKit
import SwiftAssRenderer

final class SubtitlesViewController: UIViewController {
    private let renderer = AssSubtitlesRenderer(fontConfig: FontConfig(fontsPath: ...))

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSubtitleTrack()
        setupSubtitlesTimer()
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

    }
}
