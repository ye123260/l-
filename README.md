# 宠物领养系统 - 微信小程序

## 项目说明
这是一个宠物领养系统的微信小程序，包含以下功能：
- 宠物列表展示（支持搜索和筛选）
- 宠物详情查看
- 领养申请表单
- 个人中心（查看申请记录）

## 项目结构
```
pet-adoption/
├── app.js                 # 小程序入口
├── app.json               # 小程序配置
├── app.wxss               # 全局样式
├── sitemap.json           # 站点地图
├── data/
│   └── pets.js            # 宠物模拟数据
├── images/                # 图标目录（需要添加）
│   ├── home.png
│   ├── home-active.png
│   ├── mine.png
│   ├── mine-active.png
│   └── default-avatar.png
└── pages/
    ├── index/             # 首页
    ├── detail/            # 宠物详情页
    ├── apply/             # 领养申请表单页
    └── mine/              # 个人中心页
```

## 使用方法
1. 打开微信开发者工具
2. 导入项目（选择 pet-adoption 目录）
3. 添加 tabBar 图标到 images 目录（需要 4 个图标，建议尺寸 81x81 像素）
4. 编译运行

## 图标准备
需要准备以下图标文件（PNG 格式，建议 81x81 像素）：
- home.png - 首页未选中图标
- home-active.png - 首页选中图标
- mine.png - 我的未选中图标  
- mine-active.png - 我的选中图标
- default-avatar.png - 默认头像

## 功能说明
- 首页：展示所有可领养的宠物，支持按类型筛选和搜索
- 详情页：查看宠物详细信息，可发起领养申请
- 申请表单：填写领养申请信息，包含表单验证
- 我的页面：查看个人信息和申请记录
