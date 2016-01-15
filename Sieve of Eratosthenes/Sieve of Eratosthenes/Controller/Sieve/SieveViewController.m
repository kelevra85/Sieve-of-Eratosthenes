//
//  SieveViewController.m
//  Sieve of Eratosthenes
//
//  Created by Utsav Parikh on 1/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "SieveViewController.h"
#import "SieveCell.h"
#import "FilesToImport.h"

@interface SieveViewController ()

@end

@implementation SieveViewController
NSMutableArray *arrayData;

#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Sieve of Eratosthenes";
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
		self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.hidesBackButton = YES;
	[collection registerNib:[UINib nibWithNibName:@"SieveCell" bundle:nil] forCellWithReuseIdentifier:@"SieveCell"];
	arrayData = [[NSMutableArray alloc] init];
    arrayPrime = [[NSMutableArray alloc] init];
	
    //Initialize all the grid numbers with not-visited
	for(int count = 1; count <= [self.strUpperBound integerValue]; count++)
	{
		[arrayData addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", count], @"text", @"0", @"isShown", @"0", @"isVisited", NOT_VISITED_COLOR, @"color", nil]];
	}
	
	[collection reloadData];
    
    //method to generate sieve
	[self performSelector:@selector(sieveGenerate) withObject:self afterDelay:1];
}

#pragma mark - Memory Management Method

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - NavigationBar BarButton Methods

- (void)setSideMenuBarButtonItem
{
    UIButton *btnSideMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSideMenu setTitle:@"Done" forState:UIControlStateNormal];
    [btnSideMenu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSideMenu setFrame:CGRectMake(0, 10, 50, 40)];
    btnSideMenu.titleLabel.font = [UIFont fontWithName:kProximaNovaRegular size:18.0f];
    [btnSideMenu addTarget:self action:@selector(btnBackClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *sideMenuItem = [[UIBarButtonItem alloc] initWithCustomView:btnSideMenu];
    self.navigationItem.rightBarButtonItem = sideMenuItem;
}

-(void)btnBackClicked
{
	POP_VIEW;
}

#pragma mark - Generate Sieve Methods

-(void)sieveGenerate
{
	CGFloat counterVar = 0;
	NSInteger rootNumber = sqrt([self.strUpperBound integerValue]);
	
    //Calculate composite numbers upto root of the upper bound number.
    for(int count = 2; count <= rootNumber; count++)
	{
		counterVar+=0.3;
        //Finding multiples of visited number.
		for(int index = 0; index <= (([self.strUpperBound integerValue] - count)/ count); index++)
		{
			NSInteger counter = ((index + 1) * count) - 1;
			NSMutableDictionary *dict = [arrayData objectAtIndex:counter];
			
            //Change color after visting a number.
			if(![[dict valueForKey:@"isVisited"] boolValue])
			{
				counterVar+=0.3;
				[dict setValue:@"1" forKey:@"isVisited"];
				[self performSelector:@selector(addObjectToView:) withObject:@[ [NSString stringWithFormat:@"%ld",counter], index==0 ? @"0" : @"1"] afterDelay:counterVar];
			}
		}
	}
	NSInteger counter = rootNumber+1;
    
    //Change color of all remaining prime numbers.
	for(NSInteger count = counter; count <= [self.strUpperBound integerValue]; count++)
	{
		NSMutableDictionary *dict = [arrayData objectAtIndex:count-1];
		
		if(![[dict valueForKey:@"isVisited"] boolValue])
		{
			counterVar+=0.3;
			[self performSelector:@selector(addObjectToView:) withObject:@[ [NSString stringWithFormat:@"%ld",(count-1)], @"0"] afterDelay:counterVar];
		}
	}
    
    counterVar+=0.3;
    
    //Show Alert displaying all prime numbers.
    [self performSelector:@selector(showPrimeAlert) withObject:nil afterDelay:counterVar];
}

-(void)addObjectToView:(NSArray *)array
{
    NSInteger index = [[array objectAtIndex:0] integerValue];
    NSMutableDictionary *dict = [arrayData objectAtIndex:index];
    [dict setObject:COMPOSITE_COLOR forKey:@"color"];
    
    //First non-visited number in the loop is a prime.
    if ([[dict valueForKey:@"isShown"] isEqualToString:@"0"] && ![[array objectAtIndex:1] boolValue])
    {
        [dict setObject:PRIME_COLOR forKey:@"color"];
        [arrayPrime addObject:[dict valueForKey:@"text"]];
    }
    
    if([[dict valueForKey:@"isShown"] isEqualToString:@"0"])
    {
        [dict setObject:@"1" forKey:@"isShown"];
    }
    
    [arrayData replaceObjectAtIndex:index withObject:dict];
    [collection reloadData];
}

#pragma mark - Show Alert Method

-(void)showPrimeAlert
{
    [CommonMethods displayAlertwithTitle:AppName withMessage:[NSString stringWithFormat:@"Prime Numbers are : %@",[arrayPrime componentsJoinedByString:@", "]] withViewController:self];
    [self setSideMenuBarButtonItem];
}

#pragma mark - UICollectionView DataSource Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:      (NSInteger)section
{
	return [self.strUpperBound integerValue];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Load custom cell
	SieveCell *cell = (SieveCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SieveCell" forIndexPath:indexPath];
    
    //Add border to the cell
	cell.layer.masksToBounds = YES;
	cell.layer.borderWidth = 1.5f;
	cell.layer.borderColor = [UIColor blackColor].CGColor;
	
    //Set cell text and textcolor
	cell.lblNumber.text = [[arrayData objectAtIndex:indexPath.row] valueForKey:@"text"];
	cell.lblNumber.textColor = [UIColor whiteColor];
	
	if([[[arrayData objectAtIndex:indexPath.row] valueForKey:@"text"] isEqualToString:@"1"])
	{
		cell.layer.borderWidth = 0.0f;
        cell.contentView.backgroundColor = [UIColor whiteColor];
	}
	else
	{
		cell.contentView.backgroundColor = [CommonMethods colorWithHexString:[[arrayData objectAtIndex:indexPath.row] valueForKey:@"color"]];
	}
	return cell;
}

@end
