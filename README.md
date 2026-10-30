# HelloDemo

一个最小的 macOS SwiftUI 示例。用 Xcode 打开工程，在自己的 Mac 上编译运行即可。

不上架 App Store。不需要 Developer ID，也不需要公证（notarization）。

要打开的工程文件在仓库根目录：

```
HelloDemo.xcodeproj
```

## 环境

- 一台 Mac
- [Xcode](https://developer.apple.com/xcode/) 14.1 或更高版本（Mac App Store 安装即可）
- macOS 13 或更高

不需要付费的 Apple Developer Program 会员。应用只有一个窗口，不访问网络，也不申请额外系统权限。

## 克隆

```bash
git clone https://github.com/YinshawnRao/macos-demo-hello.git
cd macos-demo-hello
```

也可以在 GitHub 页面下载 ZIP，解压后进入该目录。

## 用 Xcode 打开

在 Finder 中双击仓库根目录的 `HelloDemo.xcodeproj`。

或在终端执行：

```bash
open HelloDemo.xcodeproj
```

## 运行

1. Xcode 顶部工具栏里，运行按钮右侧的设备选 **My Mac**。
2. 按 **⌘R**（菜单 **Product → Run**）。
3. 第一次编译会稍久。成功后会出现一个窗口：
   - 标题栏是 **HelloDemo**
   - 窗口里有一行 **Hello, macOS**
   - 中间是计数，下面是 **Increment** 按钮。每点一次，数字加 1。

工程已设为 **Sign to Run Locally**（本机临时签名，Ad Hoc）。直接运行即可，不需要配置 Development Team，也不需要 Developer ID 或公证。

如果 Xcode 仍然提示 “Signing for HelloDemo requires a development team”：

1. 点击左侧蓝色工程图标 **HelloDemo**。
2. 选中 TARGETS 下的 **HelloDemo**。
3. 打开 **Signing & Capabilities**。
4. 勾选 **Automatically manage signing**，Team 选你的 **Personal Team**（Xcode → Settings → Accounts，登录免费 Apple ID 即可）。

这仍然只是本机调试签名。不需要 Developer ID，也不需要公证。

## 打成 zip 发给朋友（可选）

朋友的 Mac 也需要 macOS 13 或更高。构建包含 Apple 芯片和 Intel 两种架构，两边都可以打开。

1. 在 Xcode 里先成功编译一次（**⌘B** 或 **⌘R**）。
2. 左侧导航栏展开 **Products**，在 `HelloDemo.app` 上右键，选 **Show in Finder**。
   - 如果看不到 Products：菜单 **Product → Show Build Folder in Finder**，再进入 `Build/Products/Debug/`。
3. 在 Finder 里右键 `HelloDemo.app`，选 **压缩 “HelloDemo.app”**，得到 `HelloDemo.app.zip`。
4. 把 zip 发给朋友。

朋友收到后：

1. 解压 zip。
2. 第一次不要双击。在 `HelloDemo.app` 上 **右键 → 打开**，再在对话框里点 **打开**。
3. 这个包没有 Developer ID，也没有公证，系统会拦截普通双击。右键打开是预期步骤。
4. 若右键之后仍被拦住：打开 **系统设置 → 隐私与安全性**，在列表下方找到 HelloDemo 被阻止的说明，点 **仍要打开**。
5. 若提示“已损坏”或文件被移到废纸篓，多半是浏览器下载标记导致的。在终端执行（路径按实际位置修改）：

```bash
xattr -cr ~/Downloads/HelloDemo.app
codesign --force --sign - ~/Downloads/HelloDemo.app
```

然后再右键 → 打开。第二条命令是本机临时签名，同样不需要 Developer ID，也不需要公证。

## 工程里有什么

```
HelloDemo.xcodeproj          ← 用 Xcode 打开这个
HelloDemo/
  HelloDemoApp.swift         ← 程序入口（SwiftUI App）
  ContentView.swift          ← 窗口界面和计数按钮
  Assets.xcassets            ← 图标和强调色
```
