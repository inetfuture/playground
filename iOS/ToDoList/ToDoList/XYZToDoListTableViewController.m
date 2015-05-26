//
//  XYZToDoListTableViewController.m
//  ToDoList
//
//  Created by Aaron Wang on 5/25/15.
//  Copyright (c) 2015 Aaron Wang. All rights reserved.
//

#import "XYZToDoListTableViewController.h"
#import "XYZToDoItem.h"
#import "XYZAddToDoItemViewController.h"

@interface XYZToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation XYZToDoListTableViewController

- (void)loadInitialData {
    XYZToDoItem *item1 = [[XYZToDoItem alloc] init];
    item1.itemName = @"Item One";
    [self.toDoItems addObject:item1];
    
    XYZToDoItem *item2 = [[XYZToDoItem alloc] init];
    item2.itemName = @"Item Two";
    [self.toDoItems addObject:item2];

    
    XYZToDoItem *item3 = [[XYZToDoItem alloc] init];
    item3.itemName = @"Item Three";
    [self.toDoItems addObject:item3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    XYZToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = item.itemName;
    
    if (item.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    XYZToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (IBAction) unwindToList:(UIStoryboardSegue *)segue {
    XYZAddToDoItemViewController *source = [segue sourceViewController];
    XYZToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

@end
