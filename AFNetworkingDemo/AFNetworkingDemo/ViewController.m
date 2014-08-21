//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by Infinium on 7/25/14.
//  Copyright (c) 2014 Infinium. All rights reserved.
//

#import "ViewController.h"
#import "MaterilaCostWeb.h"

static NSString * const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self callWebService];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)jsonTapped:(id)sender
{
    // 1
    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
       // self.weather = (NSDictionary *)responseObject;
        NSLog(@"responese =>%@",responseObject);
        self.title = @"JSON Retrieved";
       // [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}
-(void)callWebService{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
   
        [dictionary setObject:@"2014-07-25" forKey:@"category_updated_date"];
        [dictionary setObject:@"Material Cost" forKey:@"category_name"];
   
   

    [MaterilaCostWeb MaterialCost:dictionary withBlocks:^(NSDictionary *response, int status, NSError *error) {
    
        NSLog(@"response =>%@",response);
    }];
    
}
@end
