//
//  ViewController.m
//  iPhoneImagesAssignment
//
//  Created by Wiljay Flores on 2018-08-15.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIImageView *iPhoneImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _iPhoneImageView = [[UIImageView alloc] init];
    NSURL *iphoneUrl = [NSURL URLWithString:@"http://imgur.com/zdwdenZ.png"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session2 = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDownloadTask *download = [session2 downloadTaskWithURL:iphoneUrl completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            self.iPhoneImageView.image = image;
        }];
       
    }];
    [download resume];
    [self.view addSubview:self.iPhoneImageView];
    self.iPhoneImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.iPhoneImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active =YES;
    [self.iPhoneImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active =YES;
    [self.iPhoneImageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active =YES;
    [self.iPhoneImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active =YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
