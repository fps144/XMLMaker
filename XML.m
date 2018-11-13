//
//  XML.m
//  SimpleXMLMaker
//
//  Created by SongYu on 10/27/16.
//  Copyright © 2016 SongYu. All rights reserved.
//

#import "XML.h"

@implementation XML {
    NSString *attributeName;
    NSString *attributeValue;
    NSString *description;
    NSString *encoding;
    NSString *version;
    NSString *newNodeName;
    NSXMLElement *root;
}

#pragma mark 初始化XML文件
- (void)creatXML :(int) setNumberOfNodes{
    int temp=0;
    //根
    root = [[NSXMLElement alloc] initWithName:@"CategoryList"];
    _XMLDoc = [NSXMLDocument documentWithRootElement:root];
    while (temp++ < setNumberOfNodes) {
        NSString *string = [NSString stringWithFormat:@"Category ID=\"%02d\"",temp];
        
        NSXMLElement *Category = [[NSXMLElement alloc]initWithName:string];
        NSXMLElement *MainCategory = [[NSXMLElement alloc]initWithName:@"MainCategory"];
        NSXMLElement *Description = [[NSXMLElement alloc]initWithName:@"Description"];
        NSXMLElement *Active = [[NSXMLElement alloc]initWithName:@"Active"];
        
        [MainCategory setStringValue:@"XML"];
        [Description setStringValue:@"This is a list of my XML articles."];
        [Active setStringValue:@"true"];
        [root addChild:Category];
        
        [Category addChild:MainCategory];
        [Category addChild:Description];
        [Category addChild:Active];
        
        //初始化nowElement
        _nowElement = root;
    }

    //Version
    char buffer1[5];
    NSLog(@"input the version of XML:\n");
    scanf("%s",buffer1);
    version = [NSString stringWithUTF8String:buffer1];
    [_XMLDoc setVersion:version];
    
    //Endocing
    char buffer2[20];
    NSLog(@"input the enciding style of XML:\n");
    scanf("%s",buffer2);
    encoding = [NSString stringWithUTF8String:buffer2];
    [_XMLDoc setCharacterEncoding:encoding];
    
    //Standalone
    [_XMLDoc setStandalone:NO];
    
    if (root) {
        NSLog(@"\n\n**successful**\nnowElement is root\n\n");
    }
}

#pragma mark 在桌面生成XML文件
- (void)creatXMLFileOnDesktop {
    //获取桌面路径
    NSString*bundle=[[NSBundle mainBundle] resourcePath];
    NSString*deskTopLocation=[[bundle substringToIndex:[bundle rangeOfString:@"Library"].location] stringByAppendingFormat:@"Desktop/test.xml"];

    //将XMLDocument转为NSData类型
    NSData *data = _XMLDoc.XMLData;
    
    //在桌面生成XML文件

    if ([data writeToFile:deskTopLocation atomically:YES]){
    NSLog(@"XMLfile has been saved at :%@",deskTopLocation);
    }
}

#pragma mark 打印整个XML文件
- (void)printXMLComplitely {
    NSLog(@"%@",_XMLDoc);
}

#pragma mark 打印父结点
- (void)printSuperNode:(NSXMLElement *)element {
    NSLog(@"%@'s superNode is %@\n",element.name,element.parent.name);
}

#pragma mark 打印子结点
- (void)printSubNode:(NSXMLElement *)element {
    NSLog(@"the number of %@'s subNode is %ld",element.name,element.childCount);
    for (NSXMLElement * tempElement in element.children) {
        NSLog(@"%@",tempElement.name);
    }
    NSLog(@"\n");
}

#pragma mark 添加结点
- (void)addANodeFor:(NSXMLElement *)element {
    NSXMLNode *newNode = [NSXMLNode commentWithStringValue:newNodeName];
    char buffer1[1000];
    
    NSLog(@"input new node name:\n");
    scanf("%s",buffer1);
    newNodeName = [NSString stringWithUTF8String:buffer1];
    [element addChild:newNode];

    NSLog(@"input attribute and value:\n");
    char buffer2[1000];
    char buffer3[1000];
    scanf("%s",buffer2);
    scanf("%s",buffer3);

    attributeName = [NSString stringWithUTF8String:buffer2];
    attributeValue = [NSString stringWithUTF8String:buffer3];
    [element addAttribute:[NSXMLNode attributeWithName:attributeName stringValue:attributeValue]];
    
    _nowElement = element;
}

#pragma mark 删除结点
-(void)deleteANodeAtIndex {
    [self printSubNode:_nowElement];
    int index;
    NSLog(@"input the index:\n");
    scanf("%d",&index);
    [_nowElement removeChildAtIndex:index-1];
}

#pragma mark 查看结点属性
- (void)loadAttribute:(NSXMLElement *)element {
    NSLog(@"%@",[element attributes]);
}

#pragma mark 选择结点
- (void)chooseElement{
    [self printSubNode:_nowElement];
    int index;
    NSLog(@"input the node number:");
    scanf("%d",&index);
    _nowElement =  [_nowElement childAtIndex:index-1];
    if(_nowElement)
    NSLog(@"nowelement = %@",_nowElement);
    else {
        NSLog(@"the member you choosed has 0 subNode\n");
        return;
    }
}

#pragma mark 重置工作指针nowElement
- (void)resetNowElement {
    _nowElement = root;
}

@end
