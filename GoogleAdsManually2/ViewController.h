//
//  ViewController.h
//  GoogleAdsManually2
//
//  Created by Mahaboobsab Nadaf on 20/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GADInterstitial.h>
#import <GoogleMobileAds/GADBannerView.h>
@import GoogleMobileAds;

@interface ViewController : UIViewController
- (IBAction)interstitialAds:(id)sender;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end

