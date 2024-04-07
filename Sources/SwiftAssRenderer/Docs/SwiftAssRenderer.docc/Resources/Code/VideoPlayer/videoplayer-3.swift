import SwiftUI
import AVKit
import SwiftAssRenderer

struct VideoPlayerView: View {
    let player = AVPlayer(url: ...)

    let renderer = AssSubtitlesRenderer(
        fontConfig: FontConfig(fontsPath: ...)
    )

    var body: some View {

    }
}
