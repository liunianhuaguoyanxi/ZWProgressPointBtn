# ZWProgressPointBtn
## 类似王者荣耀技能按钮/圆环状进度按钮
##
   ```
    ZWProgressPointBtn *progressViewBtn = [[ZWProgressPointBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 70)/2, 130, 75  , 75)];
    progressViewBtn.indexCount=0;
    [self.view addSubview:progressViewBtn];
    progressViewBtn.progressLineWidth = 5;
    progressViewBtn.progressRadianSpacing = 0.02;
    progressViewBtn.totalCount = 3;
    progressViewBtn.progressCount = 0;
    progressViewBtn.pointColor = RGBCOLOR(238, 188, 90);
    progressViewBtn.placeholderColor = [UIColor grayColor];
    progressViewBtn.centerBtn.backgroundColor = [UIColor lightGrayColor];
    progressViewBtn.centerBtn.titleLabel.numberOfLines = 0;
    [progressViewBtn.centerBtn setTitle:@"信息完善" forState:0];
    [progressViewBtn.centerBtn setTitleColor:[UIColor whiteColor] forState:0];
    [progressViewBtn.centerBtn addTarget:self action:@selector(clickToCheck:) forControlEvents:UIControlEventTouchUpInside];
   ```
## 展示效果：
### 技能加点
![image](https://github.com/liunianhuaguoyanxi/ZWProgressPointBtn/raw/master/Gif/jienengdian.gif)
### 状态指示器
![image](https://github.com/liunianhuaguoyanxi/ZWProgressPointBtn/raw/master/Gif/zhaungtaizhishiqi.gif)

