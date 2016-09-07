//
//  ViewController.h
//  ProgressBarTest
//
//  Created by Jesse Sahli on 7/26/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLSessionTaskDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;

@end

