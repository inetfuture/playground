//
//  ViewController.m
//  ReposBrowser
//
//  Created by Aaron Wang on 8/19/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "ViewController.h"
#import "NetworkLib.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showRepo:(UIButton *)sender {
    NetworkLib *nl = [[NetworkLib alloc] init];
    [nl getGithubReposForUser:self.textField.text
        withSuccess:^(id responseObject) {
          self.textView.text = [NSString stringWithFormat:@"%@", responseObject];
        }
        failure:^(NSError *error) {
          self.textView.text = [NSString stringWithFormat:@"%@", error];
        }];

    [self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
