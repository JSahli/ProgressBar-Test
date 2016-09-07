//
//  ViewController.m
//  ProgressBarTest
//
//  Created by Jesse Sahli on 7/26/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg"];
    
    //    creating an instance of NSURLSession
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL: url];
    
    [task resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    NSLog(@"%lld out of %lld bytes written", totalBytesWritten, totalBytesExpectedToWrite);
    
    float myProgress = (totalBytesWritten * 1.0) / (totalBytesExpectedToWrite * 1.0);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressBar setProgress:myProgress];
        [self.view setNeedsDisplay];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location{

    
    
    NSLog(@"finished! location = %@", location);
    
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });

}

@end
