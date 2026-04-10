# 🚀 TWRP 云构建 - 立即执行脚本
## 针对仓库：https://github.com/b15185591889/twrp-dagu.git

---

## ⚡ 快速操作（三选一）

### 方式一：使用 PowerShell 脚本（推荐）

```powershell
cd e:\twrp
.\start_github_actions_build.ps1
```

**优点**: 交互式界面，自动检查环境

---

### 方式二：手动访问 GitHub（最直接）

#### 步骤：

1. **打开仓库页面**
   ```
   https://github.com/b15185591889/twrp-dagu
   ```

2. **进入 Actions**
   - 点击顶部 "Actions" 标签
   - 在左侧选择 "Cloud TWRP Builder with China Mirror"

3. **运行工作流**
   - 点击 "Run workflow" 按钮
   - 配置选项：
     ```
     Branch: main
     Use China Mirror: true          ← 重要！速度快 10-20 倍
     Build Type: minimal             ← 推荐！30-60 分钟完成
     Upload Build Artifacts: true    ← 必须！用于下载产物
     ```
   - 点击绿色的 "Run workflow"

4. **等待完成**
   - 预计时间：30-60 分钟
   - 可以实时查看日志
   - 完成后会收到邮件通知

5. **下载产物**
   - Actions → 成功的运行记录
   - 滚动到底部 → Artifacts
   - 点击 "twrp-dagu-{数字}" 下载
   - 解压获得 `recovery.img`

---

### 方式三：使用 Git 命令推送并触发

```powershell
# 1. 确保代码已提交
cd e:\twrp
git add .
git commit -m "准备 TWRP 云构建"

# 2. 推送到 GitHub（会自动触发 Actions）
git push origin main

# 3. 访问 Actions 页面查看进度
Start-Process "https://github.com/b15185591889/twrp-dagu/actions"
```

---

## 📊 构建配置说明

### 推荐配置（已优化）

```yaml
✅ Branch: main                    # 主分支
✅ Use China Mirror: true          # 清华镜像，快 10-20 倍
✅ Build Type: minimal             # 最小化构建，省时省力
✅ Upload Artifacts: true          # 上传产物，用于下载
```

### 各选项说明

**Use China Mirror (使用中国镜像)**
- `true`: 使用清华大学镜像源，下载速度提升 10-20 倍 ⭐⭐⭐⭐⭐
- `false`: 使用官方源，可能非常慢 ❌

**Build Type (构建类型)**
- `minimal`: 仅下载必要组件，30-60 分钟，约 5GB ⭐⭐⭐⭐⭐ 推荐
- `full`: 完整 AOSP 源码，2-4 小时，约 50GB ⭐⭐ 不推荐
- `test`: 测试构建，20-40 分钟，用于调试 ⭐⭐⭐

**Upload Artifacts (上传产物)**
- `true`: 上传到 GitHub，保留 7 天，可下载 ⭐⭐⭐⭐⭐ 必须
- `false`: 不上传，节省空间 ❌ 不推荐

---

## ⏱️ 时间线预估

| 阶段 | 时间 | 说明 |
|------|------|------|
| 环境搭建 | 5 分钟 | 安装依赖、配置工具 |
| 下载源码 | 10-20 分钟 | 使用清华镜像 |
| 设备树配置 | 2 分钟 | 复制和验证 |
| 编译构建 | 20-40 分钟 | 核心编译过程 |
| 上传产物 | 3-5 分钟 | 打包上传 |
| **总计** | **40-72 分钟** | Minimal Build |

---

## 🔍 实时监控构建

### 查看进度

1. 访问：https://github.com/b15185591889/twrp-dagu/actions
2. 点击正在运行的记录（显示 "In progress"）
3. 点击具体的 job 查看详细日志

### 关键节点

```
✅ [Setup Build Environment]     5 分钟 - 环境搭建
✅ [Download Android Source]     20 分钟 - 下载源码
✅ [Setup Device Tree]           2 分钟 - 设备树配置
🔄 [Build TWRP Recovery]        40 分钟 - 编译中...
⏳ [Upload Build Artifacts]      5 分钟 - 上传产物
```

