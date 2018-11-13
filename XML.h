//
//  XML.h
//  SimpleXMLMaker
//
//  Created by SongYu on 10/27/16.
//  Copyright © 2016 SongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XML : NSObject

@property (nonatomic, weak) NSXMLDocument *XMLDoc;
@property (nonatomic, weak) NSXMLElement *nowElement;

- (void)creatXML:(int) setNumberOfNodes;
- (void)creatXMLFileOnDesktop;
- (void)printXMLComplitely;
- (void)printSuperNode:(NSXMLElement *) element;
- (void)printSubNode:(NSXMLElement *) element;
- (void)addANodeFor:(NSXMLElement *) element;
- (void)deleteANodeAtIndex;
- (void)chooseElement;
- (void)resetNowElement;
- (void)loadAttribute:(NSXMLElement *) element;

@end
