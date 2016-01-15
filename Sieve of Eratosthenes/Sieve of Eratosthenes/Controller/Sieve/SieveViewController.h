//
//  SieveViewController.h
//  Sieve of Eratosthenes
//
//  Created by Utsav Parikh on 1/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SieveViewController : UIViewController
<UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView *collection;
    NSMutableArray *arrayPrime;
}

@property(nonatomic, strong) NSString *strUpperBound;

@end
