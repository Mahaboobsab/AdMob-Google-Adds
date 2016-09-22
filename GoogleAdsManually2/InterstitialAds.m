//
//  InterstitialAds.m
//  GoogleAdsManually2
//
//  Created by test on 21/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "InterstitialAds.h"

@interface InterstitialAds ()<UIAlertViewDelegate,GADInterstitialDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation InterstitialAds

- (void)viewDidLoad {
    [super viewDidLoad];
_interstitial.delegate = self;

    // Do any additional setup after loading the view.
     [self startNewGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startNewGame {
    [self createAndLoadInterstitial];
    
    // Set up a new game.
}
- (void)createAndLoadInterstitial {
    self.interstitial =
    [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"];
    
    GADRequest *request = [GADRequest request];
    // Request test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made.
    request.testDevices = @[ kGADSimulatorID, @"2077ef9a63d2b398840261c8221a0c9b" ];
    [self.interstitial loadRequest:request];
}
- (void)endGame {
    [[[UIAlertView alloc]
      initWithTitle:@"Game Over"
      message:@"Your time ran out!"
      delegate:self
      cancelButtonTitle:@"Ok"
      otherButtonTitles:nil] show];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
    } else {
        NSLog(@"Ad wasn't ready");
    }
    // Give user the option to start the next game.
}

- (void)interstitialDidReceiveAd:(DFPInterstitial *)ad
{
    [_interstitial presentFromRootViewController:self];
}
@end
