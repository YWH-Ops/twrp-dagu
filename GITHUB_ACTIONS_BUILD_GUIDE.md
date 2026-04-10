# GitHub Actions 云构建 TWRP 指南
## 小米平板 5 Pro 12.4 (dagu)

---

## 📋 目录

1. [快速开始](#快速开始)
2. [构建方法对比](#构建方法对比)
3. [详细步骤](#详细步骤)
4. [故障排除](#故障排除)
5. [下载构建产物](#下载构建产物)

---

## 🎯 快速开始

### 方法一：使用 GitHub Web 界面（推荐）

#### 步骤 1️⃣：Fork 仓库到你的 GitHub

1. 打开你的 GitHub 账号
2. 访问这个仓库页面
3. 点击右上角的 **"Fork"** 按钮
4. 等待 Fork 完成

#### 步骤 2️⃣：进入 Actions 页面

1. 在你的 Fork 仓库中，点击顶部的 **"Actions"** 标签
2. 在左侧工作流列表中，找到 **"Cloud TWRP Builder with China Mirror"**

#### 步骤 3️⃣：运行工作流

1. 点击 **"Cloud TWRP Builder with China Mirror"** 工作流
2. 点击右侧的 **"Run workflow"** 按钮
3. 配置构建选项：

```yaml
Use China Mirror: true          # 推荐使用，下载更快
Build Type: minimal             # 最小化构建（更快）
Upload Build Artifacts: true    # 上传构建产物
```

4. 点击绿色的 **"Run workflow"** 按钮

#### 步骤 4️⃣：等待构建完成

- ⏱️ **预计时间**: 30-60 分钟
- 📊 **进度查看**: 实时查看构建日志
- ✅ **完成通知**: GitHub 会发送邮件通知

---

## 📊 构建方法对比

| 特性 | Minimal Build | Full Build |
|------|--------------|------------|
| 下载大小 | ~5GB | ~50GB |
| 构建时间 | 30-60 分钟 | 2-4 小时 |
| 磁盘占用 | ~20GB | ~200GB |
| 成功率 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 推荐度 | ✅ 强烈推荐 | 仅高级用户 |

---

## 🔧 详细步骤

### 1. 准备工作

#### 检查清单
- [ ] GitHub 账号（已验证邮箱）
- [ ] Fork 了此仓库
- [ ] 了解 GitHub Actions 基本使用

#### 启用 Actions（如果未启用）

1. 进入你的 Fork 仓库
2. 点击 **Settings** → **Actions** → **General**
3. 确保 **"Allow all actions and reusable workflows"** 已选中
4. 保存设置

---

### 2. 配置构建选项

#### 推荐的构建配置

```yaml
use_china_mirror: 'true'     # 使用清华/中科大镜像
build_type: 'minimal'        # 最小化构建
upload_artifact: 'true'      # 上传产物到 GitHub
```

#### 各选项说明

**use_china_mirror** (使用中国镜像)
- `true`: 使用清华大学/中科大镜像，下载速度提升 10-20 倍
- `false`: 使用官方源，可能很慢

**build_type** (构建类型)
- `minimal`: 仅下载必要组件（推荐）
- `full`: 下载完整 AOSP 源码（不推荐）
- `test`: 测试构建（用于调试）

**upload_artifact** (上传产物)
- `true`: 上传到 GitHub Actions（保留 7 天）
- `false`: 不上传（节省空间）

---

### 3. 监控构建进度

#### 实时查看日志

1. 在 **Actions** 页面找到正在运行的工作流
2. 点击运行记录（通常显示为 "Run workflow in progress"）
3. 点击具体的 Job 查看详细日志
4. 滚动查看实时输出

#### 关键日志节点

```
✅ Setup Build Environment     - 环境搭建完成
✅ Download Android Source     - 源码下载完成
✅ Setup Device Tree           - 设备树配置完成
🔄 Build TWRP Recovery         - 正在构建...
⏳ Upload Build Artifacts      - 上传产物
```

---

### 4. 获取构建产物

#### 从 Artifacts 下载（推荐）

1. 构建成功后，进入该次运行的详情页面
2. 滚动到页面底部
3. 在 **Artifacts** 区域找到：
   - `twrp-dagu-{run_number}` - 包含 recovery.img
   - `build-log-{run_number}` - 构建日志
   - `build-report-{run_number}` - 构建报告

4. 点击下载对应的 artifact
5. 解压 ZIP 文件获得 `recovery.img`

#### 从 Release 下载（如果配置了）

如果工作流配置了自动创建 Release：

1. 进入仓库的 **Releases** 页面
2. 找到最新的 TWRP 版本
3. 下载 Assets 中的文件

---

## ⚠️ 故障排除

### 常见问题 1: Actions 不可用

**错误信息**: "Actions are not enabled for this repository"

**解决方案**:
```
1. Settings → Actions → General
2. 选择 "Allow all actions and reusable workflows"
3. 保存
```

### 常见问题 2: 构建超时

**错误信息**: "Job was cancelled because it exceeded the timeout"

**原因**: 
- 网络问题导致下载太慢
- 使用了默认源而非镜像

**解决方案**:
```yaml
# 重新运行，确保使用中国镜像
use_china_mirror: 'true'
build_type: 'minimal'
```

### 常见问题 3: 内存不足

**错误信息**: "No space left on device" 或 "Out of memory"

**解决方案**:
```yaml
# 使用 minimal build
build_type: 'minimal'

# 或者尝试 test build
build_type: 'test'
```

### 常见问题 4: 找不到 recovery.img

**错误信息**: "❌ Recovery image not created"

**排查步骤**:

1. **检查构建日志**
   ```bash
   # 查看最后 100 行
   tail -100 build.log
   ```

2. **常见原因**
   - 内核文件缺失或损坏
   - 设备树配置错误
   - 缺少依赖项

3. **解决方案**
   - 重新运行构建（有时是随机错误）
   - 切换到不同的构建类型
   - 检查设备树文件完整性

---

## 📥 下载构建产物

### 方法一：直接从浏览器下载

1. 打开构建成功的 Actions 页面
2. 点击底部的 artifact 名称
3. 等待下载完成（可能需要几分钟）

### 方法二：使用 wget 下载（Linux/Mac）

```bash
# 获取下载链接（需要替换 URL）
wget https://github.com/YOUR_USERNAME/YOUR_REPO/actions/runs/RUN_ID/artifacts/ARTIFACT_ID.zip

# 解压
unzip artifacts.zip
```

### 方法三：使用 PowerShell 下载（Windows）

```powershell
# 下载（需要替换 URL）
Invoke-WebRequest -Uri "https://github.com/YOUR_USERNAME/YOUR_REPO/actions/runs/RUN_ID/artifacts/ARTIFACT_ID.zip" -OutFile "twrp-dagu.zip"

# 解压
Expand-Archive -Path "twrp-dagu.zip" -DestinationPath "."
```

---

## 🎉 构建成功后的操作

### 1. 验证构建产物

```bash
# 检查文件大小（应该在 64-128MB 之间）
ls -lh recovery.img

# 检查文件类型
file recovery.img
```

### 2. 测试刷入（不永久写入）

```bash
# 进入 fastboot 模式
adb reboot bootloader

# 临时启动 TWRP（测试用）
fastboot boot recovery.img
```

### 3. 永久刷入

```bash
# 进入 fastboot
adb reboot bootloader

# 刷入 recovery
fastboot flash recovery recovery.img

# 重启到 recovery
fastboot reboot recovery
```

---

## 📊 构建统计

### GitHub Actions 限制

| 项目 | 限制 | 备注 |
|------|------|------|
| 单次运行最长时间 | 72 小时 | 远超 TWRP 构建需求 |
| 每月免费额度 | 2000 分钟 | 约可构建 30-40 次 |
| 并发 Jobs | 取决于账户 | 免费账户通常为 1 |
| Artifact 存储 | 7 天 | 及时下载重要文件 |

### 优化建议

1. **使用 ccache**: 第二次构建可提速 30-50%
2. **Minimal Build**: 只下载必要组件
3. **China Mirror**: 下载速度提升 10-20 倍
4. **定时清理**: 删除旧的 workflow runs 释放空间

---

## 🔗 相关资源

### 官方文档
- [GitHub Actions 文档](https://docs.github.com/en/actions)
- [TWRP 官网](https://twrp.me)
- [AOSP 构建指南](https://source.android.com/setup/build)

### 社区支持
- [XDA 论坛 - 小米平板 5](https://forum.xda-developers.com/c/xiaomi-mi-pad-5.12371/)
- [TWRP GitHub](https://github.com/TeamWin)
- [Telegram TWRP 群组](https://t.me/TWRPComm)

---

## 📝 总结

### ✅ 优点
- 🚀 **无需本地环境** - 完全在云端构建
- 💰 **零成本** - 使用 GitHub 免费额度
- ⚡ **速度快** - 使用镜像加速
- 📦 **自动化** - 一键触发，自动通知
- 🔄 **可重复** - 随时重新构建

### ⚠️ 注意事项
- 及时下载 artifacts（7 天后自动删除）
- 合理使用免费额度（每月 2000 分钟）
- 首次构建可能需要多次尝试
- 建议在非高峰时段构建

---

## 🎯 下一步

1. **立即开始构建** → 前往 Actions 页面
2. **查看已有构建** → 检查 output 目录
3. **学习刷机方法** → 阅读 INSTALL.md
4. **反馈问题** → 提交 Issue 或讨论

---

**构建愉快！** 🎉

如有问题，请查看故障排除部分或联系社区支持。
