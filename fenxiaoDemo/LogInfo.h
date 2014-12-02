//
//  LogInfo.h
//  DHF_Driver
//
//  Created by 刘蒙 on 13-6-25.
//  Copyright (c) 2013年 盛途. All rights reserved.
//

#ifndef DHF_Driver_LogInfo_h
#define DHF_Driver_LogInfo_h

#ifdef DEBUG

#define WS_dputs(str) printf("%s %d:  %s\n", __func__, __LINE__, str)
#define WS_dprintf(fmt, args...) printf("%s %d:  " fmt"\n", __func__, __LINE__, ##args)
#define CLog(fmt, ...) NSLog((@"%s:%d " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define CLogEnter  NSLog(@"%s:%d %@", __FUNCTION__, __LINE__, @"Enter -->");
#define CLogExit   NSLog(@"%s:%d %@", __FUNCTION__, __LINE__, @"<--Exist");

#else

#define WS_dputs(str)
#define WS_dprintf(fmt, args...)
#define CLog(fmt, ...)
#define CLogEnter
#define CLogExit

#endif

#define WCLog(fmt, ...) NSLog((@"%s:%d " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif
