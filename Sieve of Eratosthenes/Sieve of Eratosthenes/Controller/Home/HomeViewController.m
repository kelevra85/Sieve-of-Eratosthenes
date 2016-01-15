//
//  HomeViewController.m
//  Sieve of Eratosthenes
//
//  Created by Utsav Parikh on 1/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "HomeViewController.h"
#import "SieveViewController.h"
#import "FilesToImport.h"
#import <IQKeyboardManager/IQUIView+IQKeyboardToolbar.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sieve of Eratosthenes";
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setSideMenuBarButtonItem];
}

#pragma mark - Memory Management Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Menu Buttons

- (void)setSideMenuBarButtonItem {
    UIButton *btnSideMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSideMenu setTitle:@"Done" forState:UIControlStateNormal];
    [btnSideMenu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSideMenu setFrame:CGRectMake(0, 10, 50, 40)];
    btnSideMenu.titleLabel.font = [UIFont fontWithName:kProximaNovaRegular size:18.0f];
    [btnSideMenu addTarget:self action:@selector(validateField) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *sideMenuItem = [[UIBarButtonItem alloc] initWithCustomView:btnSideMenu];
    self.navigationItem.rightBarButtonItem = sideMenuItem;
}

#pragma mark - Validate Text Method

-(void)validateField
{
    [self.view endEditing:YES];
    NSString *strNumber = [CommonMethods getTrimmedString:txtNumber.text];
    //Check if textfield is empty.
    if([CommonMethods isObjectEmpty:strNumber])
    {
        [CommonMethods displayAlertwithTitle:@"Error" withMessage:@"Please enter a number." withViewController:self];
    }
    //Check if textfield has a valid integer.
    else if (![CommonMethods checkForInteger:strNumber])
    {
        [CommonMethods displayAlertwithTitle:@"Error" withMessage:@"Please enter a proper integer value." withViewController:self];
    }
    //Check range of allowed numbers.
    else if (!([strNumber integerValue]>=2 && [strNumber integerValue]<=150))
    {
        [CommonMethods displayAlertwithTitle:@"Error" withMessage:@"Please enter the number between 2 and 150." withViewController:self];
    }
    else
    {
        SieveViewController *sieveController =[[SieveViewController alloc] initWithNibName:@"SieveViewController" bundle:nil];
        sieveController.strUpperBound = strNumber;
        [self.navigationController pushViewController:sieveController animated:YES];
    }
}

#pragma mark - UITextField Delegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //Do not allow more than 3 digits.
    NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSInteger length = [currentString length];
    if (length > 3) {
        return NO;
    }
    return YES;
}

@end