---

## 📥 下载构建产物

### 成功后操作

1. **找到成功的运行**
   - Actions 页面
   - 查找绿色 ✓ 标记的运行记录

2. **下载 artifacts**
   - 滚动到页面底部
   - 找到 "Artifacts" 区域
   - 点击 `twrp-dagu-{run_number}` 下载

3. **解压文件**
   ```
   twrp-dagu-{数字}.zip
   └── recovery.img (128MB)
   ```

4. **验证文件**
   ```powershell
   # 检查大小
   ls -lh recovery.img
   # 应该显示 ~128 MB
   
   # 检查类型（需要 WSL 或 Git Bash）
   file recovery.img
   # 应该显示 "Android bootimg"
   ```

---

## ⚠️ 重要提醒

### 构建前检查

- [ ] GitHub 账号已登录
- [ ] 邮箱已验证（接收通知）
- [ ] Actions 已启用（Settings → Actions）
- [ ] 了解基本风险

### 构建后注意

- [ ] 及时下载产物（7 天后删除）
- [ ] 保存 build.log（故障排查）
- [ ] 验证文件大小（64-128MB）
- [ ] 准备刷机工具（ADB/Fastboot）

---

## 🛠️ 故障排除

### 常见问题

**Q: Actions 页面是空的？**
```
解决：Settings → Actions → General 
     → Workflow permissions 
     → Read and write permissions
     → Save
```

**Q: Workflow 无法运行？**
```
解决：确保已启用 Actions
     Settings → Actions → Allow all actions
```

**Q: 构建失败怎么办？**
```
1. 查看详细日志（点击红色的 job）
2. 搜索 "error:" 关键词
3. 90% 是网络问题，重新运行即可
4. 确保使用了中国镜像
```

**Q: 太慢了怎么办？**
```
确保配置：
- Use China Mirror: true
- Build Type: minimal
- 在非高峰时段构建（凌晨/清晨）
```

---

## 💡 优化建议

### 加速技巧

1. **必须使用中国镜像**
   - 速度快 10-20 倍
   - 清华镜像最稳定

2. **选择 Minimal Build**
   - 只下载必要组件
   - 省时 50%

3. **非高峰时段构建**
   - 推荐：凌晨 0:00 - 9:00
   - 避免：晚上 19:00 - 23:00

4. **保持网络稳定**
   - 构建过程中不要关闭浏览器
   - 可以使用手机热点备用

---

## 📞 获取帮助

### 文档资源

- **快速开始**: `FAST_TRACK_GUIDE.md`
- **详细教程**: `GITHUB_ACTIONS_BUILD_GUIDE.md`
- **完整总结**: `GITHUB_CLOUD_BUILD_SUMMARY.md`
- **文档索引**: `DOCUMENTATION_INDEX.md`
- **速查表**: `ONE_PAGE_CHEATSHEET.md`

### 社区支持

- **XDA 论坛**: https://forum.xda-developers.com/c/xiaomi-mi-pad-5.12371/
- **Telegram**: 搜索 "dagu TWRP"
- **GitHub Issues**: 在你的仓库提交

---

## ✅ 立即行动！

### 最简单的路径

**Windows 用户**:
```powershell
cd e:\twrp
.\start_github_actions_build.ps1
```

**所有用户**:
1. 访问 https://github.com/b15185591889/twrp-dagu
2. 点击 "Actions" 标签
3. 选择 "Cloud TWRP Builder with China Mirror"
4. 点击 "Run workflow"
5. 保持默认配置，点绿色按钮
6. 等待 30-60 分钟
7. 下载产物！

---

## 🎉 成功公式

```
成功 = Fork + Actions + Run workflow + 等待 + 下载

就这么简单！不需要任何技术背景！
```

---

**仓库地址**: https://github.com/b15185591889/twrp-dagu  
**Actions 页面**: https://github.com/b15185591889/twrp-dagu/actions  

**祝你构建顺利！** 🚀

*最后更新：2026 年 4 月 1 日*
