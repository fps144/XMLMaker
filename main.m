//
//  main.m
//  SimpleXMLMaker
//
//  Created by SongYu on 10/27/16.
//  Copyright © 2016 SongYu. All rights reserved.
//
/*主要思路：
 *初始化一个全局工作指针指向当前的工作对象，借这个指针对结点进行增删查改；
 */
#import <Foundation/Foundation.h>
#import "XML.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int initNumberOfElements;
        char quit;
        NSLog(@"please input the number of elements:");
        scanf("%d",&initNumberOfElements);
        XML *xml = [[XML alloc]init];
        [xml creatXML:initNumberOfElements];
        while ( quit != 'q') {
            NSLog(@"\n1.print XML completely\n2.print superNode\n3.print subNode\n4.add a node\n5.delete a node\n6.creat a XML file on desktop\n7.choose a element\n8.reset nowElement \nEnter the number (tap 'q' to quit):\n");
              scanf("%s",&quit);
            if (quit == 'q') break;
            
            switch (quit) {
                case '1':
                    [xml printXMLComplitely];
                    break;
                case '2':
                    [xml printSuperNode:xml.nowElement];
                    break;
                case '3':
                    [xml printSubNode:xml.nowElement];
                    break;
                case '4':
                    [xml addANodeFor:xml.nowElement];
                    break;
                case '5':
                    [xml deleteANodeAtIndex];
                    break;
                case '6':
                    [xml creatXMLFileOnDesktop];
                    break;
                case '7':
                    [xml chooseElement];
                    break;
                case '8':
                    [xml resetNowElement];
                    break;
                case '9':
                    [xml loadAttribute:xml.nowElement];
                    break;
                default:
                    break;
            }
        }
    }
    return 0;
}
