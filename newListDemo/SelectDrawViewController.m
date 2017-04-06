//
//  SelectDrawViewController.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "SelectDrawViewController.h"
#import "SZSGroupItem.h"
#import "SZSTagGroupItem.h"
#import "SZSHobbyCell.h"
#import "SZSTagGroupCell.h"
#import "SZSTagList.h"
#import "SZSTagCell.h"
#import "SZSTagItem.h"
#import "SZSGroupHeaderView.h"
static NSString *const hobbyCell = @"hobbyCell";
static NSString *const tagGroupCell = @"tagGroupCell";

@interface SelectDrawViewController ()<UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *groups;
@property (nonatomic, strong) SZSTagList *tagList;
@property (nonatomic, strong) NSMutableDictionary *selectTagDict;

@end

@implementation SelectDrawViewController

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;

}


- (NSMutableDictionary *)selectTagDict
{
    if (_selectTagDict == nil) {
        _selectTagDict = [NSMutableDictionary dictionary];
    }
    return _selectTagDict;
}

- (SZSTagList *)tagList
{
    if (_tagList == nil) {
        _tagList = [[SZSTagList alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        _tagList.tagBackgroundColor = [UIColor colorWithRed:20 / 255.0 green:145 / 255.0 blue:255 / 255.0 alpha:1];
        _tagList.tagCornerRadius = 7;
        __weak typeof(self) weakSelf = self;
        
        _tagList.clickTagBlock = ^(NSString *tag){
            [weakSelf clickTag:tag];
            
        };
        _tagList.tagColor = [UIColor whiteColor];
    }
    return _tagList;
}

- (void)clickTag:(NSString *)tag
{
    // 删除标签
    [_tagList deleteTag:tag];
    
    // 刷新第0组
    NSIndexSet *indexSex = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSex withRowAnimation:UITableViewRowAnimationNone];
    
    // 更新cell标题
    SZSTagCell *cell = self.selectTagDict[tag];
    SZSTagItem *item = cell.item;
    item.isSelected = !item.isSelected;
    cell.item = item;
    
    // 移除选中的cell
    [self.selectTagDict removeObjectForKey:tag];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择标签";
    self.view.backgroundColor = [UIColor whiteColor];
    SZSGroupItem *group = [[SZSGroupItem alloc] init];
    group.name = @"兴趣课程";
    group.data = [NSMutableArray array];
    [self.groups addObject:group];
    
    SZSTagGroupItem *tagGroup = [[SZSTagGroupItem alloc] init];
    tagGroup.data = [NSMutableArray array];
    [group.data addObject:tagGroup];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hobby.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",dictArr);
    
    for (NSDictionary *dict in dictArr) {
        SZSGroupItem *group = [SZSGroupItem groupWithDict:dict];
        [self.groups addObject:group];
    }
    
    [self.tableView registerClass:[SZSHobbyCell class] forCellReuseIdentifier:hobbyCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"SZSTagGroupCell" bundle:nil] forCellReuseIdentifier:tagGroupCell];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SZSTagGroupItem *group = self.groups[section];
    return group.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SZSHobbyCell *cell = [tableView dequeueReusableCellWithIdentifier:hobbyCell];
        cell.tagList = self.tagList;
        return cell;
    }
    
    SZSGroupItem *group = self.groups[indexPath.section];
    SZSTagGroupItem *tagGroup = group.data[indexPath.row];
    
    SZSTagGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:tagGroupCell forIndexPath:indexPath];
    cell.collectionView.delegate = self;
    
    cell.tagGroup = tagGroup;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return _tagList.tagListH;
    }
    
    // 获取标签组模型
    SZSGroupItem *group = self.groups[indexPath.section];
    SZSTagGroupItem *tagGroup = group.data[indexPath.row];
    return tagGroup.cellH;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SZSGroupHeaderView *headerView = [SZSGroupHeaderView groupHeaderView];
    headerView.groupItem = self.groups[section];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SZSTagCell *cell = (SZSTagCell *)[collectionView cellForItemAtIndexPath:indexPath];
    SZSTagItem *item = cell.item;
    item.isSelected = !item.isSelected;
    cell.item = item;
    
    NSString *tagStr = [NSString stringWithFormat:@"%@  ×",cell.tagLabel.text];
    if (item.isSelected) {
        // 添加标签
        [self.tagList addTag:tagStr];
        [self.selectTagDict setObject:cell forKey:tagStr];
    } else {
        // 删除标签
        [self.tagList deleteTag:tagStr];
    }
    
    // 刷新第0组
    NSIndexSet *indexSex = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSex withRowAnimation:UITableViewRowAnimationNone];
}

@end
