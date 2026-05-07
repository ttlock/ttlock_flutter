# TTLock Flutter（On-Premise）项目介绍

`ttlock_flutter` 是 TTLock 本地化（On-Premise）场景下的 Flutter 插件工程，提供智能门锁、网关及配件设备（如遥控器、门磁、水电表等）的统一跨平台接入能力。

项目采用 **Federated Plugin（联邦插件）** 架构，使用 **Pigeon** 维护 Flutter 与原生端的强类型通信契约，目标是提升接口一致性、可维护性与扩展效率。

## 核心能力

- 门锁能力：扫描、初始化、开关锁、密码/卡/指纹/人脸管理、配置项读写等
- 网关能力：扫描、连接、初始化、网络配置
- 配件能力：遥控器、键盘、门磁、水表、电表等接入与管理
- 事件能力：基于 EventChannel 的持续事件流（扫描进度、添加卡/指纹/人脸过程等）
- 错误治理：统一错误码与 Flutter 异常模型，降低业务层适配复杂度

## 仓库结构（Monorepo）

- `ttlock_flutter`：对外聚合包（业务侧主入口）
- `ttlock_flutter_platform_interface`：Pigeon 契约定义与生成代码
- `ttlock_flutter_android`：Android 原生实现（Kotlin），**独立 Git 仓库，以 [Git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) 挂在本仓库**（远程见 `.gitmodules`）
- `ttlock_flutter_ios`：iOS 原生实现（Swift），**同上，为 submodule**
- `ttlock_flutter_ohos`：OHOS 预留实现（当前阶段未纳入默认聚合）

子模块 URL 与路径由根目录 `.gitmodules` 维护；主仓库**只记录子模块当前检出的提交（commit）**，不记录分支名。

## 技术方案亮点

- **联邦化分层**：Dart API / 契约层 / 平台实现解耦，平台演进互不阻塞
- **强类型通信**：通过 Pigeon 生成 Dart/Kotlin/Swift 代码，减少字符串协议错误
- **事件上下文治理**：扫描类与添加类流式接口在订阅前显式设置上下文参数
- **平滑兼容**：保留经典 API 适配入口（如 `ttlock_classic.dart`），降低迁移成本

## 适用场景

- 物业/公寓/酒店等本地化部署门禁系统
- 需要 Flutter 统一接入 Android + iOS 的设备控制能力
- 需要从老版 MethodChannel 插件逐步迁移到强类型新架构

## 快速开始（开发）

1. **首次克隆**：请一并拉取子模块，否则 `ttlock_flutter_android` / `ttlock_flutter_ios` 目录为空或过时。
   - 推荐：`git clone --recurse-submodules <本仓库 URL>`
   - 若已克隆未带子模块：`git submodule update --init --recursive`
2. 进入子包并安装依赖（示例）：
   - `cd ttlock_flutter/example`
   - `fvm flutter pub get`
3. 运行示例应用：
   - `fvm flutter run`

## Git 子模块（Submodule）

### 日常同步

- 拉取主仓库后，更新子模块到主仓库记录的提交：
  - `git submodule update --init --recursive`
- 若主仓库某次提交**抬升了子模块指针**，`git pull` 后同样需要执行上述命令（或 `git pull --recurse-submodules`，需 Git 配置/版本支持习惯用法）。

### 在子模块内切换分支开发

子模块目录内是完整 Git 仓库，与普通仓库相同：

```bash
cd ttlock_flutter_android   # 或 ttlock_flutter_ios
git fetch
git checkout <分支名>
# 可选：git pull
```

说明：初次进入子模块可能是 **detached HEAD**（停在某个具体 commit），`git checkout` 到分支后即可正常开发。

### 在子模块内改代码并提交

1. 在 `ttlock_flutter_android` / `ttlock_flutter_ios` 内修改、`git add`、`git commit`、`git push` 到**子模块自己的远程**。
2. 回到主仓库根目录，主仓库会显示子模块「已变更」（新 commit 指针）：
   - `git add ttlock_flutter_android ttlock_flutter_ios`（按需）
   - `git commit -m "chore: bump android/ios submodule"`
   - `git push`

团队其他人 `git pull` 主仓库后，需再执行 `git submodule update --init --recursive` 以检出对应提交。

### 跟踪子模块远程某分支（可选）

若希望在主仓库侧用一条命令把子模块拉到远程分支**最新提交**（仍会生成主仓库里的一次指针提交），可在 `.gitmodules` 中为对应 submodule 增加 `branch = <分支名>`，然后：

```bash
git submodule update --remote ttlock_flutter_android
# 或 ttlock_flutter_ios
```

之后勿忘在主仓库提交子模块指针变更。

### CI / 自动化

- 流水线检出代码时需初始化子模块（例如 GitHub Actions 使用 `submodules: recursive`，或脚本中执行 `git submodule update --init --recursive`），否则 Android/iOS 实现目录缺失会导致构建失败。

### 常见问题

- **子模块目录有改动但切不了分支**：先 `git status`，处理未提交变更或先 `stash` / 提交。
- **主仓库显示子模块 modified**：通常表示子模块当前 HEAD 与主仓库记录的 commit 不一致；要么在子模块切回记录提交，要么在子模块提交并 push 后在主仓库提交指针更新。

## 相关文档

- 架构详解：`docs/architecture.md`
- 与旧框架对比：`docs/compare-with-ttlock_flutter_premise.md`
