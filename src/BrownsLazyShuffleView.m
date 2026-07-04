#import <ScreenSaver/ScreenSaver.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BrownsLazyShuffleView : ScreenSaverView
@property (nonatomic, strong) AVQueuePlayer *player;
@property (nonatomic, strong) AVPlayerLooper *looper;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@end

@implementation BrownsLazyShuffleView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1.0 / 30.0];
        [self setWantsLayer:YES];
        self.layer.backgroundColor = NSColor.blackColor.CGColor;
        [self setupPlayer];
    }
    return self;
}

- (void)setupPlayer {
    NSURL *videoURL = [[NSBundle bundleForClass:self.class] URLForResource:@"video" withExtension:@"mp4"];
    if (!videoURL) {
        NSLog(@"BrownsLazyShuffle: video.mp4 not found in bundle resources");
        return;
    }

    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:videoURL];
    self.player = [AVQueuePlayer queuePlayerWithItems:@[]];
    self.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    self.player.muted = YES;
    self.looper = [AVPlayerLooper playerLooperWithPlayer:self.player templateItem:item];

    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.playerLayer.backgroundColor = NSColor.blackColor.CGColor;
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
}

- (void)layout {
    [super layout];
    self.playerLayer.frame = self.bounds;
}

- (void)setFrameSize:(NSSize)newSize {
    [super setFrameSize:newSize];
    self.playerLayer.frame = self.bounds;
}

- (void)startAnimation {
    [super startAnimation];
    [self.player play];
}

- (void)stopAnimation {
    [self.player pause];
    [super stopAnimation];
}

- (void)animateOneFrame {
    // Playback is driven by AVPlayer; no per-frame drawing is needed.
}

- (void)drawRect:(NSRect)rect {
    [[NSColor blackColor] setFill];
    NSRectFill(rect);
}

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow *)configureSheet {
    return nil;
}

@end
